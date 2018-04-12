<?php
namespace Syscore\Model;
use Think\Model;
class ModuleModel extends Model {
    // 自动验证
    protected $_validate=array(
        array('modulename','require','{%m_require_modulename}'),
        array('moduledir','Getmoduledir','{%m_require_mulu}',0,'callback'),
        );

    //callback目录检测
    public function Getmoduledir(){
	    $Postid = I('post.id');
		$moduledir = I('post.moduledir');
		$where['moduledir']=$moduledir;
		$Rsmoduledir = M('Module')->find($Postid);
		$IsExist = M('Module')->where($where)->Count();
		if(strlen(trim($moduledir))==0){//是否为空
		    return false;
		}elseif(empty($Postid) and $IsExist>0){//新增时判断：是否存在
		    return false;
		}elseif((!empty($Postid) and $IsExist==1) and $Rsmoduledir['moduledir']!=$moduledir){//更新时判断：是否存在
		    return false;
		}elseif(!empty($Postid) and $IsExist>1){//更新时判断：是否存在
		    return false;
		}elseif(!preg_match("/^[a-zA-Z\s]+$/",$moduledir)){//是否为英文字母
		    return false;
		}else{
		    return true;
		}
    }

    // 自动完成
    protected $_auto=array(
        array('moduledir','GetBigModuledir',3,'callback'),
        array('isdisplay','Getisdisplay',3,'callback'),
    );

    //callback获取状态
    public function Getisdisplay(){
	    if(IS_POST){
		    $isdisplay_array=I('post.isdisplay');
            for($i=0;$i<count($isdisplay_array);$i++){
			    $i<count($isdisplay_array)-1 ? $isdisplay.=$isdisplay_array[$i]."," : $isdisplay.=$isdisplay_array[$i];
	        }
		    return $isdisplay;
	    }
    }
	
    //callback模块目录首字母大写
    public function GetBigModuledir(){
	    if(IS_POST){
		    $Moduledir=strtolower(I('post.moduledir'));//全部变小写
		    $Moduledir=ucfirst($Moduledir);//首字母大写
		    return $Moduledir;
	    }
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