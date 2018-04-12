<?php
namespace Home\Model;
use Think\Model;
class GuestbookModel extends Model {
    // 自动完成
    protected $_auto=array(
	    array('lan','getLan',3,'callback'),
        array('addtime','GetAddtime',3,'callback'),
    );
	
    public function getLan(){
	    if(IS_POST){
		    $lan=C('DEFAULT_LANG');
		    return $lan;
	    }
    }
    public function GetAddtime(){
	    if(IS_POST){
		    $Addtime=time();
		    return $Addtime;
	    }
    }

    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs){ //数据对象创建错误
            return false;
        }
        empty($rs['id']) ? $GetId=$this->add() : $GetId=$this->save();
		
		//添加或更新属性值
		$arrayNum=I("post.arrayNum");
		
		if(!empty($arrayNum) and $arrayNum>0){
			$lan=getLanguage();//多语言
			$attribute = M("Attribute_value");
			//变更类别及对应的属性
			if(!empty($rs['id'])){
		        for($i=1;$i<$arrayNum+1;$i++){
			        $attValueId=I("post.attValueId".$i);
				    if(empty($attValueId)) $attribute->where("infoid=".$rs['id'])->delete();
			    }
			}
		    for($i=1;$i<$arrayNum+1;$i++){
			    $attValueId=I("post.attValueId".$i);
				$postAttValue=I("post.attvalue".$i."");
			    if(is_array($postAttValue)){
				    $data['attvalue']="";
                    for($j=0;$j<count($postAttValue);$j++){
		                $data['attvalue'].=$postAttValue[$j]."|";
	                }
				}else{
                            $data['attvalue'] = $postAttValue;
				}
                $data['attid'] = I("post.attid".$i);
				if(!empty($rs['id']) && !empty($attValueId)) $data['id']=$attValueId;
                empty($rs['id']) ? $data['infoid'] = $GetId : $data['infoid'] = $rs['id'];
		        empty($rs['id']) || empty($attValueId) ? $attribute->add($data) : $attribute->save($data);
		    }
		}
        
    }






}
?>