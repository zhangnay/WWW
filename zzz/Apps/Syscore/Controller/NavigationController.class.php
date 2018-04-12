<?php
namespace Syscore\Controller;
use Think\Controller;
/**
 * 分类管理
 */
class NavigationController extends BaseController{
    //用分页读取数据
    public function index($keyword="",$moduleid=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        if($keyword == ""){
			$where['lan']  = I('get.lan');
        }else{
            $condition['navname'] = array('like',"%$keyword%");
			$condition['_logic'] = 'or';
			$where['_complex'] = $condition;
			$where['lan']  = I('get.lan');
        } 
	    $Navigation = M('Navigation');
        $count = $Navigation->where($where)->count();
        $p = getpage($count,20000);
        $result = $Navigation->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$keyword == "" ? $this->assign('list', getNavigation($result)) : $this->assign('list', $result);
		
        $this->assign('page', $p->show());
		
        $this->display();
    }

    //编辑信息
    public function edit($id=0,$moduleid=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		$lan = C('DEFAULT_LANG');
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $Navigation = D('Navigation');
        if(IS_POST){
            if($Navigation->create()){
                if($Navigation->update()!==false){
                    $this->success(L('c_success'),U('Navigation/index?lan='.$lan));
                } else {
                    $this->error(L('c_fail'));
                }
            }else{
                $this->error($Navigation->getError());
            }

        }else{
            $Navigation   =   M('Navigation');
			$result =   $Navigation->find($id);	
            $this->assign('rs',$result);
			
			$lanwhere['lan'] = $lan;
            $this->assign("Navigation",getNavigation(M('Navigation')->where($lanwhere)->select()));
			
            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $Navigation = M('Navigation');
		
        //禁止删除含有子分类的分类
        $hasChild = $Navigation->where('parentid='.$id)->select();
        if($hasChild){
            $this->error(L('c_delete_sort_child_first'));
        }
		
        $rs=$Navigation->delete($id);
        if($rs) {
            $this->success(L('c_success'));
        }else{
            $this->error(L('c_fail'));
        }
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=$_POST['selectid'];
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $Navigation = M('Navigation');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
			
            //禁止删除含有子分类的分类
            $hasChild = $Navigation->where('parentid='.$id)->select();
            if($hasChild){
                $this->error(L('c_delete_sort_child_first'));
				break;
            }
			
            $rs=$Navigation->delete($id);
	    }
        if($rs) {
            $this->success(L('c_success'));
        }else{
            $this->error(L('c_fail'));
        }
    }	
	
	//批量更新排序
    public function update_all(){
		$sequence = I('post.sequence');
		$id = I('post.id');
        $Navigation = M('Navigation');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Navigation->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
	
}


?>