<?php
namespace Syscore\Model;
use Think\Model;
class SortModel extends Model{
    //自动验证
    protected $_validate = array(
        array('title','require','{%m_title_require_first}'), 
    );
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;
        empty($rs['id']) ? $this->add() : $this->save();
    }
	
}

?>