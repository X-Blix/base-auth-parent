package com.example.liuy.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.liuy.model.system.SysUser;
import com.example.liuy.model.vo.SysUserQueryVo;


import java.util.Map;

public interface SysUserService extends IService<SysUser> {

    //用户列表
    IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo adminQueryVo);

    //更改用户状态
    void updateStatus(String id, Integer status);

    //根据用户名称查询数据
    SysUser getByUsername(String username);

    //获取用户信息
    Map<String, Object> getUserInfo(String username);
}
