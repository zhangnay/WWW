<?php
namespace Syscore\Controller;
use Think\Controller;
class AuthRuleController extends BaseController{
    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $AuthRule = M('Auth_rule');
        if($keyword == ""){
			$map['modulesign']  = 'web';
        }else{
            $where['title'] = array('like',"%$keyword%");
            $where['name'] = array('like',"%$keyword%");
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['modulesign']  = 'web';
        } 
        $count = $AuthRule->where($map)->count();
        $p = getpage($count,20);
        $result = $AuthRule->where($map)->order('id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$keyword == "" ? $this->assign('list', getAuthRule($result)) : $this->assign('list', $result);
		
        $this->assign('page', $p->show());
        $this->display();
    }

    //编辑信息
    public function edit($id=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $AuthRule = D('Auth_rule');
        if(IS_POST){
            if($AuthRule->create()){
                $AuthRule->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($AuthRule->getError());
            }

        }else{
            $AuthRule   =   M('Auth_rule');
			$result =   $AuthRule->find($id);	
            $this->assign('rs',$result);
			
			$where['modulesign'] = 'web';
            $this->assign("AuthRule",getAuthRule(M('Auth_rule')->where($where)->select()));
            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $AuthRule = M('Auth_rule');
        //禁止删除含有子权限的权限
        $hasChild = $AuthRule->where('parentid='.$id)->select();
        if($hasChild) $this->error(L('c_delete_child_auth_first'));
		
        $rs=$AuthRule->delete($id);
        $rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	
	
	
	//批量删除数据
    public function delete_all(){
		$selectid=$_POST['selectid'];
        $AuthRule = M('Auth_rule');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            //禁止删除含有子权限的权限
            $hasChild = $AuthRule->where('parentid='.$id)->select();
            if($hasChild){
                $this->error(L('c_delete_child_auth_first'));
				break;
            }
			
            $rs=$AuthRule->delete($id);
	    }
        $rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	
}


?>