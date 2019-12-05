<?php

namespace app\index\controller;

use think\Controller;
use app\common\model\Liaison as LiaisonModel;

/**
 * 联系人模块
 */
class Liaison extends Controller {

    /**
     * 注册
     * @return type
     */
    public function register() {
        if($this->request->isPost()){
            $study = new LiaisonModel();
            $study->allowField(true)->save($_POST);
            return true;
        }else{
           return $this->fetch(''); 
        }
    }
    
    /**
     * 登录
     * @return type
     */
    public function login() {
        if($this->request->isPost()){
            $study = new LiaisonModel();
            $study->allowField(true)->save($_POST);
            return true;
        }else{
           return $this->fetch(''); 
        }
    }
}
