package com.example.liuy.system.controller;

import com.example.liuy.common.helper.JwtHelper;
import com.example.liuy.common.result.ResultCodeEnum;
import com.example.liuy.common.utils.MD5;
import com.example.liuy.model.system.SysUser;
import com.example.liuy.model.vo.LoginVo;
import com.example.liuy.system.exception.DIYException;
import com.example.liuy.system.service.SysUserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

import com.example.liuy.common.result.Result;



/**
 * <p>
 * 后台登录登出
 * </p>
 */
@Api(tags = "后台登录管理")
@RestController
@RequestMapping("/admin/system/index")
public class IndexController {


    @Autowired
    private SysUserService sysUserService;

    /**
     * 登录
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginVo loginVo) {

        //根据用户名称查询数据
        SysUser sysUser = sysUserService.getByUsername(loginVo.getUsername());

        //如果查询为空
        if(null == sysUser) {
            throw new DIYException(ResultCodeEnum.ACCOUNT_ERROR);
        }
        //判断密码是否一致
        if(!MD5.encrypt(loginVo.getPassword()).equals(sysUser.getPassword())) {
            throw new DIYException(ResultCodeEnum.PASSWORD_ERROR);
        }
        //判断用户是否可用
        if(sysUser.getStatus().intValue() == 0) {
           throw new DIYException(ResultCodeEnum.ACCOUNT_STOP);
       }
        //根据userid和username生成token字符串，通过map返回

        Map<String, Object> map = new HashMap<>();
        map.put("token", JwtHelper.createToken(sysUser.getId(), sysUser.getUsername()));
        return Result.ok(map);
    }
    /**
     * 获取用户信息
     * @return
     */
    @GetMapping("/info")
    public Result info(HttpServletRequest request) {

        // 获取请求头token字符串
        String username = JwtHelper.getUsername(request.getHeader("token"));

        //从token字符串中获得用户名称
        Map<String, Object> map = sysUserService.getUserInfo(username);
        //根据用户名称获取用户信息(基本信息 和 菜单权限 和 按钮权限数据)
        return Result.ok(map);
    }




    /**
     * 退出
     * @return
     */
    @PostMapping("/logout")
    public Result logout(){
        return Result.ok();
    }



}
