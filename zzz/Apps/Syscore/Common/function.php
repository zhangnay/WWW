<?php
//权限赋值，添加编辑权限组模板页面用到
function authRule($rules_array){
	$authRuleTable = M('Auth_rule');
	$authruleWhere['parentid'] = 0;
	$authruleWhere['modulesign'] = 'web';
	
	$authruleData = $authRuleTable->where($authruleWhere)->order('sequence desc,id desc')->select();
	foreach ($authruleData as $k => $v){
		in_array($v['id'],$rules_array) ? $checked = "checked=\"checked\"" : $checked = "";
		echo "<div class=\"panel-group accordion faq-content\" id=\"accordion1\">";
		echo "    <div class=\"panel panel-default\">";
		echo "        <div class=\"panel-heading\">";
		echo "            <h4 class=\"panel-title\">";
		echo "                <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion1\" href=\"#collapse_".($k+1)."\">";
		echo "                    &nbsp;<span class=\"fl\">".($k+1)." ".$v['title']."</span>";
		$childWhere['parentid'] = $v['id'];
		$childData = $authRuleTable->where($childWhere)->select();
		if($childData) echo "     <span class=\"fr\">+</span>";
		echo "                </a>";
		echo "            </h4>";
		echo "        </div>";
		if($childData){
		    echo "    <div id=\"collapse_".($k+1)."\" class=\"panel-collapse collapse\">";
		    echo "        <div class=\"panel-body\">";
			echo "            <div class=\"icheck-inline\">";
			echo "                <div class=\"check_cursor\"><label><input name=\"rules[]\" type=\"checkbox\" value=\"".$v['id']."\" $checked /> ".$v['title']."</label></div>";
			foreach ($childData as $k => $w){
				in_array($w['id'],$rules_array) ? $childChecked = "checked=\"checked\"" : $childChecked = "";
				echo "            <div class=\"check_cursor\"><label><input name=\"rules[]\" type=\"checkbox\" value=\"".$w['id']."\" $childChecked /> ".$w['title']."</label></div>";
			}
			echo "            </div>";
		    echo "        </div>";
		    echo "    </div>";
		}
		echo "    </div>";
		echo "</div>";
	}
}

//（左侧）模块循环
function getModuleList(){
    $modulewhere['disabled'] = 1;
    $modulers = M('Module')->where($modulewhere)->order('sequence desc,id asc')->select();
    return $modulers; 
}

//多语言设置
function getLanguage($num=4){
    $lan   =   M('Language');
    $where['status'] = 1;
    $language = $lan->where($where)->order('sequence desc,id desc')->limit($num)->select();
	return $language;
}

//分类是否存在
function isSort($moduleid=1,$lan="ch"){
    $Sort   =   M('Sort');
    $where['moduleid'] = $moduleid;
    $where['lan'] = $lan;
    $haveSort = $Sort->where($where)->select();
	return $haveSort;
}

//地区是否存在
function isArea($lan="ch"){
    $Area   =   M('Area');
    $where['lan'] = $lan;
    $haveArea = $Area->where($where)->select();
	return $haveArea;
}

//分页函数：$count要分页的总记录数 $pagesize每页查询条数 return \Think\Page
function getPage($count, $pagesize = 20){
    $p = new Think\Page($count, $pagesize);
    $p->setConfig('header', '<li class="rows">'.L('v_total').' <b>%TOTAL_ROW%</b> '.L('v_records').'&nbsp;&nbsp;&nbsp;&nbsp; '.L('v_total').' <b><font class="red">%NOW_PAGE%</font> / %TOTAL_PAGE%</b> '.L('v_page').'</li>');
    $p->setConfig('prev', '上一页');
    $p->setConfig('next', '下一页');
    $p->setConfig('last', '末页');
    $p->setConfig('first', '首页');
    $p->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');
    $p->lastSuffix = false;//最后一页不显示为总页数
    return $p;
}

