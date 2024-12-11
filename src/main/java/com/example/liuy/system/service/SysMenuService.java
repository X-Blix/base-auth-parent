package com.example.liuy.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.liuy.model.system.SysMenu;
import com.example.liuy.model.vo.AssginMenuVo;
import com.example.liuy.model.vo.RouterVo;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-06
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     *
     * 菜单树形数据
     *
     * */
    List<SysMenu> findNodes();


    //删除菜单
    boolean removeMenuById(String id);


    //根据角色获取菜单
    List<SysMenu> findSysMenuByRoleId(String roleId);

    //给角色分配权限
    void doAssign(AssginMenuVo assginMenuVo);


    //根据用户id获取菜单权限值
    List<RouterVo> findUserMenuList(String id);

    //根据用户id获取用户按钮权限
    List<String> findUserPermsList(String id);
}
