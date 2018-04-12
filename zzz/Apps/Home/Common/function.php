<?php
//语言
function getLanguage(){
    $lan   =   M('Language');
    $where['status'] = 1;
    $language = $lan->where($where)->order('sequence desc,id desc')->select();
	return $language;
}

//分类是否存在
function isSort($moduleid=1,$lan="ch"){
    $Sort   =   M('Sort');
    $where['moduleid'] = $moduleid;
    $where['lan'] = $lan;
    $haveSort = $Sort->where($where)->select();
	return $haveSort;
}

//导航
function getNavigation($id){
    $lan = I('get.lan');
    if(empty($lan)) $lan = C('DEFAULT_LANG');
    $where['parentid'] = $id;
    $where['lan'] = $lan;
    $haveChild = M('Navigation')->where($where)->order("sequence desc,id desc")->select();
	return $haveChild;
}

//顶部导航
function getNavList($id=0,$pul="<ul>",$pli="<li>",$pspan="<span>",$pul_end="</ul>",$pli_end="</li>",$pspan_end="</span>"){
    $navResult = getNavigation($id);
	if($navResult == true){
	    foreach ($navResult as $k => $navRs) {
	        $havechild = getNavigation($navRs['id']);
	        $span = "";	$ul = ""; $li = "";	$span_end = "";	$ul_end = ""; $li_end = "";
	        if($havechild == true) $span = $pspan; $ul = $pul; $li = $pli; $span_end = $pspan_end; $ul_end = $pul_end; $li_end = $pli_end;
            echo $pli;
	            echo $span."<a href=\"".$navRs['navurl']."\">".$navRs['navname']."</a>".$ul;
		        if($havechild == true){
		            foreach($havechild as $k => $v){
	                    $havechild2 = getNavigation($v['id']);
	                    $span2 = ""; $ul2 = ""; $li2 = ""; $span_end2 = ""; $ul_end2 = ""; $li_end2 = "";
	                    if($havechild2 == true) $span2 = $pspan; $ul2 = $pul; $li2 = $pli; $span_end2 = $pspan_end; $ul_end2 = $pul_end; $li_end2 = $pli_end;
				        echo $pli.$span2."<a href=\"".$v['navurl']."\">".$v['navname']."</a>".$ul2;
				        if($havechild2 == true){
				            foreach($havechild2 as $k => $w){
					            echo $pli."<a href=\"".$w['navurl']."\">".$w['navname']."</a>".$pli_end;
					        }
				        }
				        echo $ul_end2.$span_end2.$pli_end;
		            }
		        }
		        echo $ul_end.$span_end;
	        echo $pli_end;
        }
	}
}

