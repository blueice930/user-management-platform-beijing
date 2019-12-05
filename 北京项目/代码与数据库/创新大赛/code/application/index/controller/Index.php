<?php
namespace app\index\controller;


use think\Controller;
use app\common\model\Lianxiren;
use app\common\model\Pingwei;
use app\common\model\Study;
use app\common\model\Article;

class Index extends Controller
{
    public function index()
    {
        //跳转至文章列表页
        $this->redirect('Article/index');
        //return $this->fetch('');
    }
    
    /**
     * 文章详情
     */
    public function article_detail($id){
        if(empty($id) || !is_numeric($id)){
            return false;
        }
        $detail = Article::get($id);
        return $this->fetch('',['detail'=>$detail]);
    }

    public function dssb()
    {
        return $this->fetch('');
    }
    
    public function dssb_lxr()
    {
        if($this->request->isPost()){
            $study = new Lianxiren();
            $study->allowField(true)->save($_POST);
            return true;
        }else{
           return $this->fetch(''); 
        }
    }
    
    public function dssb_pw()
    {
        if($this->request->isPost()){
            $study = new Pingwei();
            $study->allowField(true)->save($_POST);
            return true;
        }
        return $this->fetch('');
    }
    
    public function dssb_xs()
    {
        if($this->request->isPost()){
            $study = new Study();
            $study->allowField(true)->save($_POST);
            return true;
        }else{
           return $this->fetch(''); 
        }
    }
    
    public function zpzs()
    {
        return $this->fetch('');
    }
}
