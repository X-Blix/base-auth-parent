package com.example.liuy.system.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.liuy.common.helper.RouterHelper;
import com.example.liuy.common.result.ResultCodeEnum;
import com.example.liuy.model.system.SysRoleMenu;
import com.example.liuy.model.vo.AssginMenuVo;
import com.example.liuy.model.vo.RouterVo;
import com.example.liuy.system.exception.DIYException;
import com.example.liuy.system.mapper.SysMenuMapper;
import com.example.liuy.system.mapper.SysRoleMenuMapper;
import com.example.liuy.model.system.SysMenu;
import com.example.liuy.system.service.SysMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.liuy.system.utils.MenuHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-06
 */
@Transactional
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {


    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;


    //菜单列表（树形）
    @Override
    public List<SysMenu> findNodes() {
        //获取所有菜单
        List<SysMenu> sysMenuList = baseMapper.selectList(null);

        //所有菜单数据转换要求数据格式
        List<SysMenu> result = MenuHelper.buildTree(sysMenuList);

        return result;
    }

    //删除菜单
    @Override
    public boolean removeMenuById(String id) {
        //1.查询当前删除菜单下面是否有子菜单
        //根据id = parentid
        int count = this.count(new QueryWrapper<SysMenu>().eq("parent_id", id));
        if (count > 0){
            throw new DIYException(ResultCodeEnum.NODE_ERROR);
        }

//        //另一种调用删除的方法
//        baseMapper.deleteById(id);
        sysMenuMapper.deleteById(id);
        return false;

    }

    @Override
    public List<SysMenu> findSysMenuByRoleId(String roleId) {
        //1.获取所有status为1的权限列表 （和获取所有菜单 status = 1）
        List<SysMenu> menuList = sysMenuMapper.selectList(new QueryWrapper<SysMenu>().eq("status", 1));

        //2.根据角色id获取角色权限(根据角色id查询角色分配过的菜单列表)
        List<SysRoleMenu> roleMenus = sysRoleMenuMapper.selectList(new QueryWrapper<SysRoleMenu>().eq("role_id",roleId));

        //3.获取该角色已分配的所有权限id(从第二步的菜单列表中，获取（角色分配所有的）菜单id)
        List<String> roleMenuIds = new ArrayList<>();
        for (SysRoleMenu roleMenu : roleMenus) {
            roleMenuIds.add(roleMenu.getMenuId());
        }

        //4.遍历所有权限列表（数据处理）：
        /*
            如果菜单选中是true，否则是false
            拿着分配菜单id 和 所有菜单对比 ，有相同的，让isSelect 值 为 true
        * */
        for (SysMenu sysMenu : menuList){
            if(roleMenuIds.contains(sysMenu.getId())){
                //设置该权限已被分配
                sysMenu.setSelect(true);
            }else {
                sysMenu.setSelect(false);
            }
        }

        //5.将权限列表转换为权限树 （转换成树形结构进行最终显示）
        List<SysMenu> sysMenus = MenuHelper.buildTree(menuList);
        return sysMenus;

    }

    //给角色分配权限
    @Override
    public void doAssign(AssginMenuVo assginMenuVo) {
        //删除已分配的权限(根据角色id删除菜单权限)
        sysRoleMenuMapper.delete(new QueryWrapper<SysRoleMenu>().eq("role_id",assginMenuVo.getRoleId()));

        //遍历所有已选择的权限id
        for (String menuId : assginMenuVo.getMenuIdList()){
            if(menuId != null){
                //创建SysRoleMenu对象
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenu.setRoleId(assginMenuVo.getRoleId());
                //添加新权限
                sysRoleMenuMapper.insert(sysRoleMenu);
            }
        }

    }

    //根据用户id获取菜单权限值
    @Override
    public List<RouterVo> findUserMenuList(String id) {
        //admin是超级管理员，操作所有内容
        List<SysMenu> sysMenuList = null;
        //判断userid的值是1代表超级管理员，查询所有权限数据
        if ("1".equals(id)){
            QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
            wrapper.eq("status",1);
            wrapper.orderByAsc("sort_value");
            sysMenuList = baseMapper.selectList(wrapper);
        }else {
            //如果userid不是1，其他类型的用户查询这个用户权限
            sysMenuList = sysMenuMapper.findListByUserId(id);
        }

        //构建树形数据
        List<SysMenu> sysMenuTreeList = MenuHelper.buildTree(sysMenuList);

        //构建路由
        List<RouterVo> routerVoList = RouterHelper.buildRouters(sysMenuTreeList);

        return routerVoList;


    }


    ////根据userid查询按钮权限值
    @Override
    public List<String> findUserPermsList(String id) {
        List<SysMenu> sysMenuList = null;
        //判断是否管理员
        if ("1".equals(id)) {
            sysMenuList = sysMenuMapper.selectList(new QueryWrapper<SysMenu>().eq("status", 1));
        }else {
            sysMenuList = sysMenuMapper.findListByUserId(id);
        }

        //创建返回的集合
        List<String> permissionList = new ArrayList<>();
        //type = 2：是按钮类型
        for (SysMenu sysMenu : sysMenuList) {
            if(sysMenu.getType() == 2){
                permissionList.add(sysMenu.getPerms());
            }
        }
        return permissionList;
    }

}
