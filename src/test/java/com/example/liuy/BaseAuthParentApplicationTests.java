package com.example.liuy;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.system.mapper.SysRoleMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
class BaseAuthParentApplicationTests {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    //1.查询所有
    @Test
    public void testSelectList() {
        System.out.println(("----- selectAll method test ------"));
        //UserMapper 中的 selectList() 方法的参数为 MP 内置的条件封装器 Wrapper
        //所以不填写就是无任何条件
        List<SysRole> sysRoles = sysRoleMapper.selectList(null);
        for (SysRole sysRole : sysRoles) {
            System.out.println("sysRole = " + sysRole);
        }
    }

    //2.添加操作
    @Test
    public void testInsert(){
        SysRole sysRole = new SysRole();
        sysRole.setRoleName("AAAAA");
        sysRole.setRoleCode("aaaaa");
        sysRole.setDescription("AAAAA");

        int result = sysRoleMapper.insert(sysRole);
        System.out.println(result); //影响的行数
        System.out.println(sysRole.getId()); //id自动回填
    }

    //3.修改
    @Test
    public void testUpdateById(){
        SysRole sysRole = new SysRole();
        sysRole.setId(String.valueOf(1));
        sysRole.setRoleName("修改修改修改");

        int result = sysRoleMapper.updateById(sysRole);
        System.out.println(result);

    }

    //4.删除 -- 根据id删除
    /**
     * application-dev.yml 加入配置
     * 此为默认值，如果你的默认值和默认的一样，则不需要该配置
     * mybatis-plus:
     *   global-config:
     *     db-config:
     *       logic-delete-value: 1
     *       logic-not-delete-value: 0
     */
    @Test
    public void testDeleteById(){
        int result = sysRoleMapper.deleteById(2L);
        System.out.println(result);
    }

    //5.批量删除
    @Test
    public void testDeleteBatchIds() {
        int result = sysRoleMapper.deleteBatchIds(Arrays.asList(1, 2));
        System.out.println(result);
    }

    //6.条件查询
    @Test
    public void testQueryWrapper() {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_code", "role");
        List<SysRole> users = sysRoleMapper.selectList(queryWrapper);
        System.out.println(users);
    }


    //7.条件删除
    @Test
    public void testQueryDelete() {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_code", "role");
        int users = sysRoleMapper.delete(queryWrapper);
        System.out.println(users);
    }



}
