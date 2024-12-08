package com.example.liuy.system.util;


import java.util.ArrayList;
import java.util.List;


import com.example.liuy.model.system.SysMenu;


//根据菜单数据构建菜单树的工具类
public class MenuHelper {

    // 1. 使用递归方法建菜单
    public static List<SysMenu> buildTree(List<SysMenu> sysMenuList) {
        //遍历集合封装最终数据
        List<SysMenu> trees = new ArrayList<>();
        //遍历所有菜单集合
        for (SysMenu sysMenu : sysMenuList) {
            //找到递归入口，parentid =0
            if ("0".equals(sysMenu.getParentId())) {
                trees.add(findChildren(sysMenu,sysMenuList));
            }
        }
        return trees;
    }

    //2. 递归查找子节点
    private static SysMenu findChildren(SysMenu sysMenu, List<SysMenu> treeNodes) {

        //数据初始化
        sysMenu.setChildren(new ArrayList<SysMenu>());

        //遍历递归查找
        for (SysMenu it : treeNodes){
            //如果当前菜单id和所有菜单parentid相等
            if(sysMenu.getId().equals(it.getParentId())){
                if (sysMenu.getChildren() == null){
                    sysMenu.setChildren(new ArrayList<>());
                }
                sysMenu.getChildren().add(findChildren(it,treeNodes));
            }
//            sysMenu.getChildren().add(findChildren(it,treeNodes));
        }

        return sysMenu;
    }


}


/*
另一种写法的pageHelper

package com.atguigu.common.helper;


import com.atguigu.model.system.SysMenu;

import java.util.ArrayList;
import java.util.List;


 根据菜单数据构建菜单树的工具类

public class MenuHelper {

     使用递归方法建菜单
    public static List<SysMenu> buildTree(List<SysMenu> sysMenuList) {
        List<SysMenu> trees = new ArrayList<>();
        for (SysMenu sysMenu : sysMenuList) {
            if (sysMenu.getParentId().longValue() == 0) {
                trees.add(findChildren(sysMenu,sysMenuList));
            }
        }
        return trees;
    }

    递归查找子节点
    public static SysMenu findChildren(SysMenu sysMenu, List<SysMenu> treeNodes) {
        sysMenu.setChildren(new ArrayList<SysMenu>());

        for (SysMenu it : treeNodes) {
            if(sysMenu.getId().longValue() == it.getParentId().longValue()) {
                if (sysMenu.getChildren() == null) {
                    sysMenu.setChildren(new ArrayList<>());
                }
                sysMenu.getChildren().add(findChildren(it,treeNodes));
            }
        }
        return sysMenu;
    }
}

 */
