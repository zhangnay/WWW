<?php
namespace Syscore\Model;
use Think\Model;
class ChatModel extends Model {
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;
        empty($rs['id']) ? $this->add() : $this->save();
    }

}
?>