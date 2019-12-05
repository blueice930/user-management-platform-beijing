<?php
namespace app\mobile\controller;

use app\common\model\Book as MBook;
use app\common\model\BookSection;

class Book extends Controller
{

    public function index()
    {
        //获取banner列表
        //获取分类列表
        //获取第一个分类下的图书列表
        
        return $this->fetch('index');
    }

    public function bookDetail()
    {
        $id = $this->request->param('id');
        //获取图书详情
        $detail = MBook::where(['id'=>$id])->find();
        //获取图书的章节信息
        $sections = BookSection::where(['book_id'=>$id])->field('id,title,is_free')->select();
        //图书阅读量+1
        MBook::where(['id'=>$id])->setInc('view_num');
        $this->assign('detail',$detail);
        $this->assign('sections',$sections);
        return $this->fetch('bookDetail');
    }

    public function sectionDetail()
    {
        $id = $this->request->param('id');
        //获取章节详情
        $detail = BookSection::where(['id'=>$id])->find();
        $this->assign('detail',$detail);
        return $this->fetch('sectionDetail');
    }
}
