<?php
namespace En\Controller;
use Think\Controller;
class CommentController extends BaseController {
	public function index(){
		if(!IS_POST){
		    $infoid = I('get.infoid');
		    $where['infoid'] = $infoid;
			$where['status'] = 1;
	        $Comment = M('Comment');
            $count = $Comment->where($where)->count();
            $p = getpage($count,20);
            $result = $Comment->where($where)->order('parentid asc,sequence desc,addtime desc')->limit($p->firstRow.','. $p->listRows)->select();
		    $this->assign('list', findChild($result));
            $this->assign('page', $p->show());
		
		    //信息
		    $moduleid = I('get.moduleid');
		    switch ($moduleid){
            case 1:
                $module = 'Product';
                break;
            case 2:
                $module = 'News';
                break;
            case 3:
                $module = 'Down';
                break;
            case 4:
                $module = 'Page';
                break;
            case 5:
                $module = 'Project';
                break;
            default:
                $module = 'Product';
            }
		    $moduleRs = M($module)->find($infoid);
            $this->assign('modulers',$moduleRs);
            $this->assign('module',$module);
		
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
