<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {
    public function index(){
		$product = M('Product');
		$news = M('News');
		$down = M('Down');
		$page = M('Page');
		$project = M('Project');
		$ad = M('Ad');
		$area = M('Area');
		$sort = M('Sort');
		
		$lan = C('DEFAULT_LANG');
		$lanWhere = "lan='".$lan."'";
		$clientWhere = $lanWhere." and find_in_set('pc',client)";
		$viewWhere = $clientWhere." and find_in_set('view',status)";
		$hotWhere = $viewWhere." and find_in_set('hot',status)";
		$newWhere = $viewWhere." and find_in_set('new',status)";
		$commendWhere = $viewWhere." and find_in_set('commend',status)";
		$adFriendWhere = $clientWhere." and typeid=2 and position='Index'";
		$adBannerWhere = $clientWhere." and typeid=1 and position='Index'";
			
		//产品模块
	    $this->assign("product",$product->where($viewWhere)->order("sequence desc,id desc")->select());
		//热门产品
	    $this->assign("hot_product",$product->where($hotWhere)->order("sequence desc,id desc")->select());
		//最新产品
	    $this->assign("new_product",$product->where($newWhere)->order("sequence desc,id desc")->select());
		//推荐产品
	    $this->assign("commend_product",$product->where($commendWhere)->order("sequence desc,id desc")->select());
	
 		//新闻模块
	    $this->assign("news",$news->where($viewWhere)->order("addtime desc")->limit(7)->select());
		//热门新闻
	    $this->assign("hot_news",$news->where($hotWhere)->order("sequence desc,id desc")->select());
		//最新新闻
	    $this->assign("new_news",$news->where($newWhere)->order("sequence desc,id desc")->select());
		//推荐新闻
	    $this->assign("commend_news",$news->where($commendWhere)->order("sequence desc,id desc")->select());
	
 		//下载模块
	    $this->assign("down",$down->where($viewWhere)->order("sequence desc,id desc")->select());
		//热门下载
	    $this->assign("hot_down",$down->where($hotWhere)->order("sequence desc,id desc")->select());
		//最新下载
	    $this->assign("new_down",$down->where($newWhere)->order("sequence desc,id desc")->select());
		//推荐下载
	    $this->assign("commend_down",$down->where($commendWhere)->order("sequence desc,id desc")->select());
	
 		//单页模块
	    $this->assign("page",$page->where($viewWhere)->order("sequence desc,id desc")->select());
		//热门单页
	    $this->assign("hot_page",$page->where($hotWhere)->order("sequence desc,id desc")->select());
		//最新单页
	    $this->assign("new_page",$page->where($newWhere)->order("sequence desc,id desc")->select());
		//推荐单页
	    $this->assign("commend_page",$page->where($commendWhere)->order("sequence desc,id desc")->select());
	
 		//案例模块
	    $this->assign("project",$project->where($viewWhere)->order("sequence desc,id desc")->select());
		//热门案例
	    $this->assign("hot_project",$project->where($hotWhere)->order("sequence desc,id desc")->select());
		//最新案例
	    $this->assign("new_project",$project->where($newWhere)->order("sequence desc,id desc")->select());
		//推荐案例
	    $this->assign("commend_project",$project->where($commendWhere)->order("sequence desc,id desc")->select());
	
		//友情链接
	    $this->assign("adfriend",$ad->where($adFriendWhere)->order("sequence desc,id desc")->select());
		//幻灯片
	    $this->assign("adbanner",$ad->where($adBannerWhere)->order("sequence desc,id desc")->select());
	
		//地区
	    $this->assign("area",$area->where("parentid=0 and lan='".$lan."'")->order("sequence desc,id desc")->select());

		//产品分类
	    $this->assign("product_sort",$sort->where("parentid=0 and moduleid=1 and lan='".$lan."'")->order("sequence desc,id desc")->select());

		//新闻分类
	    $this->assign("news_sort",$sort->where("parentid=0 and moduleid=2 and lan='".$lan."'")->order("sequence desc,id desc")->select());

		//下载分类
	    $this->assign("down_sort",$sort->where("parentid=0 and moduleid=3 and lan='".$lan."'")->order("sequence desc,id desc")->select());

		//单页分类
	    $this->assign("page_sort",$sort->where("parentid=0 and moduleid=4 and lan='".$lan."'")->order("sequence desc,id desc")->select());

		//案例分类
	    $this->assign("project_sort",$sort->where("parentid=0 and moduleid=5 and lan='".$lan."'")->order("sequence desc,id desc")->select());

       $this->display();
    }
}