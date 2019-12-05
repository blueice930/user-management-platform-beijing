<?php
namespace app\mobile\controller;
use app\common\model\User as MUser;
use app\common\model\Sms as MSms;
use app\common\model\Punch as MPunch;
use app\common\model\Feedback as MFeedback;
class User extends Controller
{
    //登录
    public function login()
    {
        //如果是验证请求
        if($this->request->isPost()){
            $mobilephone = $this->request->post('mobilephone');
            $password = $this->request->post('password');
            //数据验证
            $this->verifyArrEmpty([
                [$mobilephone, '手机号码'],
                [$password, '密码']
            ]);
            //执行密码验证
            if(MUser::doLogin($mobilephone, $password)){
                if(!empty(session('cur_uri'))){
                    $this->defaultRoute = session('cur_uri');
                    session('cur_uri',null);
                }
                return $this->success('登录成功',$this->defaultRoute);
            }else{
                return $this->error('手机号码或密码错误');
            }
        }
        //如果已经是登录状态,则自动登录
        if($this->isLogin()){
            return $this->redirect($this->defaultRoute);
        }
        return $this->fetch('login');
    }
    
    //退出
    public function logout(){
        //重置用户表中的openid
        if($this->getUid()){
            $model = MUser::modelId($this->getUid());
            $model->openid = md5($model->mobilephone);
            $model->save();
        }
        //清空session
        session(null);
        //跳转至登录页面
        return $this->redirect('user/login');
    }
    
    /**
     * 发送短信验证码
     */
    public function sendSms(){
        if(!$this->isWeixinAuth()){
            return $this->error('发送失败');
        }
        //验证
        $mobilephone = $this->request->param('mobilephone');
        $type = $this->request->param('type');
        $this->verifyArrEmpty([
            [$mobilephone, '手机号码'],
        ]);
        if($type=="register" && MUser::existMobilephone($mobilephone)){
            return $this->error('该手机号码已注册');
        }else if($type=="forget" && !MUser::existMobilephone($mobilephone)){
            return $this->error('该手机号码未注册');
        }
        //发送验证码
        $result = MSms::send($mobilephone);
        if(!$result['status']){
            return $this->error($result['msg']);
        }
        return $this->success('发送成功');
    }
    
    //注册
    public function register()
    {
        if($this->request->isPost()){
            $mobilephone = $this->request->param('mobilephone');
            $code = $this->request->param('code');
            $password = $this->request->param('password');
            if(empty($mobilephone) || empty(session('openid'))){
                return $this->error('请求参数有误,请刷新页面后重试');
            }
            //数据验证
            $this->verifyArrEmpty([
                [$mobilephone, '手机号码'],
                [$code, '验证码'],
                [$password, '密码']
            ]);
            //验证短信验证码
            if(!MSms::verify($mobilephone,$code)){
                return $this->error('验证码不正确');
            }
            //判断手机号是否存在
            if(MUser::existMobilephone($mobilephone)){
                return $this->error('该手机号已注册');
            }
            //注册
            $param = [
                'mobilephone'=>$mobilephone,
                'password'=>md5($password),
                'openid'=>session('openid'),
            ];
            if(!empty(session('from_id')) && is_numeric(session('from_id'))){
                $param = intval(session('from_id'));
            }
            MUser::editParam(null, $param);
            //登录操作
            MUser::doLogin($mobilephone, $password);
            return $this->success('登录成功',$this->defaultRoute);
        }
        return $this->fetch('register');
    }
    
    
    //忘记密码
    public function forget()
    {
        if($this->request->isPost()){
            $mobilephone = $this->request->param('mobilephone');
            $code = $this->request->param('code');
            $password = $this->request->param('password');
            if(empty($mobilephone) || empty(session('openid'))){
                return $this->error('请求参数有误,请刷新页面后重试');
            }
            //数据验证
            $this->verifyArrEmpty([
                [$mobilephone, '手机号码'],
                [$code, '验证码'],
                [$password, '密码']
            ]);
            //获取对象
            $model = MUser::get(['mobilephone' => $mobilephone]);
            if(!$model){
                return $this->error('该用户不存在');
            }
            //验证短信验证码
            if(!MSms::verify($mobilephone,$code)){
                return $this->error('验证码不正确');
            }
            //修改密码
            $model->password = md5($password);
            $model->save();
            return $this->success('密码修改成功,请重新登录',url("user/login"));
        }
        return $this->fetch('forget');
    }

    //个人中心首页
    public function index(){
        $model = MUser::editView($this->getUid());
        return $this->fetch('index',['model'=>$model]);
    }
    
