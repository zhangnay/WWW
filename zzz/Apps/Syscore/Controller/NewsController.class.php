<?php
namespace Syscore\Controller;
use Think\Controller;
class NewsController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		IS_POST ? $moduleid = I('post.moduleid') : $moduleid = I('get.moduleid');
		$haveSort=isSort($moduleid,$lan);
		if($haveSort==false) $this->error(L('c_add_sort_first'),U('Sort/index?moduleid='.$moduleid.'&lan='.$lan));
		
		$haveArea=isArea($lan);
		if($haveArea==false) $this->error(L('c_add_area'),U('Area/Index?lan='.$lan));
		
	    $id=I('id');
	    $news = D('News');
        if(IS_POST){
            if($news->create()){
			    $news->update()!==false ? $this->success(L('c_success')) : $this->error(L('c_fail'));
            }else{
                $this->error($news->getError());
            }

        }else{
            $news   =   M('News');
			$result =   $news->find($id);	
            $this->assign('rs',$result);
            
			//赋值来源及来源链接
		    $where['lan'] = $lan;
		    $fieldRs = M('Field')->where($where)->order("id desc")->select();
		    foreach($fieldRs as $k => $w){
		        $this->assign($w['fieldlabel'],$w['fieldvalue']);
		    }

            //分类赋值
			$sortwhere['lan'] = $lan;
			$sortwhere['moduleid'] = $moduleid;
            $this->assign("Sort",getSort(M('Sort')->where($sortwhere)->select()));
            

		    //地区
			$areaArr=json_encode(getChildArr('Area',0,$lan));
            $this->assign('areaArr',$areaArr);
		
		    //编辑信息时获取地区ID
			$a = ""; $b = ""; $c = ""; $d = "";
            $areaRs =  getCommonParent(M('Area')->select(),$result['areaid']);
			foreach($areaRs as $k => $v){
				$abcd = $v['id'];
				switch($k){
                    case 0:
		                $a = $abcd;
                        break;
                    case 1:
		                $b = $abcd;
                        break;
                    case 2:
		                $c = $abcd;
                        break;
                    case 3:
		                $d = $abcd;
                        break;
                }
			}
			$this->assign('a',$a); $this->assign('b',$b); $this->assign('c',$c); $this->assign('d',$d);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $news = D('NewsView');      
        if($keyword == ""){
			$map['lan']  = $lan;
        }else{//多语言字段查询
            $where['news.title'] = array('like',"%$keyword%");
            $where['news.seotitle'] = array('like',"%$keyword%");
            $where['news.keyword'] = array('like',"%$keyword%");
            $where['news.description'] = array('like',"%$keyword%");
            $where['news.content1'] = array('like',"%$keyword%");
						
            $where['sort.title'] = array('like',"%$keyword%");
            $where['sort.seotitle'] = array('like',"%$keyword%");
            $where['sort.keyword'] = array('like',"%$keyword%");
            $where['sort.description'] = array('like',"%$keyword%");
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['lan']  = $lan;
        } 
	
        $count = $news->where($map)->count();
        $p = getpage($count,20);
        $rs = $news->field(true)->where($map)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 

        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $news = M('News');
        $rs=$news->delete($id);
		//删除对应属性值
		M("Attribute_value")->where("infoid=".$id)->delete();
		//删除对应的评论
		M("Comment")->where("moduleid=2 and infoid='".$id."'")->delete();
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $news = M('News');
		$AttributeValue = M("Attribute_value");
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$news->delete($id);
		    //删除对应属性值
		    $AttributeValue->where("infoid=".$id)->delete();
		    //删除对应的评论
		    M("Comment")->where("moduleid=2 and infoid='".$id."'")->delete();
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	//地区Ajax
    public function getArea(){
        $id = I('post.id');
		$where['parentid'] = $id;
		$area =  M('Area')->where($where)->order('sequence desc,id desc')->select();
		
		foreach($area as &$rs){
		    $categories[] = $rs;
		}
        if(empty($categories)){
		    return false;
		}else{
		    echo json_encode($categories);
		}

    }	

	//批量更新排序
    public function update_all(){
		$sequence = I('post.sequence');
		$id = I('post.id');
        $News = M('News');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $News->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
}

?>