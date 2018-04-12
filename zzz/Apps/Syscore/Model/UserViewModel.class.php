<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class UserViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Auth_group_access'=>array('*'),
     'User'=>array('*', '_on'=>'Auth_group_access.uid=User.id'),
     'Auth_group'=>array('id'=>'Auth_group_id','status','rules','title','_on'=>'Auth_group_access.group_id=Auth_group.id'),
   );

}
?>