    //签到
    public function punch(){
        //日历
        $calendar = [];
        //获取这个月的第一天
        $monthFirstDay = date("Y-m-01",time());
        //根据第一天是星期几,来判断偏差天数值
        $dis = (date("w",strtotime($monthFirstDay))==0)?7-1:date("w",strtotime($monthFirstDay))-1;
        //日历中的第一天
        $riliFirstDay = date("Y-m-d",strtotime("{$monthFirstDay} -{$dis} day"));
        //获取月份中最后一天
        $monthLastDay = date('Y-m-d', strtotime("{$monthFirstDay} +1 month -1 day"));
        //根据最后一天是星期几,来判断偏差天数值
        $dis = (date("w",strtotime($monthLastDay))==0)?7-7:7-date("w",strtotime($monthLastDay));
        //日历中的最后一天
        $riliLastDay = date("Y-m-d",strtotime("{$monthLastDay} +{$dis} day"));
            
        //今天
        $today = date("Y-m-d");
        //遍历日历第一天到最后一天
        for ($i = 0; $i < 60; $i ++) {
            $k = date("Y-m-d", strtotime("{$riliFirstDay} +{$i} day"));
            $v = 0;
            if ($k > $riliLastDay) {
                break;
            }
            if ($k < $today) {
                $v = "gone";
            } else if ($k > $today) {
                $v = "";
            } else {
                $v = "cur";
            }
            $calendar[$k] = $v;
        }
        
        //当天是否签到
        $models = MPunch::where(['uid'=>$this->getUid()])->order(['id'=>'desc'])->limit(60)->select();
        $punchDay = [];
        foreach($models as $v){
            $k = date("Y-m-d", strtotime($v['create_time']));
            $punchDay[$k] = "punched";
        }
        if(!isset($punchDay[$today])){
            //计算连续天数
            $count = 0;
            foreach ($punchDay as $k=>$v){
                $tmp = $count + 1;
                if($k != date("Y-m-d", strtotime("-{$tmp} day"))){
                    break;
                }
                $count ++;
            }
            //计算积分值
            $credit = 10;
            if($count >= 20){
                $credit = 40;
            }else if($count >= 10){
                $credit = 20;
            }
            //记录入库
            MPunch::editParam(null, [
                'uid' => $this->getUid(),
                'credit' => $credit
            ]);
            //把积分加到用户表
            MUser::where('id',$this->getUid())->update(['credit'=>['inc', $credit]]);
        }
        return $this->fetch('punch',['calendar'=>$calendar,'punchDay'=>$punchDay]);
    }
    
    //积分
    public function credit(){
        $user = MUser::editView($this->getUid());
        return $this->fetch('credit',['user'=>$user]);
    }
    
    //个人信息
    public function info(){
        $user = MUser::editView($this->getUid());
        return $this->fetch('info',['user'=>$user]);
    }
    
    //密码管理-修改密码
    public function editPassword(){
        if($this->request->isPost()){
            $oldPassword = $this->request->param('oldPassword');
            $newPassword = $this->request->param('newPassword');
            //数据验证
            $this->verifyArrEmpty([
                [$oldPassword, '原密码'],
                [$newPassword, '新密码']
            ]);
            //获取对象
            $model = MUser::get($this->getUid());
            if(!$model->editPassword($oldPassword,$newPassword)){
                return $this->error('原密码不正确');
            }
            return $this->success('密码修改成功');
        }
        return $this->fetch('editPassword');
    }
    
    //我的课程
    public function course(){
        return $this->fetch('course');
    }
    
    //我的读书
    public function book(){
        return $this->fetch('book');
    }
    
    //支付管理
    public function pay(){
        return $this->fetch('pay');
    }
    
    //修改用户信息
    public function editUserInfo(){
        if($this->request->isPost()){
            $model = MUser::get($this->getUid());
            $arr = [
                'nickname','img','sex','birthday','realname','school','address'
            ];
            foreach ($arr as $k=>$v){
                if(!empty($this->request->param($v))){
                    $model->{$v} = $this->request->param($v);
                }
            }
            $model->save();
            return $this->success('修改成功');
        }
    }
    
    //邀请入会
    public function invite(){
        //二维码链接
        $qrUrl = url('index/index', ['from_id'=> $this->getUid()], true, true);
        return $this->fetch('invite',['qrUrl' => urlencode($qrUrl)]);
    }
    
    //意见反馈
    public function feedback(){
        if($this->request->isPost()){
            $content = $this->request->param('content');
            //数据验证
            $this->verifyArrEmpty([
                [$content, '内容']
            ]);
            MFeedback::editParam(null, [
                'uid'=>$this->getUid(),
                'content'=>$content,
            ]);
            return $this->success('提交成功,感谢您提出的宝贵意见');
        }
        return $this->fetch('feedback');
    }
}
