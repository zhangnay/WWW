<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class AttributeViewModel extends ViewModel {
   public $viewFields = array(
     'Attribute'=>array('*'),
     'Sort'=>array('id'=>'s_id','moduleid'=>'s_moduleid','sequence'=>'s_sequence','lan'=>'s_lan','title','seotitle','keyword','description','_on'=>'Attribute.sortid=Sort.id'),
   );
}
?>