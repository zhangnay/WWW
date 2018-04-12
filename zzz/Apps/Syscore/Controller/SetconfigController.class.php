<?php
namespace Syscore\Controller;
use Think\Controller;

class SetconfigController extends BaseController{
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        if(!IS_POST){
            $this->display();
		}else{
		    $str = "<?php
			return array(
			'URL_MODEL' => ".I('post.URL_MODEL').",//URL伪静态模式
			'water' => '".I('post.water')."',
			'waterPosition' => '".I('post.waterPosition')."',
			'waterImage' => '".I('post.waterImage')."',
			'transparency' => '".I('post.transparency')."',
			'waterText' => '".I('post.waterText')."',
			'waterfont' => '".I('post.waterfont')."',
			'watercolor' => '".I('post.watercolor')."',
			'watersize' => '".I('post.watersize')."',
			'thumb' => '".I('post.thumb')."',
			'thumbwidth' => '".I('post.thumbwidth')."',
			'thumbheight' => '".I('post.thumbheight')."',
			'imageMaxSize' => '".I('post.imageMaxSize')."',
			'fileMaxSize' => '".I('post.fileMaxSize')."',
			'separator' => '".I('post.separator')."',
			'istitle' => '".I('post.istitle')."',
			'authgroup' => '".I('post.authgroup')."',
			'authrule' => '".I('post.authrule')."',
			'language' => '".I('post.language')."',
			'module' => '".I('post.module')."',
			'parametersetting' => '".I('post.parametersetting')."',
			'navigation' => '".I('post.navigation')."',
			'advertisement' => '".I('post.advertisement')."',
			'comment' => '".I('post.comment')."',
			'seosetting' => '".I('post.seosetting')."',
			'area' => '".I('post.area')."',
			'copyright' => '".I('post.copyright')."',
			'chat' => '".I('post.chat')."',
			'thumbnail' => '".I('post.thumbnail')."',
			'databackup' => '".I('post.databackup')."',
			
            );";
		    $result = file_put_contents(CONF_PATH.'set_config.php', $str);
		    $result ? $this->success(L('c_success')) : $this->error(L('c_edit_fail').CONF_PATH.'set_config.php'.L('c_file_auth'));
		}
    }

}
