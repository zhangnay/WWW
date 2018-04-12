<?php
namespace Syscore\Controller;
use Think\Controller;
class SortController extends BaseController{
    //用分页读取数据
    public function index($keyword="",$moduleid=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    if($moduleid==0|$moduleid==""|$moduleid==NULL|(!is_int($moduleid) and $moduleid<0)) $this->error(L('c_error_parameter'));
        if($keyword == ""){
			$where['moduleid']  = $moduleid;
			$where['lan']  = I('get.lan');
        }else{
            $condition['title'] = array('like',"%$keyword%");
            $condition['keyword'] = array('like',"%$keyword%");
            $condition['description'] = array('like',"%$keyword%");
			$condition['_logic'] = 'or';
			$where['_complex'] = $condition;
			$where['moduleid']  = $moduleid;
			$where['lan']  = I('get.lan');
        } 
	    $Sort = M('Sort');
        $count = $Sort->where($where)->count();
        $p = getpage($count,100);
        $result = $Sort->where($where)->order('parentid asc,sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$keyword == "" ? $this->assign('list', getSort($result)) : $this->assign('list', $result);
		
        $this->assign('page', $p->show());
		$this->assign('moduleid',$moduleid);
		
        $this->display();
    }

    //编辑信息
    public function edit($id=0,$moduleid=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    if($moduleid==0|$moduleid==""|$moduleid==NULL|(!is_int($moduleid) and $moduleid<0)) $this->error(L('c_error_parameter'));
	    $Sort = D('Sort');
        if(IS_POST){
            if($Sort->create()){
                if($Sort->update()!==false){
                    $this->success(L('c_success'));
                } else {
                    $this->error(L('c_fail'));
                }
            }else{
                $this->error($Sort->getError());
            }

        }else{
            $Sort   =   M('Sort');
			$result =   $Sort->find($id);	
            $this->assign('rs',$result);
			
			$lanwhere['lan'] = $lan;
			$lanwhere['moduleid'] = $moduleid;
            $this->assign("Sort",getSort(M('Sort')->where($lanwhere)->select()));

            $v=getLanguage();
            $this->assign('list', $v); 
			
			$this->assign('moduleid',$moduleid);
			
            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $Sort = M('Sort');
		
		//请先删除该分类下的信息
		//产品
        $product = M('Product')->where('sortid='.$id)->select();
        if($product) $this->error(L('c_delete_sort_info_first'));
		//新闻
        $news = M('News')->where('sortid='.$id)->select();
        if($news) $this->error(L('c_delete_sort_info_first'));
		//下载
        $down = M('Down')->where('sortid='.$id)->select();
        if($down) $this->error(L('c_delete_sort_info_first'));
		//单页
        $page = M('Page')->where('sortid='.$id)->select();
        if($page) $this->error(L('c_delete_sort_info_first'));
		//案例
        $project = M('Project')->where('sortid='.$id)->select();
        if($project) $this->error(L('c_delete_sort_info_first'));
		
        //禁止删除含有子分类的分类
        $hasChild = $Sort->where('parentid='.$id)->select();
        if($hasChild) $this->error(L('c_delete_sort_child_first'));
		
		//删除该分类下的属性
		M('Attribute')->where('sortid='.$id)->delete();
		
        $rs=$Sort->delete($id);
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
        $Sort = M('Sort');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
			
			//请先删除该分类下的信息
		    //产品
            $product = M('Product')->where('sortid='.$id)->select();
            if($product){
                $this->error(L('c_delete_sort_info_first'));
				break;
            }

		    //新闻
            $news = M('News')->where('sortid='.$id)->select();
            if($news){
                $this->error(L('c_delete_sort_info_first'));
				break;
            }

		    //下载
            $down = M('Down')->where('sortid='.$id)->select();
            if($down){
                $this->error(L('c_delete_sort_info_first'));
				break;
            }

		    //单页
            $page = M('Page')->where('sortid='.$id)->select();
            if($page){
                $this->error(L('c_delete_sort_info_first'));
				break;
            }

		    //案例
            $project = M('Project')->where('sortid='.$id)->select();
            if($project){
                $this->error(L('c_delete_sort_info_first'));
				break;
            }

            //禁止删除含有子分类的分类
            $hasChild = $Sort->where('parentid='.$id)->select();
            if($hasChild){
                $this->error(L('c_delete_sort_child_first'));
				break;
            }
		
		    //删除该分类下的属性
		    M('Attribute')->where('sortid='.$id)->delete();
			
            $rs=$Sort->delete($id);
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
        $Sort = M('Sort');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Sort->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
	
}


?>