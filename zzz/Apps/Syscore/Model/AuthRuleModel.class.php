<?php
namespace Syscore\Model;
use Think\Model;
class AuthRuleModel extends Model{

    //自动验证
    protected $_validate = array(
        array('title','require','{%m_require_authname}'),
        array('name','require','{%m_authvalue_required}'),
    );
	
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;//数据对象创建错误

        empty($rs['id']) ? $this->add() : $this->save();
    }
}

?>