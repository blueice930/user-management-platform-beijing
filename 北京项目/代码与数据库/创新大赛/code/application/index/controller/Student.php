<?php

namespace app\index\controller;

use think\Controller;
use app\common\model\Student as StudentModel;

/**
 * 学生模块
 */
class Student extends Controller {

    /**
     * 注册页面
     * @return type
     */
    public function register() {
        if($this->request->isPost()){
            $study = new StudentModel();
            $study->allowField(true)->save($_POST);
            return true;
        }else{
           return $this->fetch(''); 
        }
    }
}