//无限级别分类
function getSort($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getSort($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//无限级别评论
function getComment($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getComment($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//无限级别导航(通用接口)
function getNavigation($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getNavigation($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//无限级别分类
function getCategory($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getCategory($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//无限级别权限
function getAuthRule($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getAuthRule($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//无限级别地区（模块调用地区：子级->父级）
function getArea($data,$id,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['id'] == $id){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getArea($data,$v['parentid'],'|---',$level+1));
		}
	}
	return $temp;
}

//通用无限分类数组（父级->子级），如：地区
function getChildArr($table,$id=0,$lan){ 
    $where['parentid']=$id;
    empty($lan) ? $where['lan']=C('DEFAULT_LANG') : $where['lan']=$lan;
	if($table=="Area") $tableArr = M($table)->field('areaname,id')->where($where)->select();
    $arr = array(); 
    foreach ($tableArr as $k => $rs) {
        $rs[] = getChildArr($table,$rs['id']);
        $arr[] = $rs; //组合数组
    } 
    return $arr; 
} 

//通用无限分类列表（子级->父级），如：Customer/view里的地区
function getCommonParent($data,$id,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['id'] == $id){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge(getCommonParent($data,$v['parentid'],'|---',$level+1),$temp);
		}
	}
	return $temp;
}


//无限级别地区（地区管理：父级->子级）
function getAreaEdit($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getAreaEdit($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//获取用户真实IP
function getClientIp() {
	if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
		$ip = getenv("HTTP_CLIENT_IP");
	else
		if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
			$ip = getenv("HTTP_X_FORWARDED_FOR");
		else
			if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
				$ip = getenv("REMOTE_ADDR");
			else
				if (isset ($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
					$ip = $_SERVER['REMOTE_ADDR'];
				else
					$ip = "unknown";
	return ($ip);
}

/**清除缓存
 * 删除目录及目录下所有文件或删除指定文件
 * @param str $path   待删除目录路径
 * @param int $delDir 是否删除目录，1或true删除目录，0或false则只删除文件保留目录（包含子目录）
 * @return bool 返回删除状态
 */
function delDirAndFile($path,$delDir=false){
    $handle = opendir($path);
    if($handle){
        while(false !== ( $item = readdir($handle) )) {
            if($item != "." && $item != "..") is_dir("$path/$item") ? delDirAndFile("$path/$item", $delDir) : unlink("$path/$item");
        }
        closedir($handle);
        if($delDir) return rmdir($path);
    }else{
        if(file_exists($path)){
            return unlink($path);
        }else{
            return false;
        }
    }
}	

//数据库备份****处理方法
function rmdirr($dirname) {
    if (!file_exists($dirname)) {
        return false;
    }
    if (is_file($dirname) || is_link($dirname)) {
        return unlink($dirname);
    }
    $dir = dir($dirname);
    if ($dir) {
        while (false !== $entry = $dir->read()) {
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            //递归
            rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
        }
    }
}

//数据库备份****公共函数
//获取文件修改时间
function getfiletime($file, $DataDir) {
    $a = filemtime($DataDir . $file);
    $time = date("Y-m-d H:i:s", $a);
    return $time;
}

//数据库备份****获取文件的大小
function getfilesize($file, $DataDir) {
    $perms = stat($DataDir . $file);
    $size = $perms['size'];
    // 单位自动转换函数
    $kb = 1024;         // Kilobyte
    $mb = 1024 * $kb;   // Megabyte
    $gb = 1024 * $mb;   // Gigabyte
    $tb = 1024 * $gb;   // Terabyte

    if ($size < $kb) {
        return $size . " B";
    } else if ($size < $mb) {
        return round($size / $kb, 2) . " KB";
    } else if ($size < $gb) {
        return round($size / $mb, 2) . " MB";
    } else if ($size < $tb) {
        return round($size / $gb, 2) . " GB";
    } else {
        return round($size / $tb, 2) . " TB";
    }
}

//移动端和PC端的判断
function ismobile(){
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])) return true;
    //此条摘自TPM智能切换模板引擎，适合TPM开发
    if(isset ($_SERVER['HTTP_CLIENT']) &&'PhoneClient'==$_SERVER['HTTP_CLIENT']) return true;
    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
        //找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
    //判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array(
            'nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'
        );
        //从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    //协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}
?>