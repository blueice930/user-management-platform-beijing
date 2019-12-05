<?php

namespace app\mobile\controller;

use haohan\weixin\pay\PayNotifyCallBack;
use haohan\weixin\pay\lib\CLogFileHandler;
use haohan\weixin\pay\lib\WxPayLog;
use app\common\model\Sign as MSign;

/**
 * 支付相关
 * @author sunhaohan
 *
 */
class Payment extends Controller
{
    /**
     * 微信支付回调
     */
    public function weixinNotify(){
        //初始化日志
        $logHandler= new CLogFileHandler(LOG_PATH."pay_notify_".date('Y-m-d').'.log');
        $log = WxPayLog::Init($logHandler, 15);
        WxPayLog::DEBUG("weixin begin notify");
        WxPayLog::DEBUG(file_get_contents('php://input'));
        $notify = new PayNotifyCallBack(function($notifyData){
            $model = MSign::where('order_code', $notifyData['out_trade_no'])->find();
            if(!$model){
                WxPayLog::DEBUG("not find this model");
                return false;
            }
            //校验金额
            if($model['pay_money']*100!=$notifyData['total_fee']){
                WxPayLog::DEBUG("pay_money != total_fee");
                return false;
            }
            if($model['pay_status'] == 1){
                WxPayLog::DEBUG("pay_status has deal");
                return true;
            }
            $model->pay_status = 1;
            $model->save();
            WxPayLog::DEBUG("deal success!");
            return true;
        });
        $notify->Handle(false);
    }
}