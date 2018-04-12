<?php
namespace Home\Model;
use Think\Model\ViewModel;
class ProjectViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Project'=>array('*'),
     'Sort'=>array('id'=>'s_id','_on'=>'Project.sortid=Sort.id'),
   );

}
?>