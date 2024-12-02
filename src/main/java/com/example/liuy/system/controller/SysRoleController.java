package com.example.liuy.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.liuy.common.result.Result;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.vo.SysRoleQueryVo;
import com.example.liuy.system.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api(tags = "角色管理")
@RestController
@RequestMapping("/admin/system/sysRole")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;

// http://localhost:5240/admin/system/sysRole/findAll

    //1.查询所有接口
    @ApiOperation(value = "获取全部角色列表")
    @GetMapping("/findAll")
    public Result<List<SysRole>> findAll() {

        //TODO 模拟异常效果
        int i = 9/0;
        List<SysRole> roleList = sysRoleService.list();
        return Result.ok(roleList);
    }


    //2.逻辑删除角色
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
    @ApiOperation(value = "新增角色")
    @PostMapping("/save")
    public Result save(@RequestBody SysRole role) {
        boolean isSucess = sysRoleService.save(role);
        if (isSucess) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    //5.修改
    @ApiOperation(value = "修改角色")
    @PutMapping("/update")
    public Result updateById(@RequestBody SysRole role) {
        sysRoleService.updateById(role);
        return Result.ok();
    }


    //6.批量删除
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
    @ApiOperation(value = "查询角色")
    @GetMapping("/find/{id}")
    public Result findRoleById(@PathVariable Long id){
        SysRole sysRole = sysRoleService.getById(id);
        return Result.ok(sysRole);
    }

}
