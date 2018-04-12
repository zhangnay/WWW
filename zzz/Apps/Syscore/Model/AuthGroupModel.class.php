<?php
namespace Syscore\Model;
use Think\Model;
class AuthGroupModel extends Model {
    // 自动完成
    protected $_auto=array(
        array('title','require','{%m_require_usergroup}'),
        array('rules','getRules',3,'callback'),
    );

    //callback获取复选框的值
    public function getRules(){
	    if(IS_POST){
		    $rules_array=I('post.rules');
            for($i=0;$i<count($rules_array);$i++){
			    $i<count($rules_array)-1 ? $rules.=$rules_array[$i]."," : $rules.=$rules_array[$i];
	        }
		    return $rules;
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