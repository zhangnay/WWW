<?php
namespace Syscore\Model;
use Think\Model;
class DownModel extends Model {
    // 自动验证
    protected $_validate = array(
     array('title','require','{%m_title_require_first}'),
    );

    // 自动完成
    protected $_auto=array(
        array('status','GetStatus',3,'callback'),
        array('client','GetClient',3,'callback'),
        array('auth_group','GetAuthGroup',3,'callback'),
        array('morefileurl','Getmorefileurl',3,'callback'),
        array('addtime','GetAddtime',3,'callback'),
    );
	
    //callback添加时间
    public function GetAddtime(){
	    if(IS_POST){
		    $Addtime=strtotime(I('post.addtime'));
		    return $Addtime;
	    }
    }

    //callback获取状态
    public function GetStatus(){
	    if(IS_POST){
		    $status_array=I('post.status');
            for($i=0;$i<count($status_array);$i++){
			    $i<count($status_array)-1 ? $status.=$status_array[$i]."," : $status.=$status_array[$i];
	        }
		    return $status;
	    }
    }

    //callback获取客户端
    public function GetClient(){
	    if(IS_POST){
		    $client_array=I('post.client');
            for($i=0;$i<count($client_array);$i++){
			    $i<count($client_array)-1 ? $client.=$client_array[$i]."," : $client.=$client_array[$i];
	        }
		    return $client;
	    }
    }

    //callback获取权限组
    public function GetAuthGroup(){
	    if(IS_POST){
		    $auth_group_array=I('post.auth_group');
            for($i=0;$i<count($auth_group_array);$i++){
			    $i<count($auth_group_array)-1 ? $auth_group.=$auth_group_array[$i]."," : $auth_group.=$auth_group_array[$i];
	        }
		    return $auth_group;
	    }
    }

    //callback多附件上传获取值
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
			$where['moduleid'] = 3;
			$where['infoid'] = $rs['id'];
			$attValueRs = M('Attribute_value')->where($where)->find();
			if($attValueRs){
			    $attRs = M('Attribute')->find($attValueRs['attid']);
			    if($attRs == false) $attribute->where("attid=".$attValueRs['attid'])->delete();
			}
			//变更类别及对应的属性
			$sortid = M('Down')->find($rs['id'])['sortid'];
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
                $data['moduleid'] = 3;
				if(!empty($rs['id'])) $data['id']=$attValueId;
                empty($rs['id']) ? $data['infoid'] = $GetId : $data['infoid'] = $rs['id'];
		        empty($rs['id']) || empty($attValueId) ? $attribute->add($data) : $attribute->save($data);
		    }
		}
        
    }





}
?>