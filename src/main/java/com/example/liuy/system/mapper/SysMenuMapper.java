package com.example.liuy.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.liuy.model.system.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    //根据userid查找菜单权限数据
//    List<SysMenu> findListByUserId(String userId);
    List<SysMenu> findListByUserId(@Param("userId") String userId);
}
