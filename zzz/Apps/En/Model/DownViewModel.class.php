<?php
namespace En\Model;
use Think\Model\ViewModel;
class DownViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Down'=>array('*'),
     'Sort'=>array('id'=>'s_id','_on'=>'Down.sortid=Sort.id'),
   );

}
?>