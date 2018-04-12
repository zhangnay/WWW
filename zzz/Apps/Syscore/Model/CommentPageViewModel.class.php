<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class CommentPageViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Comment'=>array('*'),
     'Page'=>array('title','lan','id'=>'moduleinfoid','_on'=>'Page.id=Comment.infoid'),
   );

}
?>