package com.example.liuy.log.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.liuy.log.mapper.SysLoginLogMapper;
import com.example.liuy.log.service.SysLoginLogService;
import com.example.liuy.model.system.SysLoginLog;
import com.example.liuy.model.vo.SysLoginLogQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysLoginLogServiceImpl implements SysLoginLogService {

    @Autowired
    private SysLoginLogMapper sysLoginLogMapper;

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status 状态
     * @param ipaddr ip
     * @param message 消息内容
     * @return
     */
    @Override
    public void recordLoginLog(String username, Integer status,
                               String ipaddr, String message) {
        SysLoginLog sysLoginLog = new SysLoginLog();
        sysLoginLog.setUsername(username);
        sysLoginLog.setStatus(status);
        sysLoginLog.setIpaddr(ipaddr);
        sysLoginLog.setMsg(message);
        // 日志状态
        sysLoginLogMapper.insert(sysLoginLog);
    }

    @Override
    public IPage<SysLoginLog> selectPage(Page<SysLoginLog> pageParam, SysLoginLogQueryVo sysLoginLogQueryVo) {
        return sysLoginLogMapper.selectPage(pageParam,sysLoginLogQueryVo,null);
    }

    @Override
    public SysLoginLog getById(Long id) {
        SysLoginLog sysLoginLog = sysLoginLogMapper.selectById(id);
        return sysLoginLog;
    }
}
