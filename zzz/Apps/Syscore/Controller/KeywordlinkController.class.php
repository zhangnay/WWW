<?php
namespace Syscore\Controller;
use Think\Controller;
class KeywordlinkController extends BaseController{
    //用分页读取数据
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		$keyword = I('post.keyword');
        $where['keyword'] = array('like',"%$keyword%");
	    $Keywordlink = M('Keywordlink');
        $count = $Keywordlink->where($where)->count();
        $p = getPage($count,20);
        $result = $Keywordlink->where($where)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		$this->assign('list', $result);
		
        $this->assign('page', $p->show());
		
        $this->display();
    }

	
    //编辑信息
    public function edit($id=0,$moduleid=0){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $Keywordlink = D('Keywordlink');
        if(IS_POST){
            if($Keywordlink->create()){
                if($Keywordlink->update()!==false){
                    $this->success(L('c_success'));
                } else {
                    $this->error(L('c_fail'));
                }
            }else{
                $this->error($Keywordlink->getError());
            }

        }else{
            $Keywordlink   =   M('Keywordlink');
			$result =   $Keywordlink->find($id);	
            $this->assign('rs',$result);
			
            $this->display();
        }		
	}
	
	
	
	//删除单条数据
    public function delete_one($id){
        $Keywordlink = M('Keywordlink');
		
        $rs=$Keywordlink->delete($id);
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
        $Keywordlink = M('Keywordlink');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$Keywordlink->delete($id);
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
        $Keywordlink = M('Keywordlink');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Keywordlink->where('id='.$id[$i])->save($data);			
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
	
}


?>