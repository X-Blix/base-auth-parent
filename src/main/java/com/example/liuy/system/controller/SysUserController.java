package com.example.liuy.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.example.liuy.common.result.Result;
import com.example.liuy.common.utils.MD5;
import com.example.liuy.log.annotation.Log;
import com.example.liuy.log.type.BusinessType;
import com.example.liuy.model.system.SysUser;
import com.example.liuy.model.vo.SysUserQueryVo;
import com.example.liuy.system.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@Api(tags = "用户管理")
@RestController
@RequestMapping("/admin/system/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Log(title = "用户管理", businessType = BusinessType.STATUS)
    @PreAuthorize("hasAuthority('bnt.sysUser.update')")
    @ApiOperation(value = "更改用户状态")
    @GetMapping("updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable String id, @PathVariable Integer status) {
        sysUserService.updateStatus(id, status);
        return Result.ok();
    }

    //1.分页列表
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation(value = "获取分页列表")
    @GetMapping("/{page}/{limit}")
    public Result index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "userQueryVo", value = "查询对象", required = false)
            SysUserQueryVo userQueryVo) {
        Page<SysUser> pageParam = new Page<>(page, limit);
        IPage<SysUser> pageModel = sysUserService.selectPage(pageParam, userQueryVo);
        return Result.ok(pageModel);
    }


    //2.添加用户
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PreAuthorize("hasAuthority('bnt.sysUser.add')")
    @ApiOperation(value = "添加用户")
    @PostMapping("/save")
    public Result save(@RequestBody SysUser user) {
        //把输入的密码进行MD5加密
        String pwd = MD5.encrypt(user.getPassword());

        user.setPassword(pwd);
        user.setStatus(1);
        sysUserService.save(user);
        return Result.ok();

    }


    // 3. 根据id查询
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation(value = "查询用户")
    @GetMapping("/getUser/{id}")
    public Result get(@PathVariable String id) {
        SysUser user = sysUserService.getById(id);
        return Result.ok(user);
    }

    //4.修改用户
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysUser.update')")
    @ApiOperation(value = "修改用户")
    @PostMapping("/update")
    public Result updateById(@RequestBody SysUser user) {
//        boolean is_Sucess =  sysUserService.save(user);
          boolean is_Sucess =  sysUserService.updateById(user);
        if (is_Sucess){

            return Result.ok();
        }else {

            return Result.fail();
        }
    }

    //5.删除用户
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysUser.remove')")
    @ApiOperation(value = "删除用户")
    @DeleteMapping("/remove/{id}")
    public Result remove(@PathVariable String id) {
        boolean is_Sucess =  sysUserService.removeById(id);
        if (is_Sucess){

            return Result.ok();
        }else {

            return Result.fail();
        }
    }

}
