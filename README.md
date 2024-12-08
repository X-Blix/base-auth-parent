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

其他：
    role，user里的数据太乱了，稍微整理了一下


### 第五次提交：
1. 利用 CodeGenerator 生成 sys_menu,并将其修改成适合项目的结构
```
ServiceImpl 需要相对应的mapper,不然可能会报错

```
2. 编写SysMenuController
  - // 1. 菜单列表（树形）
  - // 2. 添加菜单
  - // 3.根据id 查询
  - // 4.修改
  - // 5.删除菜单


3. ServiceImpl 实现接口
   - 1. 菜单列表（树形）
       1.1按照element-ui组件要求格式编写接口返回数据
           第一步：根据返回数据创建实体类
           第二步：查询所有菜单，转换要求数据格式
           菜单有多层，使用递归查询
       ```
          //获取所有菜单
        List<SysMenu> sysMenuList = baseMapper.selectList(null);

        //所有菜单数据转换要求数据格式
        List<SysMenu> result = MenuHelper.buildTree(sysMenuList);

        return result;
     ```
        1.2 在util里创建MenuHelper，也就是帮助菜单实现递归查找的帮助类
   
   ```
    使用递归方法建菜单
    
   //使用递归方法建菜单
   public static List<SysMenu> buildTree(List<SysMenu> sysMenuList) {
   //遍历集合封装最终数据
   List<SysMenu> trees = new ArrayList<>();
   //遍历所有菜单集合
   for (SysMenu sysMenu : sysMenuList) {
   //找到递归入口，parentid =0
   if ("0".equals(sysMenu.getParentId())) {
   trees.add(findChildren(sysMenu,sysMenuList));
   }
   }
   return trees;
   }
   
   
   
   递归查找子节点
   
   public static SysMenu findChildren(SysMenu sysMenu, List<SysMenu> treeNodes) {
        sysMenu.setChildren(new ArrayList<SysMenu>());

        for (SysMenu it : treeNodes) {
            if(sysMenu.getId().equals(it.getParentId())) {
                if (sysMenu.getChildren() == null) {
                    sysMenu.setChildren(new ArrayList<>());
                }
                sysMenu.getChildren().add(findChildren(it,treeNodes));
            }
        }
        return sysMenu;
    }
     
        ```
     
   
   
   
  菜单列表（树形）要使用递归的方法来实现。在这个过程中需要使用到配置类MenuHelper
  要得到所有的菜单，然后找到菜单里的根节点。然后再找到根节点下的子节点。(怎么找？)
  用当前节点的id,再找到谁的parentid和他是一样的，然后把他们放在一起。
  一直向下进行这个过程（递归），然后不断向下找，直到找不到为止。

```
问题：
 Error creating bean with name 'sysMenuController': Unsatisfied dependency expressed through field 'sysMenuService'

答案：
    SysMenuServiceImpl里没有@Autowried SysMenuService
    Mapper层没有加 @Repository ，@Mapper 注释
```
****上一级的id是下一级的parent_id**

**上一级的id是下一级的parent_id**

**上一级的id是下一级的parent_id****
然后就可以递归了


- 2 修改删除接口
    因为在删除的时候，是只删除了单个接口，而不是关联他的子节点和父节点：所以要进行判断：

    SysMenuServiceImpl里重写removeMenuById接口。添加SysRoleMenuMapper的Autowired
    添加SysRoleMenuMapper文件

测试没有问题。

```
如果前端的sysMenu/list 确定没问题的话：
但是在删除的时候报错：

那么可能是后端删除的接口写错了...
是@DeleteMapping 不是 @PostMapping 
```

知识：
@Transactional  注解，对整个类的方法，事务起作用。无异常时正常提交，有异常时数据回滚



**4. 给角色分配权限**

接口分析
1. 进入分配页面 : 获取全部菜单及按钮，选中已选复选框，进行页面展示
2. 保存分配权限 : 删除之前分配的权限和保存现在分配的权限


###### 第一个:根据角色获取菜单

 - 在   SysMenuController 里 编写 接口
    ```
     //1.根据角色获取菜单
    @ApiOperation(value = "根据角色获取菜单")
    @GetMapping("/toAssign/{roleId}")
    public Result toAssign(@PathVariable String roleId) {
        List<SysMenu> list = sysMenuService.findSysMenuByRoleId(roleId);
        return Result.ok(list);
    }

    ```

- 在 SysMenuService 里  编写 方法
```
    List<SysMenu> findSysMenuByRoleId(String roleId);
```

- 在SysMenuServiceImpl 里 实现 方法 
```
    @Override
    public List<SysMenu> findSysMenuByRoleId(String roleId) {
        //1.获取所有status为1的权限列表 （和获取所有菜单 status = 1）
        List<SysMenu> menuList = sysMenuMapper.selectList(new QueryWrapper<SysMenu>().eq("status", 1));

        //2.根据角色id获取角色权限(根据角色id查询角色分配过的菜单列表)
        List<SysRoleMenu> roleMenus = sysRoleMenuMapper.selectList(new QueryWrapper<SysRoleMenu>().eq("role_id",roleId));

        //3.获取该角色已分配的所有权限id(从第二步的菜单列表中，获取（角色分配所有的）菜单id)
        List<String> roleMenuIds = new ArrayList<>();
        for (SysRoleMenu roleMenu : roleMenus) {
            roleMenuIds.add(roleMenu.getMenuId());
        }

        //4.遍历所有权限列表（数据处理）：
        /*
            如果菜单选中是true，否则是false
            拿着分配菜单id 和 所有菜单对比 ，有相同的，让isSelect 值 为 true
        * */
        for (SysMenu sysMenu : menuList){
            if(roleMenuIds.contains(sysMenu.getId())){
                //设置该权限已被分配
                sysMenu.setSelect(true);
            }else {
                sysMenu.setSelect(false);
            }
        }

        //5.将权限列表转换为权限树 （转换成树形结构进行最终显示）
        List<SysMenu> sysMenus = MenuHelper.buildTree(menuList);
        return sysMenus;

    }

```
- 创建 sysRoleMenuMapper ：
```
  @Repository
  @Mapper
  public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

}
```
并在 SysMenuServiceImpl 导入 
```

@Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;
    
```


###### 第二个:给角色分配菜单权限
- 在 SysMenuController 里 编写 接口
     ```
    @ApiOperation(value = "给角色分配菜单权限")
    @PostMapping("/doAssign")
    public Result doAssign(@RequestBody AssginMenuVo assginMenuVo) {
        sysMenuService.doAssign(assginMenuVo);
        return Result.ok();
    }
  
     ```

- 在 SysMenuService 里  编写 方法
```
    //根据角色获取菜单
    void doAssign(AssginMenuVo assginMenuVo);
    
```
- 在SysMenuServiceImpl 里 实现 方法 
```
//给角色分配权限
    @Override
    public void doAssign(AssginMenuVo assginMenuVo) {
        //删除已分配的权限(根据角色id删除菜单权限)
        sysRoleMenuMapper.delete(new QueryWrapper<SysRoleMenu>().eq("role_id",assginMenuVo.getRoleId()));

        //遍历所有已选择的权限id（遍历菜单列表，一个一个进行添加）
        for (String menuId : assginMenuVo.getMenuIdList()){
            if(menuId != null){
                //创建SysRoleMenu对象
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenu.setRoleId(assginMenuVo.getRoleId());
                //添加新权限
                sysRoleMenuMapper.insert(sysRoleMenu);
            }
        }

    }
```


