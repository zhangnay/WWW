<?php
namespace Syscore\Controller;
use Think\Controller;
class GuestbookController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $id=I('id');
	    $guestbook = D('Guestbook');
        if(IS_POST){
            if($guestbook->create()){
			    $guestbook->update()!==false ? $this->success(L('c_success')) : $this->error(L('c_fail'));
            }else{
                $this->error($guestbook->getError());
            }

        }else{
            $guestbook   =   M('Guestbook');
			$result =   $guestbook->find($id);	
            $this->assign('rs',$result);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index($keyword=""){
        $guestbook = M('Guestbook');      
        $where['title'] = array('like',"%$keyword%");
        $where['content'] = array('like',"%$keyword%");
        $where['_logic'] = 'or';
		$map['_complex'] = $where;
	
        $count = $guestbook->where($map)->count();
        $p = getpage($count,20);
        $rs = $guestbook->where($map)->order('id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$this->assign('list', $rs);
        $this->assign('page', $p->show()); 

        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $guestbook = M('Guestbook');
        $rs=$guestbook->delete($id);
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $guestbook = M('Guestbook');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$guestbook->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	




}

?>