<?php
namespace Syscore\Controller;
use Think\Controller;
class AuthGroupController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		if(M('Auth_rule')->select()==false) $this->error(L('c_add_auth_first'),U('AuthRule/edit?lan='.$lan));
		
	    $id=I('id');
	    $AuthGroup = D('Auth_group');
        if(IS_POST){
            if($AuthGroup->create()){
			    $AuthGroup->update()!==false ? $this->success(L('c_success')) : $this->error(L('c_fail'));
            }else{
                $this->error($AuthGroup->getError());
            }

        }else{
            $AuthGroup   =   M('Auth_group');
			$result =   $AuthGroup->find($id);	
            $this->assign('rs',$result);
			
            //权限赋值
            $this->assign("AuthRule",getAuthRule(M('Auth_rule')->select()));
			
			//权限组（部门级别）
            $authgroupData = getCategory($AuthGroup->select());
            $this->assign("authGroup",$authgroupData);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $AuthGroup = D('Auth_group');      
        $count = $AuthGroup->where($where)->count();
        $p = getpage($count,20);
        $rs = $AuthGroup->field(true)->order('id desc')->limit($p->firstRow.','. $p->listRows)->select();

        $this->assign('list', $rs); 
		
		//权限分配
        $this->assign("AuthRule",getAuthRule(M('Auth_rule')->select()));
		
        $this->assign('page', $p->show()); 
        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
		
		//有会员属于该用户组，请先变更会员的用户组
		if(M('Auth_group_access')->where('group_id='.$id)->select()==true) $this->error(L('c_change_authgroup_first'));
		
        $AuthGroup = M('Auth_group');
        $rs=$AuthGroup->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
		$isid = in_array("1",$selectid);
		if($isid) $this->error(L('c_delete_cannot_authgroup'));
        $AuthGroup = M('Auth_group');
		$AuthGroupAccess = M('Auth_group_access');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
			if($AuthGroupAccess->where('group_id='.$id)->select()==true) $this->error(L('c_change_authgroup_first'));
            $rs=$AuthGroup->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	//更新启用
    public function update_status(){
	    $id = I('get.id');
	    $value = I('get.value');
		$AuthGroup = M('Auth_group');
	    $CountStatus = $AuthGroup->where('status=1')->Count();
	    $RsStatus = $AuthGroup->find($id);
	    if($value==0 and $RsStatus['status']==1 and $CountStatus<2) $this->error(L('c_atleast_enable'));
		$data['status'] = $value;
        $AuthGroup->where('id='.$id)->save($data);
	    $this->success(L('c_success'));
	}
}

?>