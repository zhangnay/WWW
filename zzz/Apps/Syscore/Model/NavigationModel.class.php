<?php
namespace Syscore\Model;
use Think\Model;
class NavigationModel extends Model{
    //自动验证
    protected $_validate = array(
        array('navname','require','{%m_title_require_first}'), 
    );
	
    // 自动完成
    protected $_auto=array(
        array('client','GetClient',3,'callback'),
    );
	
    //callback获取客户端
    public function GetClient(){
	    if(IS_POST){
		    $client_array=I('post.client');
            for($i=0;$i<count($client_array);$i++){
			    $i<count($client_array)-1 ? $client.=$client_array[$i]."," : $client.=$client_array[$i];
	        }
		    return $client;
	    }
    }

    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs){ //数据对象创建错误
            return false;
        }

        if(empty($rs['id'])){
            $this->add();
        }else{
            $this->save();
        }
    }
	
	
}

?>