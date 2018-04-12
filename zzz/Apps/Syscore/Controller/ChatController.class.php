<?php
namespace Syscore\Controller;
use Think\Controller;
class ChatController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $id=I('id');
	    $chat = D('Chat');
        if(IS_POST){
            if($chat->create()){
			    $chat->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($chat->getError());
            }

        }else{
            $chat   =   M('Chat');
			$result =   $chat->find($id);	
            $this->assign('rs',$result);
			
            $this->display();
        }		
	}

    //用分页读取数据
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $chat = M('Chat');     
		$where['lan'] = $lan;
        $count = $chat->where($where)->count();
        $p = getpage($count,20);
        $rs = $chat->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		
        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $chat = M('Chat');
        $rs=$chat->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $chat = M('Chat');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$chat->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	
	//批量更新数据
    public function update_all(){
		$chatname=I('post.chatname');
		$account=I('post.account');
		$sequence=I('post.sequence');
		$id=I('post.id');
		
        $Chat = M('Chat');
        for($i=0;$i<count($sequence);$i++){
            $data['chatname'] = $chatname[$i];
            $data['account'] = $account[$i];
            $data['sequence'] = $sequence[$i];

            $rs = $Chat->where('id='.$id[$i])->save($data);
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	

}

?>