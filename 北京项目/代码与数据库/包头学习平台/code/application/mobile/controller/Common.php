<?php
namespace app\mobile\controller;
use haohan\phpqrcode\QRcode;
use app\common\model\Weixin;

/**
 * 公共类
 */
class Common extends Controller{
    /**
     * 二维码
     */
    public function qrcode(){
        $text = $this->request->param('text');
        QRcode::png($text, false, QR_ECLEVEL_L, 30, 1, false);
        exit();
    }
    
    /**
    * 微信图片上传
    */
   public function wxUploadImage(){
       //微信服务器资源id
       $media_id = $this->request->param('media_id');
       //类型
       $type = $this->request->get('type');
       //微信接口调用凭证
       $accessToken = Weixin::getAccessToken();
       $url="http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=$accessToken&media_id=$media_id";
       //获取文件
       $file=file_get_contents($url);
       //存储文件夹
       $dirPath = "./upload/images/weixin/".date("Ym")."/";
       if(!is_dir($dirPath)){
           if(!mkdir($dirPath,0777,true)){
               $this->error("目录创建失败");
           }
       }
       $filePath = $dirPath.date("YmdHis").rand(100,999).rand(100,999);
       file_put_contents($filePath.".jpg", $file);
       //图片转换
       if($type == 'user_img'){
           $image = \think\Image::open($filePath.".jpg");
           $filePath.="_small";
           $image->thumb(350,350,\think\Image::THUMB_CENTER)->save($filePath.".jpg");
       }
       return $this->success('','',['url'=>substr($filePath.".jpg", 1)]);
   }
}
