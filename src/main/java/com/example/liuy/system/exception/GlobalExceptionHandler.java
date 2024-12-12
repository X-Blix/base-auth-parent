package com.example.liuy.system.exception;

import com.example.liuy.common.result.Result;
import com.example.liuy.common.result.ResultCodeEnum;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/*
*
*  统一异常处理配置文件
* */
@ControllerAdvice
public class GlobalExceptionHandler {

    //全局异常
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result error(Exception e){
        e.printStackTrace();
        return Result.fail("执行了全局异常处理");
    }

    //特定异常 --计算异常
    @ExceptionHandler(ArithmeticException.class)
    @ResponseBody
    public Result error(ArithmeticException e){
        e.printStackTrace();
        return Result.fail().message("执行了特定异常处理");
    }

    //自定义异常 -- DIYException
    @ExceptionHandler(DIYException.class)
    @ResponseBody
    public Result error(DIYException e){
        e.printStackTrace();
        return Result.fail().message(e.getMessage()).code(e.getCode());
    }

    /*

    业务中需要位置抛出
       try {
            int a = 10/0;
           }catch(Exception e) {
                throw new GuiguException(20001,"出现自定义异常");
            }
    */

/*
    @ExceptionHandler(CacheExpiredException.class)
    @ResponseBody
    public Result error(CacheExpiredException e){
        e.printStackTrace();
        return Result.fail().message(e.getMessage()).code(e.getCode());
    }
*/

    /**
     * spring security异常
     * @param e
     * @return
     */
    @ExceptionHandler(AccessDeniedException.class)
    @ResponseBody
    public Result error(AccessDeniedException e) throws AccessDeniedException {
//        return Result.build(null, ResultCodeEnum.PERMISSION);
        return Result.fail().code(ResultCodeEnum.PERMISSION.getCode()).message("没有当前功能操作权限");
    }

}
