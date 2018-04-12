<?php
namespace Syscore\Controller;
use Think\Controller;
class AttributeController extends BaseController{
    //编辑信息
    public function edit(){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
	
		IS_POST ? $moduleid = I('post.moduleid') : $moduleid = I('get.moduleid');
		$haveSort=isSort($moduleid,$lan);
		if($haveSort==false) $this->error(L('c_add_sort_first'),U('Sort/index?moduleid='.$moduleid.'&lan='.$lan));
		if(M('Module')->where('disabled=1')->select()==false) $this->error(L('c_add_module_first'),U('Module/edit?lan='.$lan));
		
	    $id=I('get.id');
	    $attribute = D('Attribute');
        if(IS_POST){
            if($attribute->create()){
			    $attribute->update()!==false ? $this->success(L('c_success'),U('index?moduleid='.$moduleid.'&lan='.$lan)) : $this->error(L('c_fail'));
            }else{
                $this->error($attribute->getError());
            }

        }else{
            $attribute   =   D('AttributeView');
			$result =   $attribute->find($id);
            $this->assign('rs',$result);
			
            $this->assign("module",M('Module')->order('id desc')->select());
			$lanwhere['lan'] = $lan;
			$lanwhere['moduleid']  = $moduleid;
            $this->assign("Sort",getSort(M('Sort')->where($lanwhere)->select()));

			$this->assign('moduleid',$moduleid);

            $this->display();
        }		
	}

    //用分页读取数据
    public function index($keyword=""){
        //判断是否获取语言变量，未获取则跳转到后台首页
		IS_POST ? $lan = I('post.lan') : $lan = I('get.lan');
		if(empty($lan)) redirect(U('Index/index?lan='.C('DEFAULT_LANG')));
		
		IS_POST ? $moduleid = I('post.moduleid') : $moduleid = I('get.moduleid');
        $attribute = D('AttributeView');  
        if(empty($keyword)){
			$map['lan']  = $lan;
			$map['moduleid']  = $moduleid;
		}else{
            $where['attribute.attname'] = array('like',"%$keyword%");
            $where['attribute.attvalue'] = array('like',"%$keyword%");
						
            $where['sort.title'] = array('like',"%$keyword%");
            $where['sort.seotitle'] = array('like',"%$keyword%");
            $where['sort.keyword'] = array('like',"%$keyword%");
            $where['sort.description'] = array('like',"%$keyword%");
            $where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['lan']  = $lan;
			$map['moduleid']  = $moduleid;
        } 
	
        $count = $attribute->where($map)->count();
        $p = getpage($count,20);
        $rs = $attribute->where($map)->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();
		
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 

		$this->assign('moduleid',$moduleid);
        $this->display();

    }
	
	//删除单条数据
    public function delete_one(){
	    $id=I('id');
        $attribute = M('Attribute');
        $rs=$attribute->delete($id);
        M('Attribute_value')->where("attid=".$id)->delete();
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	
	
	//批量删除数据
    public function delete_all(){
		$selectid=I('post.selectid');
		if(empty($selectid)) $this->error(L('c_delete_check'));
        $attribute = M('Attribute');
		$attributeValue = M('Attribute_value');
        for($i=0;$i<count($selectid);$i++){
		    $id=$selectid[$i];
            $rs=$attribute->delete($id);
            $attributeValue->where("attid=".$id)->delete();
	    }
		$rs ? $this->success(L('c_success')) : $this->error(L('c_fail'));
    }	

	//批量更新排序
    public function update_all(){
		$sequence = I('post.sequence');
		$id = I('post.id');
        $Attribute = M('Attribute');
        for($i=0;$i<count($sequence);$i++){
            $data['sequence'] = $sequence[$i];
            $Attribute->where('id='.$id[$i])->save($data);			
	    }
		$this->success(L('c_success'));
    }	

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

        foreach($attribute as $i=>&$rs){
		
		    
			if(!empty($infoid)){
		        $attWhere['infoid'] = $infoid;
		        $attWhere['attid'] = $rs['id'];
		        $attValueTable = M('Attribute_value')->where($attWhere);
				$attRs =   $attValueTable->find();
		    }
			
		    $key=$i+1;
			echo "    <div class=\"form-group\">";
            echo "    <label class=\"control-label col-md-3\">".$rs['attname']."</label>";
            echo "    <div class=\"col-md-5\">";
			echo "        <input type=\"hidden\" name=\"attValueId".$key."\" value=\"".$attRs['id']."\"><input type=\"hidden\" name=\"attid".$key."\" value=\"".$rs['id']."\">";
			$attValue=explode('|',$rs['attvalue']);
			switch ($rs['fieldtype']){
                case 2:
				    foreach($attValue as $v){
					    $attValueArray=explode("|",$attRs['attvalue']);
						$v2 = str_replace("*","",$v);//替换默认值的*号
						if(empty($infoid)){
						    strpos($v,"*") <1 ? $valueChecked="value=\"".$v2."\" checked=\"checked\"" : $valueChecked="value=\"".$v2."\"";
						}else{
						    in_array($v2,$attValueArray) ? $valueChecked="value=\"".$v2."\" checked=\"checked\"" : $valueChecked="value=\"".$v2."\"";
						}
						echo "<label class=\"checkbox-inline\">";
                        echo "    <input type=\"checkbox\" name=\"attvalue".$key."[]\" ".$valueChecked." />".$v2."&nbsp;&nbsp;";
						echo "</label>";
					}
                    break;
                case 3:
                    echo "<input type=\"text\" name=\"attvalue".$key."\" value=\"".$attRs['attvalue']."\" class=\"form-control\" />";
                    break;
                case 4:
                    echo "<textarea name=\"attvalue".$key."\" class=\"form-control\" rows=\"5\">".$attRs['attvalue']."</textarea>";
                    break;
                default:
                    echo "<select name=\"attvalue".$key."\" class=\"form-control\">";
					foreach($attValue as $v){
						$v2 = str_replace("*","",$v);//替换默认值的*号
						$selected="";
						if($attRs['attvalue']==$v2){
						    $selected=" selected=\"selected\"";
						}elseif(empty($attRs['attvalue'])){
						    if(strpos($v,"*")>0) $selected=" selected=\"selected\"";
						}
					    echo "<option value=\"".$v2."\"".$selected.">".$v2."</option>";
					}
					echo "</select>";
            }
			echo "    </div></div>";
	    }
        echo "<input type=\"hidden\" name=\"arrayNum\" value=\"".$key."\">";
    }



}

?>