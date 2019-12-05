<?php
namespace app\common\model;

/**
 * 用户模型
 */
class User extends Model
{
    /**
     * 进行登录操作
     *
     * @param string $mobilephone
     * @param string $password
     */
    public static function doLogin($mobilephone, $password)
    {
        //通过用户名获取对象
        $model = self::get([
            'mobilephone' => $mobilephone
        ]);
        //验证
        if (!empty($password) && $model && $model->password == md5($password)) {
            //更新信息
            $model->last_time = time();
            if(!empty(session('openid'))){
                //存储openid
                $model->openid = session('openid');
                //存储昵称与头像
                if(!empty(session('access_token'))){
                    $info = Weixin::getUserInfo(session('openid'), session('access_token'));
                    if(empty($model->img)){
                        $model->img = $info['img'];
                    }
                    if(empty($model->nickname)){
                        $model->nickname = $info['nickname'];
                    }
                }
            }
            $model->save();
            //记录登录信息
            session('uid',$model->id);
            return true;
        }
    
        return false;
    }
    
    /**
     * 通过openid进行登录
     * @param string $openid
     */
    public static function doLoginByOpenid($openid){
        //获取对象
        $model = self::get([
            'openid' => $openid
        ]);
        //验证
        if ($model) {
            //更新信息
            $model->last_time = time();
            $model->save();
            //记录登录信息
            session('uid',$model->id);
            return true;
        }
        return false;
    }
    
    /**
     * 检查手机号是否已注册
     */
    public static function existMobilephone($mobilephone){
        //通过手机号获取对象
        $model = self::get([
            'mobilephone' => $mobilephone
        ]);
        //存在手机号返回true
        if($model){
            return true;
        }
        return false;
    }
    
    /**
     * 修改密码
     */
    public function editPassword($oldPassword,$newPassword){
        if(md5($oldPassword) != $this->password){
            return false;
        }
        $this->password = md5($newPassword);
        $this->save();
        return true;
    }
    
    /**
     * 判断手机号是否已存在
     */
    public static function isExistMobilephone($mobilephone){
        $count = static::where("mobilephone",$mobilephone)->count();
        return $count>0?true:false;
    }
    
    /**
     * 新增|编辑
     */
    public static function editParam($id, $param){
        if(empty($id)){
            $model = new static($param);
            $model->allowField(true)->save();
        }else{
            //编辑
            $model = static::get($id);
            $model->allowField(true)->save($param);
        }
        return $model;
    }
}