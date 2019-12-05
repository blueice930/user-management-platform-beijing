<?php

namespace app\common\model;

use haohan\weixin\jssdk\JsSdk;

/**
 * 微信模型
 */
class Weixin {

    /**
     * 获取用户token信息
     * @param string $code
     */
    public static function getUserTokenInfo($code) {
        //获取微信配置信息
        $weixinConfig = config('weixin');
        //构建url
        $url = "https://api.weixin.qq.com/sns/oauth2/access_token";
        $url = $url . '?appid=' . $weixinConfig['base']['appid'];
        $url = $url . '&secret=' . $weixinConfig['base']['secret'];
        $url = $url . '&code=' . $code;
        $url = $url . '&grant_type=authorization_code';

        ////请求url,获取微信对应的openid与access_token
        $result = self::curlGet($url);
        //判断是否调用成功
        if (!empty($result['access_token']) && !empty($result['openid'])) {
            return $result;
        }
        return false;
    }

    /**
     * 获取用户信息
     * @param string $openid
     * @param string $access_token
     */
    public static function getUserInfo($openid, $access_token) {
        //构建url
        $url = "https://api.weixin.qq.com/sns/userinfo";
        $url = $url . '?access_token=' . $access_token;
        $url = $url . '&openid=' . $openid;
        $url = $url . '&lang=zh_CN';
        //请求url,获得用户信息
        $result = self::curlGet($url);
        if (!empty($result)) {
            $data = [];
            $data['nickname'] = empty($result['nickname']) ? "" : $result['nickname'];
            $data['sex'] = empty($result['sex']) ? 0 : $result['sex'];
            $data['img'] = empty($result['headimgurl']) ? "" : $result['headimgurl'];
            $data['openid'] = $openid;
            $data['access_token'] = $access_token;
            return $data;
        }
        return false;
    }

    /**
     * 获取微信接口凭证
     */
    public static function getAccessToken() {
        //分享信息初始化
        $weixinConfig = config('weixin');
        $jssdk = new JsSdk($weixinConfig['base']['appid'], $weixinConfig['base']['secret'], $weixinConfig['apiHost']);
        return $jssdk->getAccessToken();
    }

    /**
     * GET请求
     */
    public static function curlGet($url, $data = null) {
        if (!empty($data)) {
            $url = $url . '?' . http_build_query($data);
        }
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10); //10秒超时
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //针对SSL不进行校验，避免https请求不了的问题
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $response = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Curl error: ' . curl_error($ch);
            trace('Curl error: ' . curl_error($ch) . ' url:' . $url, 'error');
        }
        $output = json_decode($response, true);
        return $output;
    }

}
