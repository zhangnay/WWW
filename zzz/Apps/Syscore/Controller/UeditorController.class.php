<?php
/**
* 百度编辑器控制器
*/
namespace Syscore\Controller;
use Think\Controller;
class UeditorController extends BaseController{
	
	private $thumb;//缩略图模式(看ThinkPHP手册)
	private $thumbnail;//是否启用缩略图
	private $water;	//是否加水印(0:无水印,1:水印文字,2水印图片)
	private $waterText;//水印文字
	private $waterfont;//水印字体
	private $watersize;//水印文字大小
	private $watercolor;//水印文字颜色
	private $waterImage;//水印图片
	private $transparency;//水印透明度
	private $waterPosition;//水印位置
	private $thumbwidth;//缩略图宽度
	private $thumbheight;//缩略图高度
	private $imageMaxSize;//图片上传大小限制
	private $fileMaxSize;//文件上传大小限制
	private $savePath; //保存位置
	private $userid; //操作用户名


	public function _initialize(){
		$this->userid=empty($_SESSION['userid'])? $_GET['userid'] : $_SESSION['userid'];
		if(empty($this->userid)){
			$this->userid= 'anonymity';
		}

		$this->rootPath= './uploads/';
		$this->savePath='';
		$this->thumb=C('thumb');
		$this->thumbnail=C('thumbnail');
		$this->water=C('water');
		$this->waterText=C('waterText');
		$this->waterfont='./Public/font/'.C('waterfont');
		$this->watersize=C('watersize');
		$this->watercolor=C('watercolor');
		$this->waterImage='.'.C('waterImage');
		$this->transparency=C('transparency');
 		$this->waterPosition= C('waterPosition');
		$this->thumbwidth=C('thumbwidth');
		$this->thumbheight=C('thumbheight');
		$this->fileMaxSize=C('fileMaxSize')*1024*1024;
		$this->imageMaxSize=C('imageMaxSize')*1024;
	}

