<?php
namespace Syscore\Controller;
use Think\Controller;
class CommentController extends BaseController{
    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		$where['lan']  = $lan;
        $where['content'] = array('like',"%$keyword%");
	    $Comment = M('Comment');
        $count = $Comment->where($where)->count();
        $p = getpage($count,20);
        $result = $Comment->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$keyword == "" ? $this->assign('list', getComment($result)) : $this->assign('list', $result);
		
        $this->assign('page', $p->show());
		
        $this->display();
    }
	
    //编辑信息
    public function edit($id=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        if(IS_POST){
//		    if(I('post.parentid')=="") $this->error(L('c_error_parameter'));
		    $Comment = D('Comment');
            if($Comment->create()){
                if($Comment->update()!==false){
                    $this->success(L('c_success'),U('Comment/index?lan='.$lan));
                } else {
                    $this->error(L('c_fail'));
                }
            }else{
                $this->error($Comment->getError());
            }

        }else{
	        $moduleid = I('get.moduleid');
			$LanRs = M('Language')->where("isdefault=1")->find();
		    switch ($moduleid){
                case 2://新闻模块
                    $Comment = D('CommentNewsView');
					$module = "/News";
                    break;
                case 3://下载
                    $Comment = D('CommentDownView');
					$module = "/Down";
                    break;
                case 4://单页
                    $Comment = D('CommentPageView');
					$module = "/Page";
                    break;
                case 5://案例
                    $Comment = D('CommentProjectView');
					$module = "/Project";
                    break;
                default://产品模块
                    $Comment = D('CommentProductView');
					$module = "/Product";
            }
			$result =   $Comment->find($id);
			$LanRs['mulu']==$result['lan'] ? $module="".$module : $module=$result['lan'].$module;
            $this->assign('rs',$result);
            $this->assign('module',$module);
			
            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $Comment = M('Comment');
        //禁止删除含有子分类的分类
        $hasChild = $Comment->where('parentid='.$id)->select();
        if($hasChild){
            $this->error(L('c_delete_sort_child_first'));
        }
		
        $rs=$Comment->delete($id);
        if($rs) {
            $this->success(L('c_success'));
        }else{
            $this->error(L('c_fail'));
        }
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $Comment = M('Comment');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            //禁止删除含有子分类的分类
            $hasChild = $Comment->where('parentid='.$id)->select();
            if($hasChild){
                $this->error(L('c_delete_sort_child_first'));
				break;
            }
			
            $rs=$Comment->delete($id);
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
        $Comment = M('Comment');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Comment->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
	//批量审核
    public function update_pass(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_do_check'));
		$status = I('get.status');
		$id = I('post.id');
        $Comment = M('Comment');
        for($i=0;$i<count($selectid);$i++){
            $data['status'] = $status;
            $Comment->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	

	//取消或通过审核
    public function update_status(){
        $comment = M('Comment');
		$id = I('get.id');
        $data['status'] = I('get.status');
        $comment->where('id='.$id)->save($data);
		$this->success(L('c_success'));
    }	
	
}


?>