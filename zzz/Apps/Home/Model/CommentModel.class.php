<?php
namespace Home\Model;
use Think\Model;
class CommentModel extends Model {
    // 自动完成
    protected $_auto=array(
        array('addtime','GetAddtime',3,'callback'),
        array('lan','getLan',3,'callback'),
    );
	
    public function GetAddtime(){
		$Addtime=time();
		return $Addtime;
    }
	
    public function getLan(){
		$lan=C('DEFAULT_LANG');
		return $lan;
    }

    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;//数据对象创建错误
        $this->add();
    }
}
?>