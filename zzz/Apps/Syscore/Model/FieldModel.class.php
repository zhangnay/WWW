<?php
namespace Syscore\Model;
use Think\Model;
class FieldModel extends Model {
    // 自动验证
    protected $_validate=array(
        array('fieldlabel','Getfieldlabel','{%m_require_fieldlabel}',0,'callback'),
        );

    //callback字段标签
    public function Getfieldlabel(){
	    $Postid = I('post.id');
		$fieldlabel = I('post.fieldlabel');
		$where['fieldlabel']=$fieldlabel;
		$Rsfieldlabel = M('Field')->find($Postid);
		$IsExist = M('Field')->where($where)->Count();
		if(strlen(trim($fieldlabel))==0){//是否为空
		    return false;
		}elseif(empty($Postid) and $IsExist>1){//新增时判断：是否存在
		    return false;
		}elseif((!empty($Postid) and $IsExist==2) and $Rsfieldlabel['fieldlabel']!=$fieldlabel){//更新时判断：是否存在
		    return false;
		}elseif(!empty($Postid) and $IsExist>2){//更新时判断：是否存在
		    return false;
		}elseif(!preg_match("/^[a-zA-Z\s]+$/",$fieldlabel)){//是否为英文字母
		    return false;
		}else{
		    return true;
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