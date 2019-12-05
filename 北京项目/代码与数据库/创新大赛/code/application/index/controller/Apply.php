<?php

namespace app\index\controller;

use think\Controller;

/**
 * 申请申报
 */
class Apply extends Controller {

    /**
     * 文章列表
     * @return type
     */
    public function index() {
        return $this->fetch('');
    }
}
