<?php
namespace Syscore\Model;
use Think\Model;
class LanguageModel extends Model {
    // 定义自动验证
    protected $_validate=array(
        array('viewname','require','{%m_require_viewname}'),
        array('adminname','require','{%m_require_adminname}'),
        array('mulu','GetMulu','{%m_require_mulu}',0,'callback'),
        array('sequence','number','{%m_sequence_correct}'),
        );
    //callback目录检测
    public function GetMulu(){
	    $PostId = I('post.id');
		$mulu = I('post.mulu');
		$where['mulu']=$mulu;
		$RsMulu = M('Language')->find($PostId);
		$IsExist = M('Language')->where($where)->Count();
		if(strlen(trim($mulu))==0){//是否为空
		    return false;
		}elseif(empty($PostId) and $IsExist>0){//新增时判断：是否存在
		    return false;
		}elseif((!empty($PostId) and $IsExist==1) and $RsMulu['mulu']!=$mulu){//更新时判断：是否存在
		    return false;
		}elseif(!empty($PostId) and $IsExist>1){//更新时判断：是否存在
		    return false;
		}elseif(!preg_match("/^[a-zA-Z\s]+$/",$mulu)){//是否为英文字母
		    return false;
		}else{
		    return true;
		}
    }

    // 自动完成
    protected $_auto=array(
        array('mulu','GetlowMulu',3,'callback'),
    );

    public function GetlowMulu(){
	    $mulu=strtolower(I('post.mulu'));//强制小写
		return $mulu;
    }
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