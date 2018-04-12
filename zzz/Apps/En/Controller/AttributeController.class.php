<?php
namespace En\Controller;
use Think\Controller;
class AttributeController extends BaseController{
    //Ajax分类对应属性
    public function getAttribute(){
	    //添加状态获取分类对应的属性名和属性值
	    $sortid=I('get.sortid');
//	    $mulu=I('get.mulu');
        $att = M('Attribute');
        $where['sortid'] = $sortid;
        $attribute = $att->field(true)->where($where)->order('sequence desc,id desc')->select();
		
        //编辑状态获取分类对应的属性值
		$infoid=I('get.infoid');

        echo "<table wdith=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
        foreach($attribute as $i=>&$rs){
		
		    
			if(!empty($infoid)){
		        $attWhere['infoid'] = $infoid;
		        $attWhere['attid'] = $rs['id'];
		        $attValueTable = M('Attribute_value')->where($attWhere);
				$attRs =   $attValueTable->find();
		    }
			
		    $key=$i+1;
            echo "<tr>";
            echo "    <td width=\"160\">".$rs['attname']."</td>";
            echo "    <td>";
			echo "        <input type=\"hidden\" name=\"attValueId".$key."\" value=\"".$attRs['id']."\"><input type=\"hidden\" name=\"attid".$key."\" value=\"".$rs['id']."\">";
			$attValue=explode('|',$rs['attvalue']);
			switch ($rs['fieldtype']){
                case 2:
				    foreach($attValue as $v){
					    $attValueArray=explode("|",$attRs['attvalue']);
						$v2 = str_replace("*","",$v);//替换默认值的*号
						if(empty($infoid)){
						    strpos($v,"*") !== false ? $valueChecked="value=\"".$v2."\" checked=\"checked\"" : $valueChecked="value=\"".$v2."\"";
						}else{
						    in_array($v2,$attValueArray) ? $valueChecked="value=\"".$v2."\" checked=\"checked\"" : $valueChecked="value=\"".$v2."\"";
						}
                        echo "<input type=\"checkbox\" name=\"attvalue".$key."[]\" ".$valueChecked." />".$v2."&nbsp;&nbsp;";
					}
                    break;
                case 3:
                    echo "<input type=\"text\" name=\"attvalue".$key."\" value=\"".$rs['attvalue']."\" />";
                    break;
                case 4:
                    echo "<textarea name=\"attvalue".$key."\">".$rs['attvalue']."</textarea>";
                    break;
                default:
                    echo "<select name=\"attvalue".$key."\" class=\"select_w\">";
					foreach($attValue as $v){
						$v2 = str_replace("*","",$v);//替换默认值的*号
						if($attRs['attvalue']==$v2){
						    $selected=" selected=\"selected\"";
						}else{
						    strpos($v,"*") !== false ? $selected=" selected=\"selected\"" : $selected="";
						}
					    echo "<option value=\"".$v2."\"".$selected.">".$v2."</option>";
					}
					echo "</select>";
            }
			echo "    </td>";
            echo "</tr>";
	    }
        echo "</table><input type=\"hidden\" name=\"arrayNum\" value=\"".$key."\">";
    }



}

?>