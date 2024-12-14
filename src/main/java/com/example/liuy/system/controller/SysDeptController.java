package com.example.liuy.system.controller;

 import com.example.liuy.model.vo.SysDeptQueryVo;
import com.example.liuy.common.result.Result;
import com.example.liuy.model.system.SysDept;

 import com.example.liuy.system.service.SysDeptService;
 import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.security.access.prepost.PreAuthorize;
 import org.springframework.web.bind.annotation.*;

 import java.util.List;
 import java.util.Map;

/**
 * <p>
 * 组织机构 前端控制器
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-12
 */
@Api(tags = "部门管理")
@RestController
@RequestMapping("/admin/system/sysDept")
public class SysDeptController {

    @Autowired
    private SysDeptService sysDeptService;



    // 1. 部门列表（树形）
    @ApiOperation(value = "获取部门")
    @GetMapping("/findNodes")
    public Result findNodes() {
        List<SysDept> list = sysDeptService.findNodes();
        return Result.ok(list);
    }


    //2.添加部门
    @ApiOperation(value = "新增部门")
    @PostMapping("/save")
    public Result save(@RequestBody SysDept sysDept) {
        sysDeptService.save(sysDept);
        return Result.ok();
    }

    //3.根据id查询
    @ApiOperation(value = "根据id查询部门")
    @GetMapping("/findNode/{id}")
    public Result findNode(@PathVariable String id) {
        SysDept sysDept = sysDeptService.getById(id);
        return Result.ok(sysDept);
    }

    //4.修改部门
    @ApiOperation(value = "修改部门")
    @PutMapping("update")
    public Result updateById(@RequestBody SysDept sysDept) {
        sysDeptService.updateById(sysDept);
        return Result.ok();
    }

    //5.删除菜单
    @ApiOperation(value = "删除部门")
    @DeleteMapping("remove/{id}")
    public Result remove(@PathVariable String id) {
        sysDeptService.removeDeptById(id);
        return Result.ok();
    }

    @ApiOperation(value = "获取部门详情")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable String id) {
        SysDept sysDept = sysDeptService.getById(id);
        SysDept parent = sysDeptService.getById(sysDept.getParentId());
        if (parent != null) {
            sysDept.setParentName(parent.getName());
            sysDept.setParentId(parent.getId());
        }
        return Result.ok(sysDept);
    }


}

