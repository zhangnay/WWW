<?php
namespace Home\Controller;
use Think\Controller;
class PageController extends BaseController {
	//详情页
    public function view(){
	    $id = I('get.id');
        if(empty($id)) $this->error(L('c_parameter_error'),U('Page/index'));
		$page = M('Page');
		$result = $page->find($id);
		$this->assign('rs',$result);
            
		//更新浏览次数
		$page->where('id='.$id)->setInc('hits',1);
			
		//SEO
		empty($result['seotitle']) ? $this->assign('seotitle',$result['title']) : $this->assign('seotitle',$result['seotitle']);
		
		$morepics = explode('|',$result['morepics']);
        $this->assign('piclist',$morepics);
		$this->display();
    }
	
}
