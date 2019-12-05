<?php
namespace app\common\model;

/**
 * 短信模型
 */
class Sms extends Model
{
    /**
     * 发送验证码
     * @param string $mobilephone
     * @param string $code
     * @return boolean
     */
    public static function send($mobilephone,$code=null){
        if(empty($code)){
            $code = rand(100000, 999999);
        }
        //检查30秒内是否重复发送
        $where = [];
        $where['mobilephone'] = $mobilephone;
        $where['code'] = $code;
        $where['status'] = 0;
        $where['create_time'] = ['>',time()-30];
        $where['expire'] = ['>',time()];
        $count = self::where($where)->count();
        if($count>=1){
            return ['status'=>false,'msg'=>'30秒内请勿重复发送'];
        }
        //检查一天内发送的条数,一天不能超过5条
        unset($where['expire']);
        $where['create_time'] = ['>',strtotime(date("Y-m-d"))];
        $count = self::where($where)->count();
        if($count>=5){
            return ['status'=>false,'msg'=>'短信发送过去频繁'];
        }
        //加载sdk
        require_once env('root_path') . 'extend'.'/haohan/taobao/TopSdk.php';
        //获取配置信息
        $config = config('taobao');
        $time=date("H:i");
        $topC = new \TopClient;
        $topC->appkey = $config['appid'];
        $topC->secretKey = $config['secret'];
        $req = new \AlibabaAliqinFcSmsNumSendRequest;
        $req->setExtend($config['sms']['extend']);
        $req->setSmsType($config['sms']['type']);
        $req->setSmsFreeSignName($config['sms']['signName']);
        $req->setSmsParam("{'code':'$code','time':'$time'}");
        $req->setRecNum($mobilephone);
        $req->setSmsTemplateCode($config['sms']['templateCode']);
        $resp = $topC->execute($req);
        //保存记录
        $param = [
            'mobilephone'=>$mobilephone,
            'code'=>$code,
            'expire'=>time()+300,
            'status'=>Enum::enumNo,
        ];
        self::editParam(null, $param);
        //var_dump($resp);
        return ['status'=>true,'msg'=>'发送成功'];
    }
    
    /**
     * 验证验证码
     * @param string $mobilephone
     * @param string $code
     */
    public static function verify($mobilephone,$code){
        $where = [];
        $where['mobilephone'] = $mobilephone;
        $where['code'] = $code;
        $where['status'] = 0;
        $model = self::where($where)->where('expire','>',time())->find();
        if(!$model){
            return false;
        }
        $model->status = 1;
        $model->save();
        return true;
    }
    
}

