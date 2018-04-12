<?php
namespace Syscore\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function index(){
		//右上角欢迎词
        $helloWords="当问题发生时寻找解决方法，而不是找代罪羔羊。**永远战战兢兢，永远如履薄冰。**只有淡季的思想，没有淡季的市场。**领导在与不在，企业照样良性运转。**听多数人的意见，跟少数人商量，一个人说了算。**黑猫，白猫，能抓老鼠的就是好猫。**有理想在的地方，地狱都是天堂。**千里之行，始于足下。";
		if(C('DEFAULT_LANG')=="en" or I('get.lan')=="en") $helloWords="A thousand-li journey is started by taking the first step.**Little stone fell great oaks.**Where there is a will, there is a way.**Do one thing at a time, and do well.";
        $helloWords=explode("**", $helloWords);
        $helloChosen=$helloWords[mt_rand(0,(count($helloWords)-1))];
        $this->assign('helloChosen', $helloChosen);
		//判断春夏秋冬显示背景
        $month=date("n");
        if($month==3 or $month==4 or $month==5){
            $season="spring";
        }elseif($month==6 or $month==7 or $month==8){
            $season="summer";
        }elseif($month==9 or $month==10 or $month==11){
            $season="autumn";
        }else{
            $season="winter";
        }
		$this->assign('season', $season);
		//登录语言选择
        $this->assign('lanlist', getLanguage(4));
		//版权信息
		$this->assign('system_url','localhost');
		$this->assign('system_version','v3.0.4_20161023');
        $this->display();
    }
    //登陆验证
    public function login(){
        if(!IS_POST)$this->error(L('c_illegal_request'));
        $member = M('User'); $username =I('username'); $password =I('password','','md5'); $code = I('verify','','strtolower');
        //验证验证码是否正确
        if(!($this->check_verify($code))) $this->error(L('c_error_verify'));
        //验证账号密码是否正确
        $user = $member->where(array('username'=>$username,'password'=>$password))->find();
        if(!$user) $this->error(L('c_error_username_or_password'));
		$userid = $user['id'];
		//写入session
        session('userid',$userid);
        session('username',$user['username']);
        session('realname',$user['realname']);
        session('email',$user['email']);
        session('avatar',$user['avatar']);
		$groupid = M("Auth_group_access")->find($userid)['group_id'];
		$rules = M("Auth_group")->find($groupid)['rules'];
		$arr_rules=explode(',',$rules);
        session('authGroupid',$groupid);
        session('rules',$arr_rules);
        ismobile() ? session('ismobile','yes') : session('ismobile','');//判断手机版还是电脑版
		session('system_url','localhost');//授权URL
		session('system_version','v3.0.4_20161023');//系统版本
        //重定向到首页
        $this->success(L('c_success_login'),U('Index/index'));
    }
    //生成验证码
    public function verify(){
        $Verify = new \Think\Verify();
        $Verify->codeSet = '3456789ABCDEFGHJKLMNPQRSTUVWXY';
        $Verify->fontSize = 30;
        $Verify->length = 4;
        $Verify->fontttf = '4.ttf';
        $Verify->useCurve = false;
        $Verify->entry();
    }
	//检查验证码
    protected function check_verify($code){
        $verify = new \Think\Verify();
        return $verify->check($code);
    }
	//退出登录
    public function logout(){
        session(null);
		//重定向到登录界面
        redirect(U('Login/index'));
    }
}