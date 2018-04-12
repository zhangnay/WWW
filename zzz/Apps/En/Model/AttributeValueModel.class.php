<?php
namespace En\Model;
use Think\Model\ViewModel;
class AttributeValueModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'AttributeValue'=>array('*'),
     'Attribute'=>array('fieldtype','attname','_on'=>'AttributeValue.attid=Attribute.id'),
   );

}
?>