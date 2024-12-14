package com.example.liuy.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.liuy.model.system.SysPost;
import com.example.liuy.model.vo.SysPostQueryVo;
import com.example.liuy.system.mapper.SysPostMapper;
import com.example.liuy.system.service.SysPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements SysPostService {

    @Autowired
    private SysPostMapper postMapper;

    @Override
    public IPage<SysPost> selectPage(Page<SysPost> pageParam, SysPostQueryVo sysPostQueryVo) {
//        条件分页查询
        return baseMapper.selectPage(pageParam,sysPostQueryVo);
    }

    @Override
    public List<SysPost> queryList(SysPostQueryVo sysPostQueryVo) {
        return postMapper.queryList(sysPostQueryVo);
    }


}
