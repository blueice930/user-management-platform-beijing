<?php

namespace app\index\controller;

use think\Controller;
use app\common\model\Judge as JudgeModel;

/**
 * 评委模块
 */
class Judge extends Controller {

    /**
     * 注册
     * @return type
     */
    public function register() {
        if($this->request->isPost()){
            $study = new JudgeModel();
            $study->allowField(true)->save($_POST);
            return true;
        }
        return $this->fetch('');
    }
}
