<?php
namespace Syscore\Controller;
use Think\Controller;
class LanguageController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
	    $id=I('id');
        if(IS_POST){
		    $language = D('Language');
            if($language->create()){
			    $language->update()!==false ? $this->success(L('c_success'),U('index?lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($language->getError());
            }

        }else{
            $language   =   M('Language');
			$result =   $language->find($id);	
			
            $this->assign('rs',$result);
            $this->display();
        }		
	}

    //用分页读取数据
    public function index(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
        $language = M('Language');      
        $count = $language->count();
        $p = getpage($count,20);
        $rs = $language->field(true)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
		
        $this->display();

    }
	
	//删除单条数据
    public function delete_one($id){
        $Language = M('Language');

        $lan = $Language->find($id);
        if($lan['isdefault']==1) $this->error(L('c_delete_cannot_default_language'));
		
        $rs=$Language->delete($id);
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=$_POST['selectid'];
		if(empty($selectid)) $this->error(L('c_delete_check'));
		
        $Language = M('Language');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
			
            $lan = $Language->find($id);
            if($lan['isdefault']==1){
			    $this->error(L('c_delete_cannot_default_language'));
				break;
			}
            $rs=$Language->delete($id);
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量更新数据
    public function update_all(){
		$adminname=I('post.adminname');
		$viewname=I('post.viewname');
		$sequence=I('post.sequence');
		$id=I('post.id');
		
        $Language = M('Language');
        for($i=0;$i<count($sequence);$i++){
            $data['adminname'] = $adminname[$i];
            $data['viewname'] = $viewname[$i];
            $data['sequence'] = $sequence[$i];
			
			if(empty($adminname[$i])){
			    $this->error(L('c_require_adminname'));
				break;
			}
			if(empty($viewname[$i])){
			    $this->error(L('c_require_viewname'));
				break;
			}
			if(!preg_match("/^\d+$/",$sequence[$i])){
			    $this->error(L('c_require_sequence'));
				break;
			}

            $rs = $Language->where('id='.$id[$i])->save($data);
	    }
		//没搞明白如何判断是否更新成功
		$this->success(L('c_success'));
    }	
	
	//更新启用或默认
    public function update_status_default(){
        $Language = M('Language');
		$field = I('get.field');
		$value = I('get.value');
		$id = I('get.id');
		if($field=='status'){//启用处理
            $CountStatus = $Language->where('status=1')->Count();
			$RsStatus = $Language->find($id);
			if($value==0 and $RsStatus['isdefault']==1) $this->error(L('c_cancel_language_default_first'));
			if($value==0 and $RsStatus['status']==1 and $CountStatus<2) $this->error(L('c_atleast_enable'));
            $data['status'] = $value;
            $Language->where('id='.$id)->save($data);
		}
		if($field=='isdefault'){//默认处理
			$RsDefault = $Language->select();
			if($value==1){//设为默认
			    $data['isdefault'] = 1;
				$data['status'] = 1;//设为默认的同时启用
			    $Language->where('id='.$id)->save($data);
				$DataNo['isdefault'] = 0;//其他语言取消默认
				$Language->where('id!='.$id)->save($DataNo);
			}
		}
		
		$this->success(L('c_success'));
    }	

}

?>