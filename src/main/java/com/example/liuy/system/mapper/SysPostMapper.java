package com.example.liuy.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.liuy.model.system.SysPost;
import com.example.liuy.model.vo.SysPostQueryVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 岗位信息表 Mapper 接口
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-13
 */

@Repository
@Mapper
public interface SysPostMapper extends BaseMapper<SysPost> {
//    条件分页查询
    IPage<SysPost> selectPage(Page<SysPost> page, @Param("vo") SysPostQueryVo sysPostQueryVo );
    List<SysPost> queryList(@Param("vo") SysPostQueryVo sysPostQueryVo);
}
