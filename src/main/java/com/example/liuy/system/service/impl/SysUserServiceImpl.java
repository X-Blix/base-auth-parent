package com.example.liuy.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.UpdateChainWrapper;
import com.baomidou.mybatisplus.extension.kotlin.KtQueryChainWrapper;
import com.baomidou.mybatisplus.extension.kotlin.KtUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.liuy.model.system.SysUser;
import com.example.liuy.model.vo.SysUserQueryVo;
import com.example.liuy.system.mapper.SysUserMapper;
import com.example.liuy.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.*;
import java.util.function.Function;

@Transactional
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;
    @Override
    public IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo adminQueryVo) {
        return baseMapper.selectPage(pageParam,adminQueryVo);
    }

    @Override
    public void updateStatus(String id, Integer status) {
        //根据用户id查询
        SysUser sysUser = sysUserMapper.selectById(id);
        //设置修改状态
        sysUser.setStatus(status);
        //调用方法进行修改
        sysUserMapper.updateById(sysUser);
    }


}
