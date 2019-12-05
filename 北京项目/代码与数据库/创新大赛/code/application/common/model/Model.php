<?php
namespace app\common\model;

use think\Model as TModel;
use think\model\concern\SoftDelete;
use think\Request;

/**
 * 基础模型
 */
class Model extends TModel{
    
    //软删除
    use SoftDelete;
    
    /**
     * 通过ID获取名称
     * @param int $id
     */
    public static function getNameById($id){
        $key = get_called_class().':'.$id;
        //优先获取缓存内容
        $cache = cache($key);
        if($cache !== false){
            return $cache;
        }
        $model = static::editView($id);
        //设置缓存
        cache($key,$model['name'],3600);
        return $model['name'];
    }
    
    /**
     * 获取列表
     */
    public static function getList(){
        $list = static::all(function($query){
            $query->order(['id'=>'desc']);
        });
        return collection($list)->toArray();
    }
    
    /**
     * 分页列表
     */
    public static function page($where=[], $order=['id'=>'desc'], $rows=10, $field='content', $with = ""){
        $table = static::where($where)->with($with)->field($field,true)->order($order)->paginate($rows,false,['query'=>Request::instance()->param()]);
        $list = $table;
        $page = preg_replace(['|href="(.*?)"|', '|pagination|'], ['data-open="$1" href="javascript:void(0);"', 'pagination pull-right'], $table->render());
        return ['list'=>$list,'page'=>$page];
    }
    
    /**
     * 新增|编辑
     */
    public static function editParam($id, $param){
        if(empty($id)){
            //新增
            $model = new static($param);
            $model->allowField(true)->save();
        }else{
            //编辑
            $model = static::get($id);
            $model->allowField(true)->save($param);
        }
        return $model;
    }
    
    /**
     * 删除
     */
    public static function del($id){
        $model = static::get($id);
        if(!$model){
           return false; 
        }
        return $model->delete();
    }
    
    /**
     * 获取模型信息
     * @param int $id
     */
    public static function editView($id = null){
        if(empty($id)){
            $model = null;
        }else{
            $model = static::get($id);
        }
        
        return $model;
    }
    
    public static function modelId($id){
        $model = static::get($id);
        return $model;
    }
    
    /**
     * 格式化时间日期
     * @param string $time
     */
    public static function timeFormat($time=null){
        if(is_null($time)){
            return date("Y-m-d H:i:s");
        }
        return date("Y-m-d H:i:s",$time);
    }
}