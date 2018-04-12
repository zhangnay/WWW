<?php
namespace Home\Controller;
use Think\Controller;
class ProjectController extends BaseController {
	//详情页
    public function view(){
	    $id = I('get.id');
        if(empty($id)) $this->error(L('c_parameter_error'),U('Project/index'));
		$project = M('Project');
		$result = $project->find($id);
		$this->assign('rs',$result);
            
		//更新浏览次数
		$project->where('id='.$id)->setInc('hits',1);

		//SEO
		empty($result['seotitle']) ? $this->assign('seotitle',$result['title']) : $this->assign('seotitle',$result['seotitle']);
	        
	    //上一篇
		$previous=$project->where("id<".$id)->order('sequence desc,id desc')->limit('1')->find();
		$pre = !$previous ? L('c_nodata') : "<a href=\"".U(CONTROLLER_NAME.'/view?id='.$previous['id'])."\">".$previous['title']."</a>";
		$this->assign('pre',$pre);
		
		//下一篇
		$next=$project->where("id>".$id)->order('sequence desc,id desc')->limit('1')->find();
		$next = !$next ? L('c_nodata') : "<a href=\"".U(CONTROLLER_NAME.'/view?id='.$next['id'])."\">".$next['title']."</a>";
		$this->assign('next',$next);
		
		$morepics = explode('|',$result['morepics']);
        $this->assign('piclist',$morepics);
		$this->display();
    }
	
	//列表页
    public function index($keyword=""){
	    $Sort = M('Sort');
		$sortid = I('get.sortid');
        $sortResult = $Sort->select();
		
	    //列表循环
        $project = D('ProjectView');
		if(!empty($sortid)){  
		    //SEO
			$seoRs =  $Sort->find($sortid);
			empty($seoRs['seotitle']) ? $projecttitle = $seoRs['title'] : $projecttitle = $seoRs['seotitle'];
			$projectkeyword = $seoRs['keyword'];
			$projectdescription = $seoRs['description'];
			//父类找子类
			$sortidArr = "";
			foreach(findChild($sortResult,$sortid) as $k => $w){
				$sortidArr .= $w['id'].",";
			}
			$where['project.sortid'] = array('in',"$sortidArr");
		    $where['sort.id'] = $sortid;
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
		}
        if($keyword == ""){
			$map['lan']  = C('DEFAULT_LANG');
        }else{
            $where['project.title'] = array('like',"%$keyword%");
            $where['project.seotitle'] = array('like',"%$keyword%");
            $where['project.keyword'] = array('like',"%$keyword%");
            $where['project.description'] = array('like',"%$keyword%");
            $where['project.content1'] = array('like',"%$keyword%");
            $where['project.content2'] = array('like',"%$keyword%");
            $where['project.content3'] = array('like',"%$keyword%");
						
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['lan']  = C('DEFAULT_LANG');
        } 
	
        $count = $project->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->count();
		$listnum = M('Module')->find(5)['listnum'];//列表显示数量
        $p = getpage($count,$listnum);
        $rs = $project->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();

        if(!empty($sortid)){
		    $this->assign('projecttitle', $projecttitle);
		    $this->assign('projectkeyword', $projectkeyword);
		    $this->assign('projectdescription', $projectdescription);
		}
		
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		$this->display();
    }
}
