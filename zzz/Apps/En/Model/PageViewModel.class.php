<?php
namespace En\Model;
use Think\Model\ViewModel;
class PageViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Page'=>array('*'),
     'Sort'=>array('id'=>'s_id','_on'=>'Page.sortid=Sort.id'),
   );

}
?>