	public function index(){
		$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents(CONF_PATH."config.json")), true);

		$action = htmlspecialchars($_GET['action']);
		switch ($action) {
		    case 'config':
		        $result =  json_encode($CONFIG);
		        break;

		    /* 上传图片 */
		    case 'uploadimage':
		        $config = array(
		            "pathFormat" => $CONFIG['imagePathFormat'],
		            "maxSize" => $this->imageMaxSize,
		            "allowFiles" => $CONFIG['imageAllowFiles']
		        );
		        $fieldName = $CONFIG['imageFieldName'];
		        $result=$this->upFile($config, $fieldName);
		        break;

		    /* 上传涂鸦 */
		    case 'uploadscrawl':
		        $config = array(
		            "pathFormat" => $CONFIG['scrawlPathFormat'],
		            "maxSize" => $CONFIG['scrawlMaxSize'],
		            "allowFiles" => $CONFIG['scrawlAllowFiles'],
		            "oriName" => "scrawl.png"
		        );
		        $fieldName = $CONFIG['scrawlFieldName'];
		        $base64 = "base64";
		        $result=$this->upBase64($config,$fieldName);
		        break;

		    /* 上传视频 */
		    case 'uploadvideo':
		        $config = array(
		            "pathFormat" => $CONFIG['videoPathFormat'],
		            "maxSize" => $CONFIG['videoMaxSize'],
		            "allowFiles" => $CONFIG['videoAllowFiles']
		        );
		        $fieldName = $CONFIG['videoFieldName'];
		        $result=$this->upFile($config, $fieldName);
		        break;

		    /* 上传文件 */
		    case 'uploadfile':
		    // default:
		        $config = array(
		            "pathFormat" => $CONFIG['filePathFormat'],
		            "maxSize" => $this->fileMaxSize,
		            "allowFiles" => $CONFIG['fileAllowFiles']
		        );
		        $fieldName = $CONFIG['fileFieldName'];
		        $result=$this->upFile($config, $fieldName);
		        break;

		    /* 列出图片 */
		    case 'listimage':
			$allowFiles = $CONFIG['imageManagerAllowFiles'];
			$listSize = $CONFIG['imageManagerListSize'];
			$path = $CONFIG['imageManagerListPath'];
			$get=$_GET;
			$result =$this->file_list($allowFiles, $listSize, $get);
		        	break;
		    /* 列出文件 */
		    case 'listfile':
			$allowFiles = $CONFIG['fileManagerAllowFiles'];
			$listSize = $CONFIG['fileManagerListSize'];
			$path = $CONFIG['fileManagerListPath'];
			$get=$_GET;
			$result =$this->file_list($allowFiles, $listSize, $get);
	    	            break;

		    /* 抓取远程文件 */
		    case 'catchimage':
		    	$config = array(
			    "pathFormat" => $CONFIG['catcherPathFormat'],
			    "maxSize" => $CONFIG['catcherMaxSize'],
			    "allowFiles" => $CONFIG['catcherAllowFiles'],
			    "oriName" => "remote.png"
			);
			$fieldName = $CONFIG['catcherFieldName'];
			/* 抓取远程图片 */
			$list = array();
			if (isset($_POST[$fieldName])) {
			    $source = $_POST[$fieldName];
			} else {
			    $source = $_GET[$fieldName];
			}
			foreach ($source as $imgUrl) {
			    $info=json_decode($this->saveRemote($config, $imgUrl),true);
			    // dump($info);
			    array_push($list, array(
			        "state" => $info["state"],
			        "url" => $info["url"],
			        "size" => $info["size"],
			        "title" => htmlspecialchars($info["title"]),
			        "original" => htmlspecialchars($info["original"]),
			        "source" => htmlspecialchars($imgUrl)
			    ));
			}

			$result= json_encode(array(
			    'state'=> count($list) ? 'SUCCESS':'ERROR',
			    'list'=> $list
			));
		        break;

		    default:
		        $result = json_encode(array(
		            'state'=> L('u_require_url_error')
		        ));
		        break;
		}

		/* 输出结果 */
		if (isset($_GET["callback"])) {
		    if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
		        echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
		    } else {
		        echo json_encode(array(
		            'state'=> 'callback'.L('u_parameter_error')
		        ));
		    }
		} else {
		    echo $result;
		}

	}
	/**
	     * 上传文件的主处理方法
	     * @return mixed
	     */
	private function upFile($config,$fieldName){
		$conf=array(
			'rootPath' => $this->rootPath,
			'savePath' => $this->savePath,
			'autoSub' => true,
			'subName'=>$this->userid . '/' . date('Ym',time()) ,// 子目录命名的规则为 用户名/年月/
			'maxSize'=>$config['maxSize'],
			'exts'=>$this->format_exts($config['allowFiles']),//去除扩展名前的点 .
			);

		$upload=new \Think\Upload($conf);
		$info=$upload->uploadOne($_FILES[$fieldName]);
		if($info){
			$fname=$upload->rootPath .$info['savepath'].$info['savename'];
			$imagearr = explode(',', 'jpg,gif,png,jpeg,bmp,ttf,tif'); 
			$info['ext']= strtolower($info['ext']);

			$isimage = in_array($info['ext'],$imagearr) ? 1 : 0;
			if ($isimage) {
				$image=new \Think\Image();
				$image->Open($fname);
				$width = $image->width(); // 返回图片的宽度
                $height = $image->height();
				if($this->thumbnail==1){//是否启用缩略图模式
				    $image->thumb($this->thumbwidth,$this->thumbheight,$this->thumb)->save($fname);
				}
				if ($this->water==1) {
					$image->text($this->waterText,$this->waterfont,$this->watersize,$this->watercolor,$this->waterPosition,array(-2,0))->save($fname); 
				}
				if ($this->water==2) {
					$image->water($this->waterImage,$this->waterPosition,$this->transparency)->save($fname);
				}	
			}

			$data=array(
				'state'=>'SUCCESS',
				'url'=>__ROOT__. strtolower(substr($fname,1)),
				'title'=>$info['savename'],
				'original'=>$info['name'],
				'type'=>'.' . $info['ext'],
				'size'=>$info['size'],
				);
		}else{
			$data=array(
				'state'=>$upload->getError(),
				);
		}
		return json_encode($data);
	}

	/**
	 * 处理base64编码的图片上传
	 * @return mixed
	 */
	private function upBase64($config,$fieldName)
	{
	    $base64Data = $_POST[$fieldName];
	    $img = base64_decode($base64Data);

	    $dirname=$this->rootPath . $this->savePath . $this->userid . '/scrawl/';
	    $file['filesize']=strlen($img);
	    $file['oriName']=$config['oriName'];
	    $file['ext']=strtolower(strrchr($config['oriName'], '.'));
	    $file['name']= uniqid() .  $file['ext'];
	    $file['fullName']=$dirname . $file['name'];
	    $fullName=$file['fullName'];
	    // dump($file);

 	//检查文件大小是否超出限制
	    if ($file['filesize'] >= ($config["maxSize"])) {
  		$data=array(
			'state'=>L('u_filesize_error'),
		);
		return json_encode($data);
	    }

	    //创建目录失败
	    if (!file_exists($dirname) && !mkdir($dirname, 0777, true)) {
	           $data=array(
			'state'=>L('u_directory_create_fail'),
		);
		return json_encode($data);
	    } else if (!is_writeable($dirname)) {
	         $data=array(
			'state'=>L('u_directory_auth_fail'),
		);
		return json_encode($data);
	    }

	    //移动文件
	    if (!(file_put_contents($fullName, $img) && file_exists($fullName))) { //移动失败
        	         $data=array(
		'state'=>L('u_file_content_write_fail'),
		);
	    } else { //移动成功	       
	        	$data=array(
			'state'=>'SUCCESS',
			'url'=>__ROOT__ . substr($file['fullName'],1),
			'title'=>$file['name'],
			'original'=>$file['oriName'],
			'type'=>$file['ext'],
			'size'=>$file['filesize'],
		);
	    }
	    return json_encode($data);
	}

	/**
	 * 拉取远程图片
	 * @return mixed
	 */
	private function saveRemote($config, $fieldName)
	{
	    $imgUrl = htmlspecialchars($fieldName);
	    $imgUrl = str_replace("&amp;", "&", $imgUrl);

	    //http开头验证
	    if (strpos($imgUrl, "http") !== 0) {
	         $data=array(
		'state'=>L('u_not_http_link'),
		);
	         return json_encode($data);
	    }
	    //获取请求头并检测死链
	    $heads = get_headers($imgUrl);
	    if (!(stristr($heads[0], "200") && stristr($heads[0], "OK"))) {
	         $data=array(
		'state'=>L('u_link_cannot_use'),
		);
	         return json_encode($data);
	    }
	    //格式验证(扩展名验证和Content-Type验证)
	    $fileType = strtolower(strrchr($imgUrl, '.'));
	    if (!in_array($fileType, $config['allowFiles']) || stristr($heads['Content-Type'], "image")) {
	        $data=array(
		'state'=>L('u_content_type_error'),
		);
	         return json_encode($data);
	    }

	    //打开输出缓冲区并获取远程图片
	    ob_start();
	    $context = stream_context_create(
	        array('http' => array(
	            'follow_location' => false // don't follow redirects
	        ))
	    );
	    readfile($imgUrl, false, $context);
	    $img = ob_get_contents();
	    ob_end_clean();
	    preg_match("/[\/]([^\/]*)[\.]?[^\.\/]*$/", $imgUrl, $m);

	    $dirname=$this->rootPath . $this->savePath . $this->userid . '/remote/';
	    $file['oriName']=$m ? $m[1]:"";
	    $file['filesize']=strlen($img);
	    $file['ext']=strtolower(strrchr($config['oriName'], '.'));
	    $file['name']= uniqid() .  $file['ext'];
	    $file['fullName']=$dirname . $file['name'];
	    $fullName=$file['fullName'];

	    //检查文件大小是否超出限制
	    if ($file['filesize'] >= ($config["maxSize"])) {
  		$data=array(
			'state'=>L('u_filesize_error'),
		);
		return json_encode($data);
	    }

	    //创建目录失败
	    if (!file_exists($dirname) && !mkdir($dirname, 0777, true)) {
  		$data=array(
			'state'=>L('u_directory_create_fail'),
		);
		return json_encode($data);
	    } else if (!is_writeable($dirname)) {
  		$data=array(
			'state'=>L('u_directory_auth_fail'),
		);
		return json_encode($data);
	    }

	    //移动文件
	    if (!(file_put_contents($fullName, $img) && file_exists($fullName))) { //移动失败
  		$data=array(
			'state'=>L('u_file_content_write_fail'),
		);
		return json_encode($data);
	    } else { //移动成功
	       	 $data=array(
			'state'=>'SUCCESS',
			'url'=>__ROOT__ . substr($file['fullName'],1),
			'title'=>$file['name'],
			'original'=>$file['oriName'],
			'type'=>$file['ext'],
			'size'=>$file['filesize'],
		);
	    }
	    return json_encode($data);
	}
	private function file_list($allowFiles, $listSize, $get){
		$dirname=$this->rootPath . $this->savePath ;
		if ($this->userid!='admin') {
			$dirname.=$this->userid . '/';
		}
		$allowFiles = substr(str_replace(".", "|", join("", $allowFiles)), 1);

		/* 获取参数 */
		$size = isset($get['size']) ? htmlspecialchars($get['size']) : $listSize;
		$start = isset($get['start']) ? htmlspecialchars($get['start']) : 0;
		$end = $start + $size;

		/* 获取文件列表 */
		// $path = $_SERVER['DOCUMENT_ROOT'] . (substr($path, 0, 1) == "/" ? "":"/") . $path;
		$path=$dirname;
		$files = $this->getfiles($path, $allowFiles);
		if (!count($files)) {
		    return json_encode(array(
		        "state" => "no match file",
		        "list" => array(),
		        "start" => $start,
		        "total" => count($files)
		    ));
		}

		/* 获取指定范围的列表 */
		$len = count($files);
		for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
		    $list[] = $files[$i];
		}
		//倒序
		//for ($i = $end, $list = array(); $i < $len && $i < $end; $i++){
		//    $list[] = $files[$i];
		//}

		/* 返回数据 */
		$result = json_encode(array(
		    "state" => "SUCCESS",
		    "list" => $list,
		    "start" => $start,
		    "total" => count($files)
		));

		return $result;
	}

   	 /**
	     * 遍历获取目录下的指定类型的文件
	     * @param $path
	     * @param array $files
	     * @return array
	     */
	    private function getfiles( $path , $allowFiles, &$files = array() ) {
	        if ( !is_dir( $path ) ) return null;
	        if(substr($path, strlen($path) - 1) != '/') $path .= '/';
	        $handle = opendir( $path);
	        while ( false !== ( $file = readdir( $handle ) ) ) {
	            if ( $file != '.' && $file != '..' ) {
	                $path2 = $path . $file;
	                if ( is_dir( $path2)) {
	                    $this->getfiles( $path2 ,$allowFiles,  $files );
	                } else {
		                if (preg_match("/\.(".$allowFiles.")$/i", $file)) {
		                    $files[] = array(
		                        'url'=> __ROOT__ . substr($path2, 1),
		                        'mtime'=> filemtime($path2)
		                    );
		                }
	                }
	            }
	        }
	        return $files;
	    }
	    /**
	     * [formatUrl 格式化url，用于将getfiles返回的文件路径进行格式化，起因是中文文件名的不支持浏览]
	     * @param  [type] $files [文件数组]
	     * @return [type]        [格式化后的文件数组]
	     */
	    private function formatUrl($files){
	    	if(!is_array($files)) return $files;
	    	foreach ($files as  $key => $value) {
	    		$data=array();
	    		$data=explode('/', $value);
	    		foreach ($data as $k=>$v) {
	    			if($v!='.' && $v!='..'){
	    				$data[$k]=urlencode($v);
	    				$data[$k] = str_replace("+", "%20", $data[$k]); 
	    			}
	    		}
	    		$files[$key]=implode('/', $data);
	    	}
	    	return $files;
	    }	


	private function format_exts($exts){
		$data=array();
		foreach ($exts as $key => $value) {
			$data[]=ltrim($value,'.');
		}
		return $data;
	}

}
?>