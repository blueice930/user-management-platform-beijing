<?php
namespace app\mobile\controller;

use haohan\weixin\jssdk\JsSdk;
use haohan\weixin\pay\JsApiPay;
use haohan\weixin\pay\lib\WxPayUnifiedOrder;
use haohan\weixin\pay\lib\WxPayApi;
use app\common\model\ActSign as MSign;

class Sign extends Controller
{

    protected function initialize()
    {
        // 执行父类初始化方法
        parent::initialize();
        
        // 分享信息初始化
        $weixinConfig = config('weixin');
        $jssdk = new JsSdk($weixinConfig['base']['appid'], $weixinConfig['base']['secret'], $weixinConfig['apiHost']);
        $signPackage = $jssdk->GetSignPackage();
        $this->assign("signPackage", $signPackage);
        $this->assign("ip", $this->request->ip());
        
        // //检查登录状态
        // 获取当前路由
        $route = $this->request->controller() . '/' . $this->request->action();
        // 非登录状态下可以访问的路由
        if (in_array(strtolower($route), $this->noAuthRoutes)) {
            return true;
        }
        // 已经登录
        if ($this->isLogin()) {
            return true;
        }
        // 如果没有微信session信息，先进行微信授权信息获取
        if (! $this->isWeixinAuth()) {
            // 记录当前uri
            $curUri = $this->request->url(true);
            session('cur_uri', $curUri);
            return $this->redirect('weixin/auth');
        }
    }

    public function index()
    {
        if ($this->request->isAjax()) {
            $orderCode = date("YmdHis").rand(10000, 99999);
            //支付费用
            $payMoney = 36;
            $param = [
                'openid' => session('openid'),
                'act_id' => 101,
                'sex' => $this->request->param('sex'),
                'name' => $this->request->param('name'),
                'birthday' => $this->request->param('birthday'),
                'parent' => $this->request->param('parent'),
                'join_time' => $this->request->param('join_time'),
                'mobile' => $this->request->param('mobile'),
                'organ' => $this->request->param('organ'),
                'teacher' => $this->request->param('teacher'),
                'pay_money' => $payMoney,
                'pay_status' => 0,
                'order_code' => $orderCode,
            ];
            $model = MSign::editParam(null, $param);
            //微信统一下单
            $tools = new JsApiPay();
            $input = new WxPayUnifiedOrder();
            $input->SetBody("包头市无线电测向体验活动");//商品名称
            $input->SetOut_trade_no($orderCode);//商户订单号
            $input->SetTotal_fee($payMoney*100);//总费用,单位分
            $input->SetTime_start(date("YmdHis"));
            $input->SetTime_expire(date("YmdHis", time() + 30*60));//30分钟后过期
            $input->SetNotify_url(url('payment/weixinNotify','','html',true));
            $input->SetTrade_type("JSAPI");
            $input->SetOpenid(session('openid'));
            $order = WxPayApi::unifiedOrder($input);
            $jsApiParameters = $tools->GetJsApiParameters($order);
            return $this->successPut(['jsApiParameters'=>json_decode($jsApiParameters,true),'order_code'=>$orderCode]);
        } else {
            /*$model = MSign::where('openid',session('openid'))->where('pay_status',1)->find();
            if($model){
                return $this->redirect("sign/detail",['order_code'=>$model['order_code']]);
            }*/
            return $this->fetch('index');
        }
    }
    
    public function detail(){
        $orderCode = $this->request->param("order_code");
        $model = MSign::where("order_code",$orderCode)->find();
        if(!$model){
            return "not found this order code!";
        }
        $data = [
            'join_time'=>$model->join_time,
            'order_code'=>$model->order_code,
        ];
        $this->assign('data',$data);
        return $this->fetch('detail');
    }
    
    public function test(){
        return $this->successPut(["a"=>1]);
    }
    
    public function openid(){
        $this->assign('data',['openid'=>session('openid')]);
        return $this->fetch('openid');
    }
    
    public function count(){
        $user = [
            'oS5v5s67MGdRISPLIgZjTTs94Wzo',//haohan
            'oS5v5s-Fa5n4VMMBh29RNui4RFEA',//赵鹏飞
            'oQIRn1poQ-tuNUKh29NtcdFumEBc',//孔经理
        ];
        $openid = session('openid');
        if(!in_array($openid, $user)){
            return "No authority";
        }
        $data = MSign::all(["pay_status"=>1]);
        $this->assign('data',$data);
        return $this->fetch('count');
    }
}
