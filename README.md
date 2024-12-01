参考文件:
https://blog.csdn.net/lbw18/category_12071837.html

参考视频：
https://www.bilibili.com/video/BV1ad4y1y7LU?spm_id_from=333.788.player.switch&vd_source=1304db5a0c1ae88e416aa5ada3065487&p=19

### 第一次提交：

 -1. 创建了后端环境

 -2. 引入mybatis-plus（的依赖）,并进行了【角色管理】的mapper层和service层的接口测试（没有问题）

```
遇到的问题及其解决方法：

 -- 在测试时,遇到了 【swagger逻辑删除接口报错】的问题，解决方法是：
    把BaseEntity里面的    private Integer isDeleted;上的注解改成：
    @TableField(value = "is_deleted")

```

其他：

A
- 本来想使用像mall那样的多模块（拆成好几块的）
   但是每次都失败了（找不准每个模块对应的pom.xml配置文件）
   所以先使用单模块的吧，然后到时候再拆


### 第二次提交：

 -1. 添加【角色管理】的Controller层，并进行增改删查接口的编写
 
 -2. 引入swagger和Knife4j,并在浏览器上进行接口的测试（没有问题。）
 
 -3.引入 MybatisPlusConfig 配置

 -4. 定义统一返回结果对象 Result ，统一返回的json数据格式

 -5. 统一异常处理：在异常出现的时候返回规定的结果
      全局异常处理、特定异常处理、自定义异常处理
        GlobalExceptionHandler：先执行特定异常处理，然后再执行全局异常处理
        自定义全局异常类（自定义全局异常类）：需要手动抛出异常

 -6. 添加【角色管理】的分页查询接口：
      controller->service->serviceImpl->SysRoleMapper->SysRoleMapper.xml
      (浏览器测试没有问题)

```
遇到的问题及其解决方法：

 -- 在测试时,遇到了 【Knife4j不显示接口文档】的问题，解决方法是：
    把Knife4jConfig里面的 .apis(RequestHandlerSelectors.basePackage("XXX.XXX"))
    括号里面的路径名称改成：
    .apis(RequestHandlerSelectors.basePackage("com.example.liuy")) --- (自己的路径名称)

  -- MySQL 错误：Truncated incorrect DOUBLE value
     把数据库中，sys_role表里的id为字符串的，都改成不含字符的类型（只有数字）
```


其他：

  A
   - 在pom.xml 中 屏蔽掉了 spring-boot-starter-security 的相关配置
      因为在Knife调试接口的时候会出现跨域问题（后续添加SpringSercurity配置时候再 拿回来吧 ）

  B
   - 在MybatisPlusConfig里的乐观锁控制没有添加
      以后记得加一下吧

  C
   - 全局异常处理比较简单，可以参考mall里面的异常处理
     com.macro.mall.common.exception.GlobalExceptionHandler



知识点：

@RequestBody，不能使用get提交方式
传递json格式数据，把json格式数据封装到对象里面
