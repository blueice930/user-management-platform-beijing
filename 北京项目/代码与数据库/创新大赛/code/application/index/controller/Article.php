<?php

namespace app\index\controller;

use think\Controller;
use app\common\model\Article as ArticleModel;

class Article extends Controller {

    /**
     * 文章列表
     * @return type
     */
    public function index() {
        //获取最新的20篇文章
        $model = new ArticleModel();
        $list = $model->where('status','1')->limit(20)->order('id','desc')->select();//column('id','title','create_time');
        return $this->fetch('',['list'=>$list]);
    }

    /**
     * 文章详情
     */
    public function detail($id) {
        if (empty($id) || !is_numeric($id)) {
            return false;
        }
        $detail = ArticleModel::get($id);
        return $this->fetch('', ['detail' => $detail]);
    }

}
