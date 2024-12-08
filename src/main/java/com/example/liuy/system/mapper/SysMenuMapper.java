package com.example.liuy.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.liuy.model.system.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-06
 */

@Repository
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

}
