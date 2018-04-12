<?php
namespace Syscore\Controller;
use Think\Controller;

class IndexController extends BaseController{
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		$where['lan'] = $lan;
		//产品统计
		$productCount = M('Product')->where($where)->Count();
		$this->assign('productCount',$productCount);
		
		//新闻
		$newsCount = M('News')->where($where)->Count();
		$this->assign('newsCount',$newsCount);
		
		//下载
		$downCount = M('Down')->where($where)->Count();
		$this->assign('downCount',$downCount);
		
		//单页
		$pageCount = M('Page')->where($where)->Count();
		$this->assign('pageCount',$pageCount);
		
		//案例
		$projectCount = M('Project')->where($where)->Count();
		$this->assign('projectCount',$projectCount);
		
		//留言
		$guestbookCount = M('Guestbook')->where($where)->Count();
		$this->assign('guestbookCount',$guestbookCount);
		
		//评论
		$commentCount = M('Comment')->Count();
		$this->assign('commentCount',$commentCount);
		
        $this->display();
    }
	
	//清理缓存
    public function delCache(){
        $delCacheDo = delDirAndFile(RUNTIME_PATH,true);
		$delCacheDo ? $this->success(L('c_success')) : $this->error(L('c_fail'));
     }	

	
}
