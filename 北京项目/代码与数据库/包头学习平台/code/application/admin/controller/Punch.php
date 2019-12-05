<?php
namespace app\admin\controller;

use controller\BasicAdmin;
use service\DataService;

/**
 * 签到记录
 */
class Punch extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'Punch';
    
    /**
     * 指定当前模型
     * @var string
     */
    public $model;
    
    // 初始化
    protected function initialize(){
        $modelClass = "\\app\\common\\model\\{$this->table}";
        $this->model = new $modelClass();
    }

    /**
     * 列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '签到记录';
        $get = $this->request->get();
        $db = $this->model->db();
        foreach (['uid'] as $field) {
            (isset($get[$field]) && $get[$field] !== '') && $db->where($field, $get[$field]);
        }
        return parent::_list($db);
    }
   
    /**
     * 添加
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function add()
    {
        return $this->_form($this->model, 'form');
    }

    /**
     * 编辑
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function edit()
    {
        return $this->_form($this->model, 'form');
    }
    
    /**
     * 上架
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function enable()
    {
        if (DataService::update($this->model)) {
            $this->success("操作成功！", '');
        }
        $this->error("操作失败，请稍候再试！");
    }
    
    /**
     * 下架
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function disable()
    {
        if (DataService::update($this->model)) {
            $this->success("操作成功！", '');
        }
        $this->error("操作失败，请稍候再试！");
    }
    
    /**
     * 表单数据默认处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _form_filter(&$data)
    {
        if (!$this->request->isPost()) {
            
        } 
    }

    /**
     * 删除用户
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        $model = $this->model;
        if($model::destroy($this->request->post('id'))){
            $this->success("删除成功！", '');
        }else{
            $this->error("删除失败，请稍候再试！");
        }
    }

}
