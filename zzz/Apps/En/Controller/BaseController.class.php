<?php
namespace En\Controller;
use Think\Controller;
class BaseController extends Controller {
    public function _initialize(){
	    //语言循环
		$language = getLanguage();
		$this->assign('language',$language);
		
        //面包屑导航	
		switch(CONTROLLER_NAME){
            case "News":
                $moduleid = 2;
                break;
            case "Down":
                $moduleid = 3;
                break;
            case "Page":
                $moduleid = 4;
                break;
            case "Project":
                $moduleid = 5;
                break;
            default:
                $moduleid = 1;
        }
		$sortnav = getCommonSort($moduleid);
		$this->assign('sortnav',$sortnav);
		
		//幻灯片
		$lan = C('DEFAULT_LANG');
		$adBannerWhere = "find_in_set('pc',client) and typeid=1 and position='".CONTROLLER_NAME."' and lan='".$lan."'";
	    $this->assign("adRs",M('Ad')->where($adBannerWhere)->order("sequence desc,id desc")->find());
		
 		//全局参数
		$where['lan'] = $lan;
		$fieldRs = M('Field')->where($where)->order("id desc")->select();
		foreach($fieldRs as $k => $w){
		    $this->assign($w['fieldlabel'],$w['fieldvalue']);
		}
    }

}