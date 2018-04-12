<?php
namespace Syscore\Controller;
use Think\Controller;
class FieldController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $id=I('id');
	    $field = D('Field');
        if(IS_POST){
            if($field->create()){
			    $field->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($field->getError());
            }

        }else{
            $field   =   M('Field');
			$result =   $field->find($id);	
            $this->assign('rs',$result);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $field = M('Field');     
		$where['lan'] = $lan;
        $count = $field->where($where)->count();
        $p = getpage($count,20);
        $rs = $field->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		
        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $field = M('Field');
        $rs=$field->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $field = M('Field');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$field->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	
	//批量更新数据
    public function update_all(){
		$fieldlabel=I('post.fieldlabel');
		$fieldtext=I('post.fieldtext');
		$sequence=I('post.sequence');
		$id=I('post.id');
		
        $Field = M('Field');
        for($i=0;$i<count($sequence);$i++){
            $data['fieldlabel'] = $fieldlabel[$i];
            $data['fieldtext'] = $fieldtext[$i];
            $data['sequence'] = $sequence[$i];

            $rs = $Field->where('id='.$id[$i])->save($data);
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	

}

?>