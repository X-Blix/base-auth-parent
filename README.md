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




### 第三次提交：

- 硬编码 IndexController ，提供登录接口以便前端调用测试
注意：@Mapping要和前端提交方式对应

修改application-dev.properties里的日期时间配置
spring.jackson.date-format= yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone= GMT+8


```
知识点：
@RequestBody 不能使用get提交方式
//传递json格式数据，把json格式数据封装到对象里面 

对比：@PathVariable 
这个会影响到前端api里的传参格式

```

```
如果前端在修改的时候报错的话：
1.检查SysRoleController里的方法7，接口有没有写错，要和前端对应起来
2. 如果前端传递过来数据报错找不到post方法时：检查方法5的提交方法有没有写错
```

### 第四次提交：
用户管理：一个用户可以有多个角色。一个角色可以有多个用户

- 一、mybatis 代码生成器 (https://baomidou.com/guides/code-generator/)
  1. 导入pom依赖   
     mybatis-plus-generator + velocity-engine-core
  2. 创建代码生成器
     CodeGenerator放在test下的文件夹里（报错：将mybatis-plus-generator版本换成3.4.1）
    ```
    codeGenerator只生成文件夹，但文件夹里面没有相应的文件？
    检查后猜测：navicat里没有sys_user这个表
    因为navicat导入表的时候有些表没有导入进来
    奇怪的错误。已解决
    ```
  
```
成就：修改出来了一个好用的MYbatis-Plus的CodeGenerator代码
```

  3.改成适合原来的项目结构的格式(略)

- 二、用户管理接口
    1.在Controller里编写相应的接口
    2.在Service和ServiceImpl里写相应的接口
    顺序：Controller->Service->ServiceImpl->Mapper.java - >Mapper.xml
    3.在swagger接口里测试增改删查和分页接口没有问题
```
错误：
XML fragments parsed from previous mappers already contains value

把xml的namespace改掉，要对应起来（有可能找不到bean报错也是因为这个原因）

```
其他：

  A
   - 在表sys_user 中 删除掉了一些 人名 
     这些人名在dept_id(部门id) , post_id(岗位id) 均有数值
    不知道删掉对后面的部门管理和岗位管理有没有影响。有影响的话得再拿回来。


**更改用户状态**
需求分析：用户状态：状态（1：正常 0：停用），
        当用户状态为正常时，可以访问后台系统，
        当用户状态停用后，不可以登录后台系统

1. 数据库中sys_user中的status设置默认值：1
2. 在 SysUserController 中编写 方法：updateStatus
   在 SysUserServiceImpl中实现方法

**给用户分配角色**
需求分析：
1. 进入分配页面：获取已分配角色与全部角色，进行页面展示
2. 保存分配角色：删除之前分配的角色和保存现在分配的角色

- 编写SusUserRoleMapper接口
- 在SysRoleController中编写接口：1/ 根据用户获取角色数据 2/根据用户分配角色
- 在service里创建方法，并在serviceimpl中实现
```

问题：
  @Autowired
  private SysUserRoleMapper sysUserRoleMapper; 报错 导致 selectList 找不到
 文件名字打错了
 
问题： 
 //获取用户已分配的角色
  List<SysUserRole> userRoles = sysUserRoleMapper.selectList(queryWrapper);报错：
  不兼容的类型
  
SysUserRoleMapper里的泛型是<SysUserRole>！
SysUserRoleMapper里的泛型是<SysUserRole>！
SysUserRoleMapper里的泛型是<SysUserRole>！

```


