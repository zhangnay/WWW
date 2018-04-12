<?php
namespace Syscore\Controller;
use Think\Controller;
use Think\Auth;

class BaseController extends Controller {
    public function _initialize(){
        $userid = session('userid');
        //判断用户是否登陆
        if(!isset($userid)) redirect(U('Login/index'));
//
//        //判断是否获取语言变量
//		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
//		if(empty($lan)) redirect(__SELF__);
		
	    //头部语言循环
		$headlan = getLanguage();
		$this->assign('headlan',$headlan);
		//头部当前语言
		$language = M('Language');
		$nowLanWhere['mulu'] = I('get.lan');
		$nowLan = $language->where($nowLanWhere)->find();
		$this->assign('nowLan',$nowLan);
		
		//默认语言
		$this->assign('defaultlan',$language->where('isdefault=1')->find()['mulu']);
		
		//启用的语言数量
		$languageNum = $language->where('status=1')->Count();
        $this->assign('languageNum',$languageNum);
		
        //（左侧）模块循环
	    $modulers = getModuleList();
		$this->assign('modulelist',$modulers);
		
		//导航变量
		IS_POST ? $moduleid = I('post.moduleid') : $moduleid = I('get.moduleid');
		$Module = M('Module')->find($moduleid);
		$this->assign('modulenav',$Module);

        if(($userid == 1)) return true;//管理员允许访问任何页面 

        //  检测当前页是否有权限访问      // ' Syscore/index/index'
        $rule  = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
		$Auth = new Auth();
        if(!$Auth->check($rule,$userid)) $this->error(L('c_no_auth'),U('Index/Index' ));

    }

}