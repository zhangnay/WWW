<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class CommentProductViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Comment'=>array('*'),
     'Product'=>array('title','lan','id'=>'moduleinfoid','_on'=>'Product.id=Comment.infoid'),
   );

}
?>