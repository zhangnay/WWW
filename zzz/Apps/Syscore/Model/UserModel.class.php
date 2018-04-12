<?php
namespace Syscore\Model;
use Think\Model;
class UserModel extends Model {
    // 定义自动验证
    protected $_validate=array(
        array('username','require','{%m_require_username}'),
		array('username','','{%m_username_exists}',0,'unique',1),
        array('password','require','{%m_require_password}',0,'6,20'),
		array('vpassword','password','{%m_password_inconsistent}',0,'confirm'),
        );
    // 定义自动完成
    protected $_auto=array(
		array('password','md5',1,'function'),
        array('password','GetPassword',2,'callback'),
        array('addtime','time',1,'function'),
        );
		
    //callback密码为空时不修改
    public function GetPassword(){
	    $password = I("post.password");
	    if(empty($password)){
		    $user = M("User")->find(I('id'));
		    $password = $user['password'];
		}else{
		    $password = md5($password);
		}
	    return $password;
    }
		
    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs){ //数据对象创建错误
            return false;
        }
        empty($rs['id']) ? $GetId = $this->add() : $this->save();
		
		//添加或更新auth_group_access表
		$AuthGroupAccess = M("Auth_group_access");
		$data['group_id'] = I("post.groupid");
		empty($rs['id']) ? $data['uid'] = $GetId : $data['uid'] = $rs['id'];
		empty($rs['id']) ? $AuthGroupAccess->add($data) : $AuthGroupAccess->save($data);
		
    }


 }

?>