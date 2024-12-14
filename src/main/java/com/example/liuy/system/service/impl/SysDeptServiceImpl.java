package com.example.liuy.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.liuy.common.result.ResultCodeEnum;
import com.example.liuy.model.system.SysDept;
import com.example.liuy.model.system.SysMenu;
import com.example.liuy.model.vo.SysDeptQueryVo;
import com.example.liuy.system.exception.DIYException;
import com.example.liuy.system.mapper.SysDeptMapper;
import com.example.liuy.system.service.SysDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.liuy.system.utils.DeptHelper;
import com.example.liuy.system.utils.MenuHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 组织机构 服务实现类
 * </p>
 *
 * @author X-Blix
 * @since 2024-12-12
 */
@Transactional
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {


    @Autowired
    private SysDeptMapper sysDeptMapper;

    //树形结构显示数据
    @Override
    public List<SysDept> findNodes() {

        //获取所有部门
        List<SysDept> sysDeptList = baseMapper.selectList(null);

        //所有部门转换要求数据格式
        //构建树形数据
        List<SysDept> result = DeptHelper.buildTree(sysDeptList);

        return result;

    }

    @Override
    public void removeDeptById(String id) {
        //1.查询当前删除菜单下面是否有子菜单
        //根据id = parentid
        int count = this.count(new QueryWrapper<SysDept>().eq("parent_id", id));
        if (count > 0){
            throw new DIYException(ResultCodeEnum.NODE_ERROR);
        }
        baseMapper.deleteById(id);

    }
}
