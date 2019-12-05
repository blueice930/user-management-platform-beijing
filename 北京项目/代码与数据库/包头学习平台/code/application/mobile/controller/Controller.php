<?php
namespace app\mobile\controller;

use controller\BasicMobile;
use haohan\weixin\jssdk\JsSdk;

class Controller extends BasicMobile{

    /**
     * 非登录状态下可以访问的路由
     * 
     * @var Array
     */
    protected $noAuthRoutes = [
        //登录
        'user/login',
        //发送验证码
        'user/sendsms',
        //注册
        'user/register',
        //忘记密码
        'user/forget',
        //退出
        'user/logout',
        //微信auth
        'weixin/auth',
        //支付回调
        'payment/weixinnotify',
    ];
    
    protected $defaultRoute = "index/index";
    
    /**
     * 权限控制初始化方法
     */
    protected function initialize(){
        //执行父类初始化方法
        parent::initialize();
        
        //分享信息初始化
        $weixinConfig=config('weixin');
        $jssdk = new JsSdk($weixinConfig['base']['appid'],$weixinConfig['base']['secret'],$weixinConfig['apiHost']);
        $signPackage = $jssdk->GetSignPackage();
        $this->assign("signPackage",$signPackage);
        $this->assign("ip",$this->request->ip());
        
        //邀请人id
        if(!empty($this->request->param('from_id')) && is_numeric($this->request->param('from_id'))){
            session('from_id',$this->request->param('from_id'));
        }
        
        ////检查登录状态
        //获取当前路由
        $route = $this->request->controller().'/'.$this->request->action();
        //非登录状态下可以访问的路由
        if(in_array(strtolower($route), $this->noAuthRoutes)){
            return true;
        }
        //已经登录
        if($this->isLogin()){
            return true;
        }
        //如果没有微信session信息，先进行微信授权信息获取
        if(!$this->isWeixinAuth()){
            //记录当前uri
            $curUri = $this->request->url(true);
            session('cur_uri',$curUri);
            return $this->redirect('weixin/auth');
        }
        //跳转至登录页面
        return $this->redirect('user/login');
    }
    
    /**
     * 判断用户是否登录
     * @return bool
     */
    protected function isLogin() {
        $uid = $this->getUid();
        if (empty($uid)) {
            return false;
        }
        return true;
    }
    
    /**
     * 判断是否已进行微信授权
     */
    protected function isWeixinAuth(){
        $openid = session('openid');
        if (empty($openid)) {
            return false;
        }
        return true;
    }
    
    /**
     * 获取当前用户ID
     */
    protected function getUid() {
        return session('uid');
    }
    
}
    
