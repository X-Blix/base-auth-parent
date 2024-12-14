package com.example.liuy.system.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.liuy.model.system.SysPost;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.vo.SysPostQueryVo;
import com.example.liuy.model.vo.SysRoleQueryVo;

import java.util.List;

/**
 * <p>
 * 岗位信息表 服务类
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-13
 */

public interface SysPostService extends IService<SysPost> {

    IPage<SysPost> selectPage(Page<SysPost> pageParam, SysPostQueryVo queryVo);

    List<SysPost> queryList(SysPostQueryVo sysPostQueryVo);
}
