package com.example.liuy.system.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.liuy.common.result.Result;
import com.example.liuy.model.system.SysDept;
import com.example.liuy.model.system.SysPost;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.vo.SysPostQueryVo;
import com.example.liuy.model.vo.SysRoleQueryVo;
import com.example.liuy.system.service.SysPostService;
import com.example.liuy.system.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 岗位信息表 前端控制器
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-13
 */
@Api(tags = "岗位管理")
@RestController
@RequestMapping("/admin/system/sysPost")
public class SysPostController {

    @Autowired
    private SysPostService sysPostService;

    //1.查询所有接口
    @PreAuthorize("hasAuthority('bnt.sysPost.list')")
    @ApiOperation(value = "获取全部岗位列表")
    @GetMapping("/findAll")
    public Result findAllSysPost() {
        //调用service的方法实现查询所有的操作
        List<SysPost> list = sysPostService.list(null);
        return Result.ok(list);
    }

    //2.逻辑删除
    @PreAuthorize("hasAuthority('bnt.sysPost.remove')")
    @ApiOperation(value = "删除岗位")
    @DeleteMapping("/remove/{id}")
    public Result remove(@PathVariable String id) {
        boolean b = sysPostService.removeById(id);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    //3.条件分页查询接口
    @PreAuthorize("hasAuthority('bnt.sysPost.list')")
    @ApiOperation(value = "条件分页查询")
    @GetMapping("/{page}/{limit}")
    public Result findPageQueryRole(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "sysPostQueryVo", value = "查询对象", required = false)
            SysPostQueryVo sysPostQueryVo) {

        Page<SysPost> pageParam = new Page<>(page, limit);
        IPage<SysPost> pageModel = sysPostService.selectPage(pageParam, sysPostQueryVo);
        return Result.ok(pageModel);

    }


    //4.添加角色
    @PreAuthorize("hasAuthority('bnt.sysPost.add')")
    @ApiOperation(value = "新增岗位")
    @PostMapping("/save")
    public Result save(@RequestBody SysPost sysPost) {
        sysPostService.save(sysPost);
        return Result.ok();
    }


    //5.修改
    @PreAuthorize("hasAuthority('bnt.sysPost.update')")
    @ApiOperation(value = "修改岗位")
    @PostMapping("/update")

    public Result updateById(@RequestBody SysPost sysPost) {
        boolean b = sysPostService.updateById(sysPost);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    //6.批量删除
    @PreAuthorize("hasAuthority('bnt.sysPost.remove')")
    @ApiOperation(value = "批量删除")
    @DeleteMapping("/batchRemove")
    public Result batchRemove(@RequestBody List<Long> idList) {
        boolean b = sysPostService.removeByIds(idList);
        if (b) {
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    //7.根据id获取数据
    @ApiOperation(value = "获取详情")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable String id) {
        SysPost sysPost = sysPostService.getById(id);
        if (sysPost != null) {
            sysPost.setName(sysPost.getName());
            sysPost.setId(sysPost.getId());
        }
        return Result.ok(sysPost);
    }

}

