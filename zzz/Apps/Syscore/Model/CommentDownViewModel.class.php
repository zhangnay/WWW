<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class CommentDownViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Comment'=>array('*'),
     'Down'=>array('title','lan','id'=>'moduleinfoid','_on'=>'Down.id=Comment.infoid'),
   );

}
?>