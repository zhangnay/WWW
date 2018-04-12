<?php
namespace Syscore\Controller;
use Think\Controller;
class UserController extends BaseController{
    //添加 / 编辑信息
    public function edit($id=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    //判断用户组是否存在
		$AuthGroupWhere['status'] = 1;
	    if(M('Auth_group')->where($AuthGroupWhere)->select()==false) $this->error(L('c_add_authgroup_first'));
		
		$id=I('id');
	    if(!IS_POST){
            $user   =   M('User');
		
		    //所属用户组
		    $AuthGroup = M('Auth_group')->where($AuthGroupWhere)->order('id desc')->select();
            $this->assign('AuthGroup',$AuthGroup);
		
		    //用户-用户组
            $this->assign('AuthGroupAccess',M('Auth_group_access')->find($id));

            $this->assign('rs',$user->find($id));
			
            $this->display();
		}else{
            $user   =   D('User');
			
			//密码为空时不修改密码
			$password = I("post.password");
			if(empty($password) && !empty($id)){
			    unset($_POST['password']);
			    unset($_POST['vpassword']);
			}
			
            if($user->create()){
			    $user->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($user->getError());
            }
		}
    }

    //用分页读取管理员
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        if($keyword == ""){
            $user = D('UserView');     
        }else{
            $where['username'] = array('like',"%$keyword%");
            $where['realname'] = array('like',"%$keyword%");

            $where['_logic'] = 'or';
            $user = D('UserView')->where($where); 
        } 
	
        $count = $user->where($where)->count();
        $p = getpage($count,20);
        $rs = $user->field(true)->where($where)->order('id')->limit($p->firstRow.','. $p->listRows)->select();
        $this->assign('list', $rs); // 赋值数据集
        $this->assign('page', $p->show()); // 赋值分页输出

        $this->display();

    }
	
	//删除管理员(单条)
    public function delete_one($id){
	    if($id==1) $this->error(L('c_delete_cannot_admin'));
        $user = M('User');
        $rs=$user->delete($id);
        M('Auth_group_access')->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除管理员
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
		$isid = in_array("1",$selectid);
		if($isid) $this->error(L('c_delete_cannot_admin'));
        $user = M('User');
		$AuthGroupAccess = M('Auth_group_access');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$user->delete($id);
			$AuthGroupAccess->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	
	
	
	
}

?>