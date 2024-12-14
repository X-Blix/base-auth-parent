package com.example.liuy.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.liuy.model.system.SysDept;

import java.util.List;

/**
 * <p>
 * 组织机构 服务类
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-12
 */
public interface SysDeptService extends IService<SysDept> {

    // 1. 部门列表（树形）
    List<SysDept> findNodes();

    //2.删除部门
    void removeDeptById(String id);
}
