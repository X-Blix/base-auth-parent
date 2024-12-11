package com.example.liuy;



import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.system.service.SysRoleService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
public class BaseAuthParentServiceApplicationTests {

    @Autowired
    private SysRoleService sysRoleService;

    //1.显示所有
    @Test
        public void testSelectList() {
            System.out.println(("----- selectAll method test ------"));
            //UserMapper 中的 selectList() 方法的参数为 MP 内置的条件封装器 Wrapper
            //所以不填写就是无任何条件
            List<SysRole> roles = sysRoleService.list();
            for (SysRole role : roles) {
                System.out.println("role = " + role);
            }
        }

    //2.添加数据
    @Test
    public void testInsert(){
        SysRole sysRole = new SysRole();
        sysRole.setRoleName("添加添加添加添加添加");
        sysRole.setRoleCode("role");
        sysRole.setDescription("BaseAuthParentServiceApplicationTests");

        boolean result = sysRoleService.save(sysRole);
        System.out.println(result); //成功还是失败
    }

    //3.更新数据
    @Test
    public void testUpdateById(){
        SysRole sysRole = new SysRole();
        sysRole.setId(String.valueOf(1));
        sysRole.setRoleName("角色管理员1");

        boolean result = sysRoleService.updateById(sysRole);
        System.out.println(result);

    }


    //4.根据id删除数据
    @Test
    public void testDeleteById(){
        boolean result = sysRoleService.removeById(2L);
        System.out.println(result);
    }

    //5.根据构造条件查询数据
    @Test
    public void testQueryWrapper() {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.ge("role_code", "role");
        List<SysRole> users = sysRoleService.list(queryWrapper);
        System.out.println(users);
    }



}
