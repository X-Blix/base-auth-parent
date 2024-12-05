package com.example.liuy.system.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.liuy.model.system.SysRole;
import com.example.liuy.model.system.SysUserRole;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


// 用户-角色 表
@Repository
@Mapper
//public interface SysUserRoleMapper extends BaseMapper<SysRole>
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

}
