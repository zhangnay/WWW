<?php
namespace Syscore\Controller;
use Think\Controller;
class AreaController extends BaseController{
    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        if($keyword == ""){
			$where['lan']  = $lan;
        }else{//多语言字段查询
            $where['areaname'] = array('like',"%$keyword%");
			$where['lan']  = $lan;
        } 
	    $Area = M('Area')->where($where);
        $count = $Area->where($where)->count();
        $p = getpage($count,20);
        $result = $Area->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		
		$keyword == "" ? $this->assign('list', getAreaEdit($result)) : $this->assign('list', $result);

        $this->assign('page', $p->show());
        $this->display();
    }

    //编辑信息
    public function edit($id=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $Area = D('Area');
        if(IS_POST){
            if($Area->create()){
                if($Area->update()!==false){
                    $this->success(L('c_success'));
                } else {
                    $this->error(L('c_fail'));
                }
            }else{
                $this->error($Area->getError());
            }

        }else{
            $Area   =   M('Area');
			$result =   $Area->find($id);	
            $this->assign('rs',$result);
			
			$lanwhere['lan'] = $lan;
            $this->assign("Area",getAreaEdit(M('Area')->where($lanwhere)->select()));

            $v=getLanguage();
            $this->assign('list', $v); // 赋值数据集

            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $Area = M('Area');
		
        $product = M('Product')->where('id='.$id)->select();
        if($product) $this->error(L('c_delete_area_info_first'));
        //禁止删除含有子地区的地区
        $hasChild = $Area->where('parentid='.$id)->select();
        if($hasChild) $this->error(L('c_delete_area_child_first'));
		
        $rs=$Area->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid = I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $Area = M('Area');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
			
            $product = M('Product')->where('id='.$id)->select();
            if($product){
                $this->error(L('c_delete_area_info_first'));
				break;
            }
            //禁止删除含有子地区的地区
            $hasChild = $Area->where('parentid='.$id)->select();
            if($hasChild){
                $this->error(L('c_delete_area_child_first'));
				break;
            }
			
            $rs=$Area->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量更新排序
    public function update_all(){
		$sequence = I('post.sequence');
		$id = I('post.id');
        $Area = M('Area');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Area->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
}


?>