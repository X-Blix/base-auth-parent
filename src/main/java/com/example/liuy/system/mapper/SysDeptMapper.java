package com.example.liuy.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.liuy.model.system.SysDept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 组织机构 Mapper 接口
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-12
 */

@Repository
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {


}
