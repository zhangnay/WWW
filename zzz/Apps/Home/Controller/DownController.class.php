<?php
namespace Home\Controller;
use Think\Controller;
class DownController extends BaseController {
	//列表页
    public function index($keyword=""){
	    $Sort = M('Sort');
		$sortid = I('get.sortid');
        $sortResult = $Sort->select();
		
	    //列表循环
        $down = D('DownView');
		if(!empty($sortid)){  
		    //SEO
			$seoRs =  $Sort->find($sortid);
			empty($seoRs['seotitle']) ? $downtitle = $seoRs['title'] : $downtitle = $seoRs['seotitle'];
			$downkeyword = $seoRs['keyword'];
			$downdescription = $seoRs['description'];
			
			//父类找子类
			$sortidArr = "";
			foreach(findChild($sortResult,$sortid) as $k => $w){
				$sortidArr .= $w['id'].",";
			}
			$where['down.sortid'] = array('in',"$sortidArr");
		    $where['sort.id'] = $sortid;
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
		}
        if($keyword == ""){
			$map['lan']  = C('DEFAULT_LANG');
        }else{
            $where['down.title'] = array('like',"%$keyword%");
            $where['down.seotitle'] = array('like',"%$keyword%");
            $where['down.keyword'] = array('like',"%$keyword%");
            $where['down.description'] = array('like',"%$keyword%");
            $where['down.content1'] = array('like',"%$keyword%");

            $where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['lan']  = C('DEFAULT_LANG');
        } 
	
        $count = $down->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->count();
		$listnum = M('Module')->find(3)['listnum'];//列表显示数量
        $p = getpage($count,$listnum);
        $rs = $down->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();

        if(!empty($sortid)){
		    $this->assign('downtitle', $downtitle);
		    $this->assign('downkeyword', $downkeyword);
		    $this->assign('downdescription', $downdescription);
		}
		
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		$this->display();
    }
}
