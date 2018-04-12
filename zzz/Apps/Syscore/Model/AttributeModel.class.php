<?php
namespace Syscore\Model;
use Think\Model;
class AttributeModel extends Model {
    //自动验证
    protected $_validate = array(
        array('attname','require','{%m_attname_notempty}'), 
        array('attvalue','require','{%m_require_attvalue}'), 
    );
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs){ //数据对象创建错误
            return false;
        }
        empty($rs['id']) ? $this->add() : $this->save();
    }
}
?>