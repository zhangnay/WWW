<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class CommentNewsViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Comment'=>array('*'),
     'News'=>array('title','lan','id'=>'moduleinfoid','_on'=>'News.id=Comment.infoid'),
   );

}
?>