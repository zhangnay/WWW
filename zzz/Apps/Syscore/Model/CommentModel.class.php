<?php
namespace Syscore\Model;
use Think\Model;
class CommentModel extends Model{
    // 自动完成
    protected $_auto=array(
        array('addtime','GetAddtime',3,'callback'),
        array('ip','getClientIp',3,'callback'),
    );
	
	//添加时间
    public function GetAddtime(){
	    if(IS_POST){
		    $Addtime=time();
		    return $Addtime;
	    }
    }

    //获取用户真实IP
    public function getClientIp(){
	    if(IS_POST){
		    $ip=getClientIp();
		    return $ip;
	    }
    }

    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;
        empty($rs['id']) ? $this->add() : $this->save();
    }
}

?>