# blog
基于VUE + SpringBoot 前后端分离的个人博客实现
首页：
![image](https://user-images.githubusercontent.com/61285461/224533424-225b6efd-1220-47fd-914a-1d2e9e81c666.png)

开发环境：VSCode，IntelliJ IDEA 2020，jdk8, Mysql 5.7，maven 3.6.3

1、整体技术支持：
掌握基于MVVM双向绑定的前端框架VUE，第三方组件Element UI。
关系型数据库MySQL,非关系型数据库Redis。
后端使用Java语言，配合当前企业级框架SpringBoot，持久层框架MyBatis,MyBatis Plus实现博客论坛项目。
2、按照技术选型划分技术点：
VUE需要掌握组件化开发，Axios网络请求，前端路由VueRouter,状态管理VueX,前端数据模拟MockJS,vue-element-admin后台集成方案。
Element UI 需要掌握常用组件与VUE的组装（例如导航栏，模块化布局）。
MySQL需要掌握常用SQL语句，Redis需要掌握基于SpringBoot集成Redis的RedisTemplate基本使用。
SpringBoot需要掌握项目后端开发环境搭建，项目编码，项目测试，项目打包，项目部署。
MyBatis、MyBatis Plus需要掌握通过mapper接口来操作MySQL基础方法。熟悉宝塔前后端项目部署，进行前后端项目的上线。
3、通过项目编码方式划分具体编码流程
前端：运用VUE组件化的思想，将页面进行拆分，基于MVVM双向数据绑定，通过Axios网络请求向后端接口发送请求。
后端：基于MVC架构，WEB层对前端传来的请求，进行相对应的业务控制，Service层操作DAO层中数据库返回数据发送给前端。
数据库：DAO层运用持久层框架MyBatis、MyBatis Plus，对数据库表进行映射，操作数据库，拿到数据或者修改数据返回给Service层。


前端运行，需要进行npm run install 、 npm run dev 运行，打包npm run build 会产生一个dist文件夹（目录）用于线上部署。用nginx 部署前端也可，直接将dist文件夹里面的内容放入后端Resource下的static 文件夹下，index.html 文件也移动放入static 中。
后端 maven package 命令打成jar 包，用 java -jar jar包名 部署。
