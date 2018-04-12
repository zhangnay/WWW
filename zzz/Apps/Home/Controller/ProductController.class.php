<?php
namespace Home\Controller;
use Think\Controller;
class ProductController extends BaseController {
	//详情页
    public function view(){
	    if(!IS_POST){
	        $id = I('get.id');
            if(empty($id)) $this->error(L('c_parameter_error'),U('Product/index'));
		    $product = M('Product');
		    $result = $product->find($id);
		    $this->assign('rs',$result);
            
		    //更新浏览次数
		    $product->where('id='.$id)->setInc('hits',1);

			//SEO
			empty($result['seotitle']) ? $this->assign('seotitle',$result['title']) : $this->assign('seotitle',$result['seotitle']);
		
		    $morepics = explode('|',$result['morepics']);
            $this->assign('piclist',$morepics);
            
			//评论
			$comment = M('Comment');
			$star = $comment->where("status=1 and moduleid=1 and infoid=".$id)->Count();
			$star3 = $comment->where("status=1 and star=3 and moduleid=1 and infoid=".$id)->Count();
			$star2 = $comment->where("status=1 and star=2 and moduleid=1 and infoid=".$id)->Count();
			$star1 = $comment->where("status=1 and star=1 and moduleid=1 and infoid=".$id)->Count();
            $this->assign('star3',$star3);
            $this->assign('star2',$star2);
            $this->assign('star1',$star1);
	        empty($starp3) ? $starp3 = 100 : $starp3 = round($star3/$star*100,1);
			$starp2 = round($star2/$star*100,1);
			$starp1 = round($star1/$star*100,1);
            $this->assign('starp3',$starp3);
            $this->assign('starp2',$starp2);
            $this->assign('starp1',$starp1);
			
			//属性
			$attWhere['infoid'] = $id;
			$this->assign('attribute',D('AttributeValue')->where($attWhere)->select());
			
			//评论
		    $where['infoid'] = $id;
			$where['status'] = 1;
            $count = $comment->where($where)->count();
            $p = getpage($count,20);
            $result = $comment->where($where)->order('parentid asc,sequence desc,addtime desc')->limit(10)->select();
		    $this->assign('list', findChild($result));

		    $this->display();
	    }else{
            $code = I('verify','','strtolower');
            //验证验证码是否正确
            if(!($this->check_verify($code))) $this->error(L('c_error_verify'));
	        $comment = D('Comment');
            if($comment->create()){
	        	$comment->update()!==false ? $this->success(L('c_success')) : $this->error(L('c_fail'));
            }else{
                $this->error($comment->getError());
            }
	    }
    }
	
	//列表页
    public function index($keyword=""){
        $Sort = M('Sort');
        $sortid = I('get.sortid');
        $sortResult = $Sort->select();
		
        //列表循环
        $product = D('ProductView');
        if(!empty($sortid)){  
		    //SEO
			$seoRs =  $Sort->find($sortid);
			empty($seoRs['seotitle']) ? $producttitle = $seoRs['title'] : $producttitle = $seoRs['seotitle'];
			$productkeyword = $seoRs['keyword'];
			$productdescription = $seoRs['description'];
			
        	//父类找子类
        	$sortidArr = "";
        	foreach(findChild($sortResult,$sortid) as $k => $w){
        	    $sortidArr .= $w['id'].",";
        	}
        	$where['product.sortid'] = array('in',"$sortidArr");
            $where['sort.id'] = $sortid;
            $where['_logic'] = 'or';
        	$map['_complex'] = $where;
		}
        if($keyword == ""){
        	$map['lan']  = C('DEFAULT_LANG');
        }else{
            $where['product.title'] = array('like',"%$keyword%");
            $where['product.seotitle'] = array('like',"%$keyword%");
            $where['product.keyword'] = array('like',"%$keyword%");
            $where['product.description'] = array('like',"%$keyword%");
            $where['product.content1'] = array('like',"%$keyword%");
            $where['product.content2'] = array('like',"%$keyword%");
            $where['product.content3'] = array('like',"%$keyword%");
            $where['product.content3'] = array('like',"%$keyword%");
            $where['_logic'] = 'or';
        	$map['_complex'] = $where;
        	$map['lan']  = C('DEFAULT_LANG');
        } 
	
        $count = $product->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->count();
		$listnum = M('Module')->find(1)['listnum'];//列表显示数量
        $p = getpage($count,$listnum);
        $rs = $product->where($map)->where("find_in_set('pc',client) and find_in_set('view',status)")->order('sequence desc,id desc')->limit($p->firstRow.','. $p->listRows)->select();

        if(!empty($sortid)){
		    $this->assign('producttitle', $producttitle);
		    $this->assign('productkeyword', $productkeyword);
		    $this->assign('productdescription', $productdescription);
		}
	        
        $this->assign('list', $rs); 
        $this->assign('page', $p->show()); 
        $this->display();
    }
	
    //验证码
    public function verify(){
        $Verify = new \Think\Verify();
        $Verify->codeSet = '3456789ABCDEFGHJKLMNPQRSTUVWXY';
        $Verify->fontSize = 30;
        $Verify->length = 4;
        $Verify->fontttf = '4.ttf';
        $Verify->useCurve = false;
        $Verify->entry();
    }

	//验证码检查
    protected function check_verify($code){
        $verify = new \Think\Verify();
        return $verify->check($code);
    }
	
    public function zan(){
        $ip = getClientIp();
        $id = I('post.id');//评论ID
        $rev = I('post.rev');//参数：赞成或反对
        if(!isset($id) || empty($id)) exit;
        
		$agree = M('Agree');
		$where['moduleid'] = 0;
		$where['infoid'] = $id;
		$where['ip'] = $ip;
		$count = $agree->where($where)->Count();
		
		$comment = M('Comment');
        if($count==0){
		    //赞成或反对+1
			if($rev=="agree"){
                $commentAdd=$comment->where('id='.$id)->setInc('agree');
			}else{
                $commentAdd=$comment->where('id='.$id)->setInc('against');
			}
            //写入投票者信息
            $data['moduleid'] = 0;
            $data['infoid'] = $id;
            $data['ip'] = $ip;
            $agree->add($data);
            //返回投票数
			$commentRs = $comment->find($id);
			if($rev=="agree"){
	            echo L('c_agree')."（".$commentRs['agree']."）";
			}else{
	            echo L('c_against')."（".$commentRs['against']."）";
			}
        }else{
		    $commentRs = $comment->find($id);
			if($rev=="agree"){
	            echo L('c_agree_ok')."（".$commentRs['agree']."）";
			}else{
	            echo L('c_against_ok')."（".$commentRs['against']."）";
			}
        }
	}
}
