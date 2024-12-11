package com.example.liuy.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.vo.AssginRoleVo;
import com.example.liuy.model.vo.SysRoleQueryVo;


import java.util.Map;

public interface SysRoleService extends IService<SysRole> {
    IPage<SysRole> selectPage(Page<SysRole> pageParam, SysRoleQueryVo roleQueryVo);

    //根据id获取角色数据
    Map<String, Object> getRolesByUserId(String userId);

    //分配角色
    void doAssign(AssginRoleVo assginRoleVo);
}
