<?php

namespace app\index\controller;

use think\Controller;
use app\common\model\Work as WorkModel;

/**
 * 作品展示
 */
class Work extends Controller {

    /**
     * 列表
     * @return type
     */
    public function index() {
        //获取最新的20个
        $model = new WorkModel();
        $list = $model->where('status','1')->limit(20)->order('id','desc')->select();//column('id','title','create_time');
        return $this->fetch('',['list'=>$list]);
    }

    /**
     * 详情
     */
    public function detail($id) {
        if (empty($id) || !is_numeric($id)) {
            return false;
        }
        $detail = WorkModel::get($id);
        return $this->fetch('', ['detail' => $detail]);
    }

}
