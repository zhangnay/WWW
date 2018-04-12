<?php
namespace Syscore\Model;
use Think\Model\ViewModel;
class NewsViewModel extends ViewModel {
    // ViewModel视图模型
   public $viewFields = array(
     'News'=>array('*'),
     'Sort'=>array('id'=>'s_id','sequence'=>'s_sequence','title'=>'s_title','seotitle'=>'s_seotitle','keyword'=>'s_keyword','description'=>'s_description','lan'=>'s_lan','_on'=>'News.sortid=Sort.id'),
   );

}
?>