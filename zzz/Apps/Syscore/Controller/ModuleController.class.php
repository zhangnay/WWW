<?php
namespace Syscore\Controller;
use Think\Controller;
class ModuleController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $id=I('id');
	    $module = D('Module');
        if(IS_POST){
            if($module->create()){
			    $module->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($module->getError());
            }

        }else{
            $module   =   M('Module');
			$result =   $module->find($id);	
            $this->assign('rs',$result);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $module = M('Module');     
        $count = $module->count();
        $p = getpage($count,20);
        $rs = $module->order('sequence desc,id asc')->limit($p->firstRow.','. $p->listRows)->select();
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		
        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $module = M('Module');
		if(M('Attribute')->where('id='.$id)->select()==true) $this->error(L('c_delete_module_att_first'));
		if(M('Sort')->where('id='.$id)->select()==true) $this->error(L('c_delete_module_sort_first'));
        $rs=$module->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $module = M('Module');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
		    if(M('Attribute')->where('id='.$id)->select()==true) $this->error(L('c_delete_module_att_first'));
		    if(M('Sort')->where('id='.$id)->select()==true) $this->error(L('c_delete_module_sort_first'));
            $rs=$module->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	//更新启用
    public function update_disabled(){
	    $id = I('get.id');
	    $value = I('get.value');
		$Module = M('Module');
	    $CountDisabled = $Module->where('disabled=1')->Count();
	    $RsDisabled = $Module->find($id);
	    if($value==0 and $RsDisabled['disabled']==1 and $CountDisabled<2) $this->error(L('c_atleast_enable'));
		$data['disabled'] = $value;
        $Module->where('id='.$id)->save($data);
	    $this->success(L('c_success'));
	}

	//批量更新排序
    public function update_all(){
		$sequence = I('post.sequence');
		$listnum = I('post.listnum');
		$id = I('post.id');
        $Module = M('Module');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $data['listnum'] = $listnum[$i];
            $Module->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
}

?>