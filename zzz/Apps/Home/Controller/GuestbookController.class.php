<?php
namespace Home\Controller;
use Think\Controller;
class GuestbookController extends BaseController {
    public function index(){
	    $lan = C('DEFAULT_LANG');
		$haveSort=isSort(6,$lan);
		if($haveSort==false) $this->error(L('c_add_sort_first'));
        if(!IS_POST){
		    if(!empty($sortid)){
		        //SEO
			    $seoRs =  $Sort->find($sortid);
			    empty($seoRs['seotitle']) ? $guestbooktitle = $seoRs['title'] : $guestbooktitle = $seoRs['seotitle'];
			    $guestbookkeyword = $seoRs['keyword'];
			    $guestbookdescription = $seoRs['description'];
			}
            //分类赋值
			$sortwhere['lan'] = $lan;
			$sortwhere['moduleid'] = 6;
            $this->assign("Sort",getSort2(M('Sort')->where($sortwhere)->select()));

            if(!empty($sortid)){
		        $this->assign('guestbooktitle', $guestbooktitle);
		        $this->assign('guestbookkeyword', $guestbookkeyword);
		        $this->assign('guestbookdescription', $guestbookdescription);
		    }
			
		    $this->display();
        }else{
            $code = I('verify','','strtolower');
            //验证验证码是否正确
            if(!($this->check_verify($code))) $this->error(L('c_error_verify'));
            
		    $guestbook = D('Guestbook');
            if($guestbook->create()){
			    $guestbook->update()!==false ? $this->success(L('c_success')) : $this->error(L('c_fail'));
            }else{
                $this->error($guestbook->getError());
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
	
}
