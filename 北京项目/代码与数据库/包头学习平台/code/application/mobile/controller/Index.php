<?php
namespace app\mobile\controller;

use app\common\model\BookCat;
use app\common\model\Book;
class Index extends Controller
{
    //首页
    public function index()
    {
        //获取所有分类
        $cats = BookCat::where(['status'=>1])->select();
        //查询每个分类下的前十本书
        $books = Book::where(['status'=>1])->limit(50)->select();
        $catBooks = [];
        foreach ($books as $k=>$v){
            if(!isset($catBooks[$v['cat_id']])){
                $catBooks[$v['cat_id']] = [];
            }
            $catBooks[$v['cat_id']][] = $v;
        }
        $this->assign('cats',$cats);
        $this->assign('catBooks',$catBooks);
        return $this->fetch('index');
    }
    
}