//无限级别分类
function getSort2($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge($temp,getSort2($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//分类
function getSort($id=0,$lan="ch",$moduleid=1){
    $where['parentid'] = $id;
    $where['lan'] = $lan;
    $where['moduleid'] = $moduleid;
    $haveChild = M('Sort')->where($where)->order("sequence desc,id desc")->select();
	return $haveChild;
}

//单页面左侧分类
function getPageSort($id=0,$moduleid=1){
    $lan = C('DEFAULT_LANG');
    $where['parentid'] = id;
    $where['lan'] = $lan;
    $where['moduleid'] = $moduleid;
    $sortResult = M('Sort')->where($where)->order("sequence desc,id desc")->select();
	CONTROLLER_NAME!='Guestbook' ? $controllername=CONTROLLER_NAME : $controllername='Page';
	foreach($sortResult as $k => $sortRs){
//	    echo "<li class=\"page_leftnav_current\">".$sortRs['title']."</li>";
        $infoRs = M($controllername)->where("sortid=".$sortRs['id'])->order("sequence desc,id desc")->select();
		foreach($infoRs as $k => $rs){
		    echo "<li><a href=\"".U($controllername.'/view?id='.$rs['id'])."\">".$rs['title']."</a></li>";
		}
	}
}	    

//左侧分类
function getSortList($moduleid=1){
    $lan = C('DEFAULT_LANG');
    $sortResult = getSort(0,$lan,$moduleid);
	$sortid = I('get.sortid');
	if(empty($sortid)) $sortid = M('Product')->find(I('get.id'))['sortid'];
	$i=1; $j=1;
	if($sortResult == true){
	    foreach($sortResult as $k => $sortRs){
	        $havechild = getSort($sortRs['id'],$lan,$moduleid);
			$plus = "";
			if($havechild == true) $plus = "<span class=\"fr pdr15 cursor\">[+]</span>";
			//是否选中开始
			if($sortid == $sortRs['id']){
		        echo "<li onclick=\"javascript:c(first".$i.");\" id=\"first".$i."\" class=\"leftnav_current\"><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$sortRs['id'])."\" class=\"fl\">".$sortRs['title']."</a>".$plus."</li>";
			}else{
		        echo "<li onclick=\"javascript:c(first".$i.");\" id=\"first".$i."\"><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$sortRs['id'])."\" class=\"fl\">".$sortRs['title']."</a>".$plus."</li>";
			}
			//是否选中结束
	        if($havechild == true){
			    //是否展开开始
		        $Sort = M('Sort');
				$sortParentid = M('Sort')->find($sortid)['parentid'];
				$twoData = M('Sort')->where("parentid=".$sortRs['id'])->select();
				foreach($twoData as $k => $fv){
				    $twoSortid = $fv['id'];
				}
				if($sortid==$sortRs['id'] or $sortRs['id']==$sortParentid or $twoSortid==$sortParentid){
			        echo "<ul id=\"first".$i."d\">";
				}else{
			        echo "<ul id=\"first".$i."d\" style=\"display:none;\">";
				}
			    //是否展开结束
				foreach($havechild as $k => $v){
	                $havechild2 = getSort($v['id'],$lan,$moduleid);
					$plus2 = "";
					if($havechild2 == true) $plus2 = "<span class=\"fr pdr15 cursor\">[+]</span>";
					//是否选中开始
					if($sortid == $v['id']){
				        echo "<li onclick=\"javascript:c(two".$j.");\" id=\"two".$j."\" class=\"leftnav_current\"><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$v['id'])."\" class=\"fl\">|---".$v['title']."</a>".$plus2."</li>";
					}else{
				        echo "<li onclick=\"javascript:c(two".$j.");\" id=\"two".$j."\"><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$v['id'])."\" class=\"fl\">|---".$v['title']."</a>".$plus2."</li>";
					}
					//是否选中结束
	                if($havechild2 == true){
			            //是否展开开始
				        if($sortid==$v['id'] or $v['id']==$sortParentid){
			                echo "<ul id=\"two".$j."d\">";
				        }else{
			                echo "<ul id=\"two".$j."d\" style=\"display:none;\">";
				        }
			            //是否展开结束
				        foreach($havechild2 as $k => $w){
						    //是否选中开始
						    if($sortid == $w['id']){
						        echo "<li class=\"leftnav_current\"><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$w['id'])."\">|---|---".$w['title']."</a></li>";
							}else{
						        echo "<li><a href=\"".U(CONTROLLER_NAME.'/index?sortid='.$w['id'])."\">|---|---".$w['title']."</a></li>";
							}
							//是否选中结束
						}
						echo "</ul>";
					}
					$j.=$j++;
				}
				echo "</ul>";
			}
			$i.=$i++;
		}
	}
}

//通过子类找父类
function findFather($data,$sortid,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['id'] == $sortid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$temp[] = $v;
			$temp = array_merge(findFather($data,$v['parentid'],'|---',$level+1),$temp);
		}
	}
	return $temp;
}

//通过父类找子类
function findChild($data,$parentid=0,$html="|---",$level=0){
	$temp = array();
	foreach ($data as $k => $v) {
		if($v['parentid'] == $parentid){
			$str = str_repeat($html, $level);
			$v['html'] = $str;
			$v['level'] = $level;
			$temp[] = $v;
			$temp = array_merge($temp,findChild($data,$v['id'],'|---',$level+1));
		}
	}
	return $temp;
}

//分页函数：$count要分页的总记录数 $pagesize每页查询条数 return \Think\Page
function getPage($count, $pagesize = 20){
    $p = new Think\Page($count, $pagesize);
    $p->setConfig('header', '<li class="rows">'.L('v_total').' <b>%TOTAL_ROW%</b> '.L('v_records').'&nbsp;&nbsp;&nbsp;&nbsp; '.L('v_total').' <b><font class="red">%NOW_PAGE%</font> / %TOTAL_PAGE%</b> '.L('v_page').'</li>');
    $p->setConfig('prev', L('v_prev'));
    $p->setConfig('next', L('v_next'));
    $p->setConfig('last', L('v_last'));
    $p->setConfig('first', L('v_first'));
    $p->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');
    $p->lastSuffix = false;//最后一页不显示为总页数
    return $p;
}

//面包屑导航	
function getCommonSort($moduleid=1){
    $id = I('get.id');
    $sortid = I('get.sortid');
    
    if(empty($sortid) and empty($id)){
        $sortnav = "";
    }else{
        if(!empty($id)){
            $module = M(CONTROLLER_NAME);
            $result = $module->find($id);
            $sortid = $result['sortid'];
    	}
        $Sort = M('Sort');
        $sortWhere['lan'] = C('DEFAULT_LANG');
        $sortWhere['moduleid'] = $moduleid;
        $sortResult = $Sort->where($sortWhere)->select();
    	$sortnav = "";
    	foreach(findFather($sortResult,$sortid) as $k => $v){
    	    $sortnav .= " &gt; ".$v['title'];
    	}
    	$sortnav = $sortnav;
    }
	return $sortnav;
}


//获取用户真实IP
function getClientIp() {
	if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
		$ip = getenv("HTTP_CLIENT_IP");
	else
		if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
			$ip = getenv("HTTP_X_FORWARDED_FOR");
		else
			if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
				$ip = getenv("REMOTE_ADDR");
			else
				if (isset ($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
					$ip = $_SERVER['REMOTE_ADDR'];
				else
					$ip = "unknown";
	return ($ip);
}
?>