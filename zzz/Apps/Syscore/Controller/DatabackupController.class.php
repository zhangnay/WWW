<?php
namespace Syscore\Controller;
use Think\Controller;
class DatabackupController extends BaseController{
    public function index(){
		$lan = I('get.lan');
        $DataDir = "databak/";
        mkdir($DataDir);
        if (!empty($_GET['Action'])) {
            import("Common.Org.MySQLReback");
            $config = array(
                'host' => C('DB_HOST'),
                'port' => C('DB_PORT'),
                'userName' => C('DB_USER'),
                'userPassword' => C('DB_PWD'),
                'dbprefix' => C('DB_PREFIX'),
                'charset' => 'UTF8',
                'path' => $DataDir,
                'isCompress' => 0, //是否开启gzip压缩
                'isDownload' => 0
            );
            $mr = new MySQLReback($config);
            $mr->setDBName(C('DB_NAME'));
            if ($_GET['Action'] == 'backup') {
                $mr->backup();
				//备份成功
				echo "<script>document.location.href='".U('index?lan='.$lan)."'</script>";
            } elseif ($_GET['Action'] == 'RL') {
                $mr->recover($_GET['File']);
				//还原成功
				echo "<script>alert('".L('c_success')."');document.location.href='".U('index?lan='.$lan)."'</script>";
            } elseif ($_GET['Action'] == 'Del') {
                if (@unlink($DataDir . $_GET['File'])) {
				//删除成功
				echo "<script>document.location.href='".U('index?lan='.$lan)."'</script>";
                } else {
                    $this->error(L('c_fail'));
                }
            }
            if ($_GET['Action'] == 'download') {

                function DownloadFile($fileName) {
                    ob_end_clean();
                    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
                    header('Content-Description: File Transfer');
                    header('Content-Type: application/octet-stream');
                    header('Content-Length: ' . filesize($fileName));
                    header('Content-Disposition: attachment; filename=' . basename($fileName));
                    readfile($fileName);
                }
                DownloadFile($DataDir . $_GET['file']);
                exit();
            }
        }
        $lists = $this->MyScandir('databak/');
        $this->assign("datadir",$DataDir);
        $this->assign("lists", $lists);
        $this->display();
    }
	
    private function MyScandir($FilePath = './', $Order = 0) {
        $FilePath = opendir($FilePath);
        while (false !== ($filename = readdir($FilePath))) {
            $FileAndFolderAyy[] = $filename;
        }
        $Order == 0 ? sort($FileAndFolderAyy) : rsort($FileAndFolderAyy);
        return $FileAndFolderAyy;
    }

}

?>