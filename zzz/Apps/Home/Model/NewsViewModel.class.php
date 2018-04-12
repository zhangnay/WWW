<?php
namespace Home\Model;
use Think\Model\ViewModel;
class NewsViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'News'=>array('*'),
     'Sort'=>array('id'=>'s_id','_on'=>'News.sortid=Sort.id'),
   );

}
?>