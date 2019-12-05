<?php
namespace app\mobile\controller;

use app\common\model\Weixin as MWeixin;
use app\common\model\User as MUser;
/**
 * 微信相关控制器
 */
class Weixin extends Controller {
    
    /**
     * 微信授权
     */
    public function auth(){
        //获取微信配置信息
        $weixinConfig=config('weixin');
    
        ////判断是否是微信回调
        $code=$this->request->get('code');
        $state=$this->request->get('state');
        //如果是微信回调
        if(!empty($code)&&$state=="sun"){
            //获取token信息
            $result=MWeixin::getUserTokenInfo($code);
            //判断是否调用成功
            if(!$result){
                echo 'Auth Fail';
                exit();
            }
            //获得openid与access_token
            $access_token=$result['access_token'];
            $openid=$result['openid'];
            
            //保存至session,并跳转至主页
            session("openid",$openid);
            session("access_token",$access_token);
            $curUri=session('cur_uri');
            if(!empty($curUri)){
                //尝试通过openid自动登陆
                MUser::doLoginByOpenid($openid);
                session('cur_uri',null);
                return $this->redirect($curUri);
            }else{
                return $this->redirect('user/login');
            }
        }
        //如果是微信非回调，跳转至授权页面
        else{
            //构建url
            $url=$weixinConfig['authUrl'];//"https://open.weixin.qq.com/connect/oauth2/authorize";
            $url=$url.'?appid='.$weixinConfig['base']['appid'];
            $url=$url.'&redirect_uri='.url('weixin/auth','','html',true);;
            $url=$url.'&response_type=code';
            $url=$url.'&scope=snsapi_userinfo';
            $url=$url.'&state=sun#wechat_redirect';
            $this->redirect($url);
            exit;
        }
    }
}
