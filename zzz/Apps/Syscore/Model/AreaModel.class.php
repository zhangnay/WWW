<?php
namespace Syscore\Model;
use Think\Model;
class AreaModel extends Model{
    //自动验证
    protected $_validate = array(
        array('areaname','require','{%m_require_area}'), 
        array('sequence','number','{%m_sequence_correct}'),
    );
	
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;//数据对象创建错误

        empty($rs['id']) ? $this->add() : $this->save();
    }
	
	
}

?>