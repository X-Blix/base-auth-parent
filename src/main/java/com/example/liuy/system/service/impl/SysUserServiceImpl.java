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
import com.example.liuy.model.vo.RouterVo;
import com.example.liuy.model.vo.SysUserQueryVo;
import com.example.liuy.system.mapper.SysMenuMapper;
import com.example.liuy.system.mapper.SysUserMapper;
import com.example.liuy.system.service.SysMenuService;
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

    @Autowired
    private SysMenuService sysMenuService;




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

   // 根据用户名称查询数据
    @Override
    public SysUser getByUsername(String username) {
        return sysUserMapper.selectOne(new QueryWrapper<SysUser>().eq("username",username));
    }

    @Override
    public Map<String, Object> getUserInfo(String username) {

        Map<String, Object> result = new HashMap<>();

        //根据username查询用户基本信息
        SysUser sysUser = this.getByUsername(username);


        //根据用户id获取菜单权限值
        List<RouterVo> routerVoList = sysMenuService.findUserMenuList(sysUser.getId());
        //根据用户id获取用户按钮权限
        List<String> permsList = sysMenuService.findUserPermsList(sysUser.getId());


        result.put("name", sysUser.getName());
        result.put("avatar", "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
        result.put("roles", new HashSet<>());
        result.put("buttons", permsList);
        result.put("routers", routerVoList);
        return result;
    }


}
