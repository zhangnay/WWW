<?php
namespace Syscore\Model;
use Think\Model;
class GuestbookModel extends Model {
    // 自动验证
    protected $_validate = array(
     array('content','require','{%m_require_content}'),
    );

    // 自动完成
    protected $_auto=array(
        array('morepics','GetMorepics',3,'callback'),
        array('morefileurl','Getmorefileurl',3,'callback'),
        array('addtime','GetAddtime',3,'callback'),
    );
	
    //添加时间
    public function GetAddtime(){
	    if(IS_POST){
		    $Addtime=strtotime(I('post.addtime'));
		    return $Addtime;
	    }
    }

    //多图上传获取值
    public function GetMorepics(){
	    if(IS_POST){
		    $morepics_array=I('post.morepics');
            for($i=0;$i<count($morepics_array);$i++){
			    $i<count($morepics_array)-1 ? $morepics.=$morepics_array[$i]."|" : $morepics.=$morepics_array[$i];
	        }
		    return $morepics;
	    }
    }

    //多附件上传获取值
    public function Getmorefileurl(){
	    if(IS_POST){
		    $morefileurl_array=I('post.morefileurl');
            for($i=0;$i<count($morefileurl_array);$i++){
			    $i<count($morefileurl_array)-1 ? $morefileurl.=$morefileurl_array[$i]."|" : $morefileurl.=$morefileurl_array[$i];
	        }
		    return $morefileurl;
	    }
    }

    /* 添加或更新数据 */
    public function update(){
        $rs = $this->create();
        if(!$rs) return false;
		
		$attribute = M("Attribute_value");
		if(!empty($rs['id'])){
			//没有属性时，删除对应的属性值
			$where['moduleid'] = 6;
			$where['infoid'] = $rs['id'];
			$attValueRs = M('Attribute_value')->where($where)->find();
			if($attValueRs){
			    $attRs = M('Attribute')->find($attValueRs['attid']);
			    if($attRs == false) $attribute->where("attid=".$attValueRs['attid'])->delete();
			}
			//变更类别及对应的属性
			$sortid = M('Guestbook')->find($rs['id'])['sortid'];
			if(I('post.sortid')!=$sortid){
				if(empty($attValueId)) $attribute->where("infoid=".$rs['id'])->delete();
			}
		}
		
        empty($rs['id']) ? $GetId=$this->add() : $GetId=$this->save();
		
		//添加或更新属性值
		$arrayNum=I("post.arrayNum");
		
		if(!empty($arrayNum) and $arrayNum>0){
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
                $data['moduleid'] = 6;
				if(!empty($rs['id'])) $data['id']=$attValueId;
                empty($rs['id']) ? $data['infoid'] = $GetId : $data['infoid'] = $rs['id'];
		        empty($rs['id']) || empty($attValueId) ? $attribute->add($data) : $attribute->save($data);
		    }
		}
        
    }





}
?>