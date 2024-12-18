package com.example.liuy.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.liuy.common.result.Result;

import com.example.liuy.log.annotation.Log;
import com.example.liuy.log.type.BusinessType;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.vo.AssginRoleVo;
import com.example.liuy.model.vo.SysRoleQueryVo;
import com.example.liuy.system.service.SysRoleService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@Api(tags = "角色管理")
@RestController
@RequestMapping("/admin/system/sysRole")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;

// http://localhost:5240/admin/system/sysRole/findAll

    //1.查询所有接口

    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation(value = "获取全部角色列表")
    @GetMapping("/findAll")
    public Result<List<SysRole>> findAll() {

        List<SysRole> roleList = sysRoleService.list();
        return Result.ok(roleList);
    }


    //2.逻辑删除角色
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysRole.remove')")
    @ApiOperation(value = "删除角色")
    @DeleteMapping("/remove/{id}")
    public Result remove(@PathVariable String id) {
        boolean b = sysRoleService.removeById(id);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    //3.条件分页查询接口
    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation(value = "条件分页查询")
    @GetMapping("/{page}/{limit}")
    public Result findPageQueryRole(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "roleQueryVo", value = "查询对象", required = false)
            SysRoleQueryVo roleQueryVo) {
        Page<SysRole> pageParam = new Page<>(page, limit);
        IPage<SysRole> pageModel = sysRoleService.selectPage(pageParam, roleQueryVo);
        return Result.ok(pageModel);
    }

    //4.添加角色
    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PreAuthorize("hasAuthority('bnt.sysRole.add')")
    @ApiOperation(value = "新增角色")
    @PostMapping("/save")

//    知识点：
//    @RequestBody，不能使用get提交方式
//    传递json格式数据，把json格式数据封装到对象里面
    public Result save(@RequestBody SysRole role) {
        boolean isSucess = sysRoleService.save(role);
        if (isSucess) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    //5.修改
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysRole.update')")
    @ApiOperation(value = "修改角色")
//    @PutMapping("/update")
    @PostMapping("/update")

    public Result updateById(@RequestBody SysRole role) {
        boolean b = sysRoleService.updateById(role);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }


    //6.批量删除
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysRole.remove')")
    @ApiOperation(value = "批量删除角色")
    @DeleteMapping("/batchRemove")
    public Result batchRemove(@RequestBody List<Long> idList) {
        boolean b = sysRoleService.removeByIds(idList);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    //7.根据id查询
    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation(value = "查询角色")
    @GetMapping("/findRoleById/{id}")
    public Result get(@PathVariable Long id){
        SysRole sysRole = sysRoleService.getById(id);
        return Result.ok(sysRole);
    }


    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation(value = "根据用户获取角色数据")
    @GetMapping("/toAssign/{userId}")
    public Result toAssign(@PathVariable String userId) {
        Map<String, Object> roleMap = sysRoleService.getRolesByUserId(userId);
        return Result.ok(roleMap);
    }

    @Log(title = "角色管理", businessType = BusinessType.ASSGIN)
    @PreAuthorize("hasAuthority('bnt.sysUser.assignRole')")
    @ApiOperation(value = "根据用户分配角色")
    @PostMapping("/doAssign")
    public Result doAssign(@RequestBody AssginRoleVo assginRoleVo) {
        sysRoleService.doAssign(assginRoleVo);
        return Result.ok();
    }

}
