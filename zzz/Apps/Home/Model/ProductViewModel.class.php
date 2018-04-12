<?php
namespace Home\Model;
use Think\Model\ViewModel;
class ProductViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'Product'=>array('*'),
     'Sort'=>array('id'=>'s_id','title'=>'sorttitle','_on'=>'Product.sortid=Sort.id'),
   );

}
?>