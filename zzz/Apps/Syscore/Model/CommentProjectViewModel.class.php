<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class CommentProjectViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Comment'=>array('*'),
     'Project'=>array('title','lan','id'=>'moduleinfoid','_on'=>'Project.id=Comment.infoid'),
   );

}
?>