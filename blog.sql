/*
 Navicat Premium Data Transfer

 Source Server         : u1
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 10/03/2023 10:58:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dcx_admin
-- ----------------------------
DROP TABLE IF EXISTS `dcx_admin`;
CREATE TABLE `dcx_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_admin
-- ----------------------------
INSERT INTO `dcx_admin` VALUES (1, 'admin', '$2a$10$RZECQ90DjOT/t1mhnXsl5.XSuZWc0Sa1XduPxj2rb4yaSYcje3nWW');
INSERT INTO `dcx_admin` VALUES (2, 'mszlu', '$2a$10$RZECQ90DjOT/t1mhnXsl5.XSuZWc0Sa1XduPxj2rb4yaSYcje3nWW');
INSERT INTO `dcx_admin` VALUES (3, 'advip', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for dcx_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `dcx_admin_permission`;
CREATE TABLE `dcx_admin_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_admin_permission
-- ----------------------------
INSERT INTO `dcx_admin_permission` VALUES (1, 1, 1);
INSERT INTO `dcx_admin_permission` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for dcx_article
-- ----------------------------
DROP TABLE IF EXISTS `dcx_article`;
CREATE TABLE `dcx_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_counts` int(11) NULL DEFAULT NULL COMMENT '评论数量',
  `create_date` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `view_counts` int(11) NULL DEFAULT NULL COMMENT '浏览数量',
  `weight` int(11) NOT NULL COMMENT '是否置顶',
  `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者id',
  `body_id` bigint(20) NULL DEFAULT NULL COMMENT '内容id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类别id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634025473270898691 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_article
-- ----------------------------
INSERT INTO `dcx_article` VALUES (1634018812250578945, 0, 1678415418100, '5种线程状态包括：创建、就绪、运行（io阻塞、blocked、wating、timed wating）、阻塞、终结。', 'java并发', 1, 0, 1634017175196950529, 1634018812250578947, 2);
INSERT INTO `dcx_article` VALUES (1634020500210475009, 0, 1678415820547, '通过submit（）提交任务给线程池，任务交给核心线程，当核心线程数满了，阻塞队列也满了，则使用救急线程（具有生存周期）。', '线程池核心参数', 1, 0, 1634017175196950529, 1634020500277583873, 2);
INSERT INTO `dcx_article` VALUES (1634020745828917249, 0, 1678415879111, '共同点：sleep(long),wait,wait(long)都可以将线程运行状态变化为阻塞状态、等待状态。', 'sleep VS wait', 1, 0, 1634017175196950529, 1634020745891831811, 2);
INSERT INTO `dcx_article` VALUES (1634020960057188353, 0, 1678415930175, '语法层面：1. Lock 是java 的一个接口，源码是在jdk中lock.lock() 获得锁，解锁用unlock();', 'lock VS synchronized 不同 ', 2, 0, 1634017175196950529, 1634020960057188355, 2);
INSERT INTO `dcx_article` VALUES (1634022692501872641, 0, 1678416343225, 'MVC架构：Model  +  View + Controller', '架构思想-MVC', 1, 0, 1634017175196950529, 1634022692501872643, 2);
INSERT INTO `dcx_article` VALUES (1634024179302948865, 0, 1678416697706, 'maven一款由apache公司开发的纯java开发的开源项目，项目对象模型管理工具。用于项目中构建，测试，打包，部署。使得开发更加简易。', '项目积累-Maven-git', 1, 0, 1634017175196950529, 1634024179302948867, 2);
INSERT INTO `dcx_article` VALUES (1634024842548240385, 0, 1678416855835, 'springboot是什么？1. 开源免费2. 脚手架3. 简化配置，易上手4. 内置容器，易部署5. 可独立开发应用', 'SpringBoot', 1, 0, 1634017175196950529, 1634024842548240387, 2);
INSERT INTO `dcx_article` VALUES (1634025473270898690, 0, 1678417006214, '我的第一本算法书', '我的第一本算法书', 1, 0, 1634017175196950529, 1634025473270898692, 2);

-- ----------------------------
-- Table structure for dcx_article_body
-- ----------------------------
DROP TABLE IF EXISTS `dcx_article_body`;
CREATE TABLE `dcx_article_body`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634025473270898693 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_article_body
-- ----------------------------
INSERT INTO `dcx_article_body` VALUES (1634018812250578947, '\n## 线程\n\n### 5种线程状态和6种线程状态\n\n### 5种线程状态\n包括：创建、就绪、运行（io阻塞、blocked、wating、timed wating）、阻塞、终结。java 种runnable 包括了就绪、运行、阻塞。\n\n6种线程状态包括：创建(new)、运行（runnable）、阻塞（blocked）、等待（wait）、时间等待（Timed waiting）、终结（terminating）\n\n### 6种状态转化\n\n创建（new） ->运行（runnable）->代码执行完成->终结\n\n创建（new）->运行（runnable）->未获得锁->阻塞（blocked）->获得锁->运行状态\n\n创建（new）->运行（runnable）->获得锁->wait() -> 等待状态（释放锁） -> 唤醒notify() -> 获得锁->运行状态（runnable）\n\n创建（new）->运行（runnable）->获得锁->wait(time) ->时间等待（Timed waiting）    \n\n->唤醒notify() 或者时间到->获得锁->运行（runnable）\n\n创建（new）->运行（runnable）->获得锁->睡眠sleep(time) ->时间等待（Timed waiting）-> 时间到-> 运行（runnable）', '<h2><a id=\"_1\"></a>线程</h2>\n<h3><a id=\"56_3\"></a>5种线程状态和6种线程状态</h3>\n<h3><a id=\"5_5\"></a>5种线程状态</h3>\n<p>包括：创建、就绪、运行（io阻塞、blocked、wating、timed wating）、阻塞、终结。java 种runnable 包括了就绪、运行、阻塞。</p>\n<p>6种线程状态包括：创建(new)、运行（runnable）、阻塞（blocked）、等待（wait）、时间等待（Timed waiting）、终结（terminating）</p>\n<h3><a id=\"6_10\"></a>6种状态转化</h3>\n<p>创建（new） -&gt;运行（runnable）-&gt;代码执行完成-&gt;终结</p>\n<p>创建（new）-&gt;运行（runnable）-&gt;未获得锁-&gt;阻塞（blocked）-&gt;获得锁-&gt;运行状态</p>\n<p>创建（new）-&gt;运行（runnable）-&gt;获得锁-&gt;wait() -&gt; 等待状态（释放锁） -&gt; 唤醒notify() -&gt; 获得锁-&gt;运行状态（runnable）</p>\n<p>创建（new）-&gt;运行（runnable）-&gt;获得锁-&gt;wait(time) -&gt;时间等待（Timed waiting）</p>\n<p>-&gt;唤醒notify() 或者时间到-&gt;获得锁-&gt;运行（runnable）</p>\n<p>创建（new）-&gt;运行（runnable）-&gt;获得锁-&gt;睡眠sleep(time) -&gt;时间等待（Timed waiting）-&gt; 时间到-&gt; 运行（runnable）</p>\n', 1634018812250578945);
INSERT INTO `dcx_article_body` VALUES (1634020500277583873, '通过submit（）提交任务给线程池，任务交给核心线程，当核心线程数满了，阻塞队列也满了，则使用救急线程（具有生存周期）。\n\n1. 核心线程数：corePoolSize \n2. 救急线程数：\n3. 最大线程数（核心线程数+救急线程数）：maximumPoolSize\n4. 救急线程生存时间：keepAliveTime\n5. 救急线程生存时间单位：unit\n6. 阻塞队列：workQueue\n7. 线程工厂(可以为线程取名字)：threadFactory\n8. 拒绝策略（四种）：handler', '<p>通过submit（）提交任务给线程池，任务交给核心线程，当核心线程数满了，阻塞队列也满了，则使用救急线程（具有生存周期）。</p>\n<ol>\n<li>核心线程数：corePoolSize</li>\n<li>救急线程数：</li>\n<li>最大线程数（核心线程数+救急线程数）：maximumPoolSize</li>\n<li>救急线程生存时间：keepAliveTime</li>\n<li>救急线程生存时间单位：unit</li>\n<li>阻塞队列：workQueue</li>\n<li>线程工厂(可以为线程取名字)：threadFactory</li>\n<li>拒绝策略（四种）：handler</li>\n</ol>\n', 1634020500210475009);
INSERT INTO `dcx_article_body` VALUES (1634020745891831811, '共同点：sleep(long),wait,wait(long)都可以将线程运行状态变化为阻塞状态、等待状态。\n\n不同点：\n\n方法不同出处：\n\n1. sleep(long) 是 Thread 类下的一个静态方法。\n2. wait,wait(long)是java Object中每个对象都有的成员方法。\n\n线程醒来时机不同：\n\n1. 执行sleep（long）,wait(long) 等时间到，线程都会醒来。\n2. wait(long)，wait()可以通过notify()唤醒。\n3. 执行wait()不用notify（）唤醒则永远都不会醒来。\n4. 都可以用中断来让线程醒来。（interrupt）\n\n锁特性不同：\n\n1. wait()方法调用必须在获得锁的前提下，让线程等待，释放锁，锁交由其他线程竞争。\n\n   时间到了，线程醒来，继续竞争锁，变成运行状态。\n\n2. sleep()在synchronized方法块里面则，让线程睡眠，并不会释放锁，当代码块里的代码执行完成，才释放锁。', '<p>共同点：sleep(long),wait,wait(long)都可以将线程运行状态变化为阻塞状态、等待状态。</p>\n<p>不同点：</p>\n<p>方法不同出处：</p>\n<ol>\n<li>sleep(long) 是 Thread 类下的一个静态方法。</li>\n<li>wait,wait(long)是java Object中每个对象都有的成员方法。</li>\n</ol>\n<p>线程醒来时机不同：</p>\n<ol>\n<li>执行sleep（long）,wait(long) 等时间到，线程都会醒来。</li>\n<li>wait(long)，wait()可以通过notify()唤醒。</li>\n<li>执行wait()不用notify（）唤醒则永远都不会醒来。</li>\n<li>都可以用中断来让线程醒来。（interrupt）</li>\n</ol>\n<p>锁特性不同：</p>\n<ol>\n<li>\n<p>wait()方法调用必须在获得锁的前提下，让线程等待，释放锁，锁交由其他线程竞争。</p>\n<p>时间到了，线程醒来，继续竞争锁，变成运行状态。</p>\n</li>\n<li>\n<p>sleep()在synchronized方法块里面则，让线程睡眠，并不会释放锁，当代码块里的代码执行完成，才释放锁。</p>\n</li>\n</ol>\n', 1634020745828917249);
INSERT INTO `dcx_article_body` VALUES (1634020960057188355, '## lock VS synchronized 不同 \n\n语法层面：\n\n1. Lock 是java 的一个接口，源码是在jdk中lock.lock() 获得锁，解锁用unlock();\n2. synchronized是java中的一个关键字，源码在jvm中，底层是用C++写的\n3. 使用synchronized代码块时，释放锁时自动的，而Lock中解锁需要unlock();\n\n功能的层面：\n\nLock 和 synchronized 都属于悲观锁，都有悲观锁的特性（同步、互斥、锁重入）\n\nLock 具有synchronized所不具有的功能：获取等待状态，公平锁、可打断、可超时、多条件变量。\n\nLock可以使用不同的场景：ReentrantLock、ReentrantWriteReadLock\n\n性能层面：\n\n在没有锁竞争的时候，synchronized 做了很多优化，偏向锁，轻量级锁，性能不赖\n\n锁竞争激烈的时候，Lock 会有更好的性能。\n\n\n\nLock中有持有者（owner）,状态信息（state）,阻塞队列（blockedQueue）,等待队列（watingQueue）\n\nowner 记录 线程名字，状态信息记录Lock锁的次数，Lock支持锁重入。\n\nblockeQueue 记录阻塞中的线程\n\nwatingQueue 记录等待中的线程\n\n公平锁：线程醒来（signal()）插入阻塞队列，从尾部插入（先来先执行）（Synchronized 是不公平锁，阻塞队列排序为：优先执行最新需要执行的线程）\n\n多条件变量：Condition 类，可以实现多个线程依次通信，多条件绑定。\n\n\n\n\n\n', '<h2><a id=\"lock_VS_synchronized__0\"></a>lock VS synchronized 不同</h2>\n<p>语法层面：</p>\n<ol>\n<li>Lock 是java 的一个接口，源码是在jdk中lock.lock() 获得锁，解锁用unlock();</li>\n<li>synchronized是java中的一个关键字，源码在jvm中，底层是用C++写的</li>\n<li>使用synchronized代码块时，释放锁时自动的，而Lock中解锁需要unlock();</li>\n</ol>\n<p>功能的层面：</p>\n<p>Lock 和 synchronized 都属于悲观锁，都有悲观锁的特性（同步、互斥、锁重入）</p>\n<p>Lock 具有synchronized所不具有的功能：获取等待状态，公平锁、可打断、可超时、多条件变量。</p>\n<p>Lock可以使用不同的场景：ReentrantLock、ReentrantWriteReadLock</p>\n<p>性能层面：</p>\n<p>在没有锁竞争的时候，synchronized 做了很多优化，偏向锁，轻量级锁，性能不赖</p>\n<p>锁竞争激烈的时候，Lock 会有更好的性能。</p>\n<p>Lock中有持有者（owner）,状态信息（state）,阻塞队列（blockedQueue）,等待队列（watingQueue）</p>\n<p>owner 记录 线程名字，状态信息记录Lock锁的次数，Lock支持锁重入。</p>\n<p>blockeQueue 记录阻塞中的线程</p>\n<p>watingQueue 记录等待中的线程</p>\n<p>公平锁：线程醒来（signal()）插入阻塞队列，从尾部插入（先来先执行）（Synchronized 是不公平锁，阻塞队列排序为：优先执行最新需要执行的线程）</p>\n<p>多条件变量：Condition 类，可以实现多个线程依次通信，多条件绑定。</p>\n', 1634020960057188353);
INSERT INTO `dcx_article_body` VALUES (1634022692501872643, '## 架构思想\n\n### MVC架构\n\nMVC架构：Model  +  View + Controller\n\nModel 负责代码逻辑，数据处理。\n\nView 负责视图渲染\n\nController 控制器将View 获得的请求发送给Model 来进行数据处理，调用数据库返回结果给Controller 然后 Controller将返回结果发送给View ，进行前端的视图渲染。\n\n\n\n传统MVC前后端一体：\n\n优点：沟通成本相比前后端分离较低，部署也比较简单\n\n缺点：前后端分工任务比重不协调，后端任务比前端任务更为繁重\n\n\n\n### 前后端分离\n\n优点：分工明确，各自领域专注度更高\n\n缺点：需要长时间维护接口文档，沟通成本增加，部署比MVC更为复杂\n\n', '<h2><a id=\"_0\"></a>架构思想</h2>\n<h3><a id=\"MVC_2\"></a>MVC架构</h3>\n<p>MVC架构：Model  +  View + Controller</p>\n<p>Model 负责代码逻辑，数据处理。</p>\n<p>View 负责视图渲染</p>\n<p>Controller 控制器将View 获得的请求发送给Model 来进行数据处理，调用数据库返回结果给Controller 然后 Controller将返回结果发送给View ，进行前端的视图渲染。</p>\n<p>传统MVC前后端一体：</p>\n<p>优点：沟通成本相比前后端分离较低，部署也比较简单</p>\n<p>缺点：前后端分工任务比重不协调，后端任务比前端任务更为繁重</p>\n<h3><a id=\"_22\"></a>前后端分离</h3>\n<p>优点：分工明确，各自领域专注度更高</p>\n<p>缺点：需要长时间维护接口文档，沟通成本增加，部署比MVC更为复杂</p>\n', 1634022692501872641);
INSERT INTO `dcx_article_body` VALUES (1634024179302948867, '# 项目积累\n\n## maven\n\n一款由apache公司开发的纯java开发的开源项目，项目对象模型管理工具。用于项目中构建，测试，打包，部署。使得开发更加简易。\n\n优点：\n\n能够快速进行项目构建和部署。\n\n避免项目导入jar出现jar冲突的问题。\n\n约定大于配置，规定了项目目录结构，使得项目开发更为规范。\n\n多模块开发\n### pom文件\n\n#### 文件结构\n```<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!--根元素-->\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\n<!--    pom文件版本-->\n    <modelVersion>4.0.0</modelVersion>\n\n\n<!--    可以看成xyz空间坐标，用于标注具体项目-->\n<!--    公司域名-->\n    <groupId>org.example</groupId>\n<!--    项目名称-->\n    <artifactId>jedis</artifactId>\n<!--    项目版本号-->\n    <version>1.0-SNAPSHOT</version>\n<!--    导包方式-->\n    <packaging>jar</packaging>\n<!--    继承父类pom-->\n    <parent></parent>\n<!--    子模块-->\n    <modules>\n        <module></module>\n    </modules>\n\n<!--    属性标签，标注版本-->\n    <properties>\n        <maven.compiler.source>8</maven.compiler.source>\n        <maven.compiler.target>8</maven.compiler.target>\n        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>\n        <velocity_version>1.7</velocity_version>\n    </properties>\n\n\n<!--    依赖-->\n    <dependencies>\n        <dependency>\n            <groupId>org.apache.velocity</groupId>\n            <artifactId>velocity</artifactId>\n<!--            引入版本-->\n            <version>${velocity_version}</version>\n        </dependency>\n        <dependency>\n            <groupId>junit</groupId>\n            <artifactId>junit</artifactId>\n            <version>4.13.1</version>\n<!--            范围：编译-->\n            <scope>compile</scope>\n<!--            test  当前依赖仅参与当前项目测试-->\n<!--            runtime 当前依赖仅参与项目的运行阶段-->\n<!--            provided  与compile类似，但是不参与项目的打包-->\n<!--            system从本地引入jar包-->\n<!--            <systemPath>jar包所在路径</systemPath>-->\n            \n<!--            解决jar冲突，引入排除jar标签-->\n            <exclusions>\n                <exclusion>\n                    <groupId></groupId>\n                    <artifactId></artifactId>\n                </exclusion>\n            </exclusions>\n        </dependency>\n    </dependencies>\n<!--    开源许可证-->\n    <licenses>\n        <license>\n            <name></name>\n            <url></url>\n        </license>\n    </licenses>\n<!--    开发者信息-->\n    <developers>\n        <developer>\n            <name></name>\n            <email></email>\n            <organization></organization>\n            <organizationUrl></organizationUrl>\n        </developer>\n    </developers>\n\n<!--    指定当前项目的项目版本控制工具，例如git，svn-->\n    <scm>\n        <connection></connection>\n        <developerConnection></developerConnection>\n        <tag></tag>\n        <url></url>\n    </scm>\n\n<!--    编译配置-->\n    <build>\n<!--        编译后的配置名称-->\n        <finalName>Jfast</finalName>\n<!--        项目源代码目录-->\n        <sourceDirectory>src/main/java</sourceDirectory>\n<!--        配置资源路径-->\n        <resources>\n            <resource>\n                <directory></directory>\n                <filtering></filtering>\n            </resource>\n        </resources>\n<!--        插件信息-->\n        <plugins>\n            <plugin>\n                <groupId></groupId>\n                <artifactId></artifactId>\n                <version></version>\n                <configuration>\n                    <source></source>\n                    <target></target>\n                </configuration>\n                <executions>\n                    <execution>\n                        <id></id>\n                        <goals></goals>\n                    </execution>\n                </executions>\n            </plugin>\n        </plugins>\n\n    </build>\n</project>\n```\n\n\n#### 模块化开发\n\n**好处：**\n\n降低代码的复杂性，提高开发效率\n\n遵循高内聚，低耦合的设计模式，降低代码耦合。\n\n避免重复造轮子，模块重复利用，提高开发效率。\n\n\n\nmaven常用命令\n\nclean ：清除编译后的二进制文件\n\ncomplie：编译命令\n\ntest：单元测试命令\n\npackage：打包命令\n\ninstall：除了跟package一样，还将打包后的包安装到本地仓库\n\n## git\n\n一款开源的分布式版本控制工具。能够很好控制项目的版本，让项目迭代上线。\n\n为什么要用git：\n\n分布式设计能够让开发人员多人合作开发，提高开发的效率\n\n可以避免多人合作开发中代码冲突问题。\n\n可以切换版本，当代码出现问题时，可以回退到以前版本，防止错误操作导致代码的丢失。\n\n\n\n### git 流程\n\n代码创建者git push 推给GIT服务器远程仓库。其他开发人员git clone克隆/git pull 、git merge(合并)代码到本地项目目录，git add 把代码添加到暂存区，git commit 提交给本地仓库，git push 推给GIT服务器远程仓库。\n\n\n\n### git 分支\n\n主分支：master\n\n开发分支：dev\n\nbug分支：bug\n\n分支可以让项目上线后，开发人员能够不影响客户正常使用的情况下，添加功能，或者修改bug。\n\n任何分支最后要合并master分支。（merge）\n\ndev分支下可以有子分支，例如dev-1,dev-2。bug分支也是如此。\n\n', '<h1><a id=\"_0\"></a>项目积累</h1>\n<h2><a id=\"maven_2\"></a>maven</h2>\n<p>一款由apache公司开发的纯java开发的开源项目，项目对象模型管理工具。用于项目中构建，测试，打包，部署。使得开发更加简易。</p>\n<p>优点：</p>\n<p>能够快速进行项目构建和部署。</p>\n<p>避免项目导入jar出现jar冲突的问题。</p>\n<p>约定大于配置，规定了项目目录结构，使得项目开发更为规范。</p>\n<p>多模块开发</p>\n<h3><a id=\"pom_15\"></a>pom文件</h3>\n<h4><a id=\"_17\"></a>文件结构</h4>\n<pre><code class=\"lang-<?xml\">&lt;!--根元素--&gt;\n&lt;project xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot;\n         xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;\n         xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd&quot;&gt;\n&lt;!--    pom文件版本--&gt;\n    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;\n\n\n&lt;!--    可以看成xyz空间坐标，用于标注具体项目--&gt;\n&lt;!--    公司域名--&gt;\n    &lt;groupId&gt;org.example&lt;/groupId&gt;\n&lt;!--    项目名称--&gt;\n    &lt;artifactId&gt;jedis&lt;/artifactId&gt;\n&lt;!--    项目版本号--&gt;\n    &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;\n&lt;!--    导包方式--&gt;\n    &lt;packaging&gt;jar&lt;/packaging&gt;\n&lt;!--    继承父类pom--&gt;\n    &lt;parent&gt;&lt;/parent&gt;\n&lt;!--    子模块--&gt;\n    &lt;modules&gt;\n        &lt;module&gt;&lt;/module&gt;\n    &lt;/modules&gt;\n\n&lt;!--    属性标签，标注版本--&gt;\n    &lt;properties&gt;\n        &lt;maven.compiler.source&gt;8&lt;/maven.compiler.source&gt;\n        &lt;maven.compiler.target&gt;8&lt;/maven.compiler.target&gt;\n        &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;\n        &lt;velocity_version&gt;1.7&lt;/velocity_version&gt;\n    &lt;/properties&gt;\n\n\n&lt;!--    依赖--&gt;\n    &lt;dependencies&gt;\n        &lt;dependency&gt;\n            &lt;groupId&gt;org.apache.velocity&lt;/groupId&gt;\n            &lt;artifactId&gt;velocity&lt;/artifactId&gt;\n&lt;!--            引入版本--&gt;\n            &lt;version&gt;${velocity_version}&lt;/version&gt;\n        &lt;/dependency&gt;\n        &lt;dependency&gt;\n            &lt;groupId&gt;junit&lt;/groupId&gt;\n            &lt;artifactId&gt;junit&lt;/artifactId&gt;\n            &lt;version&gt;4.13.1&lt;/version&gt;\n&lt;!--            范围：编译--&gt;\n            &lt;scope&gt;compile&lt;/scope&gt;\n&lt;!--            test  当前依赖仅参与当前项目测试--&gt;\n&lt;!--            runtime 当前依赖仅参与项目的运行阶段--&gt;\n&lt;!--            provided  与compile类似，但是不参与项目的打包--&gt;\n&lt;!--            system从本地引入jar包--&gt;\n&lt;!--            &lt;systemPath&gt;jar包所在路径&lt;/systemPath&gt;--&gt;\n            \n&lt;!--            解决jar冲突，引入排除jar标签--&gt;\n            &lt;exclusions&gt;\n                &lt;exclusion&gt;\n                    &lt;groupId&gt;&lt;/groupId&gt;\n                    &lt;artifactId&gt;&lt;/artifactId&gt;\n                &lt;/exclusion&gt;\n            &lt;/exclusions&gt;\n        &lt;/dependency&gt;\n    &lt;/dependencies&gt;\n&lt;!--    开源许可证--&gt;\n    &lt;licenses&gt;\n        &lt;license&gt;\n            &lt;name&gt;&lt;/name&gt;\n            &lt;url&gt;&lt;/url&gt;\n        &lt;/license&gt;\n    &lt;/licenses&gt;\n&lt;!--    开发者信息--&gt;\n    &lt;developers&gt;\n        &lt;developer&gt;\n            &lt;name&gt;&lt;/name&gt;\n            &lt;email&gt;&lt;/email&gt;\n            &lt;organization&gt;&lt;/organization&gt;\n            &lt;organizationUrl&gt;&lt;/organizationUrl&gt;\n        &lt;/developer&gt;\n    &lt;/developers&gt;\n\n&lt;!--    指定当前项目的项目版本控制工具，例如git，svn--&gt;\n    &lt;scm&gt;\n        &lt;connection&gt;&lt;/connection&gt;\n        &lt;developerConnection&gt;&lt;/developerConnection&gt;\n        &lt;tag&gt;&lt;/tag&gt;\n        &lt;url&gt;&lt;/url&gt;\n    &lt;/scm&gt;\n\n&lt;!--    编译配置--&gt;\n    &lt;build&gt;\n&lt;!--        编译后的配置名称--&gt;\n        &lt;finalName&gt;Jfast&lt;/finalName&gt;\n&lt;!--        项目源代码目录--&gt;\n        &lt;sourceDirectory&gt;src/main/java&lt;/sourceDirectory&gt;\n&lt;!--        配置资源路径--&gt;\n        &lt;resources&gt;\n            &lt;resource&gt;\n                &lt;directory&gt;&lt;/directory&gt;\n                &lt;filtering&gt;&lt;/filtering&gt;\n            &lt;/resource&gt;\n        &lt;/resources&gt;\n&lt;!--        插件信息--&gt;\n        &lt;plugins&gt;\n            &lt;plugin&gt;\n                &lt;groupId&gt;&lt;/groupId&gt;\n                &lt;artifactId&gt;&lt;/artifactId&gt;\n                &lt;version&gt;&lt;/version&gt;\n                &lt;configuration&gt;\n                    &lt;source&gt;&lt;/source&gt;\n                    &lt;target&gt;&lt;/target&gt;\n                &lt;/configuration&gt;\n                &lt;executions&gt;\n                    &lt;execution&gt;\n                        &lt;id&gt;&lt;/id&gt;\n                        &lt;goals&gt;&lt;/goals&gt;\n                    &lt;/execution&gt;\n                &lt;/executions&gt;\n            &lt;/plugin&gt;\n        &lt;/plugins&gt;\n\n    &lt;/build&gt;\n&lt;/project&gt;\n</code></pre>\n<h4><a id=\"_143\"></a>模块化开发</h4>\n<p><strong>好处：</strong></p>\n<p>降低代码的复杂性，提高开发效率</p>\n<p>遵循高内聚，低耦合的设计模式，降低代码耦合。</p>\n<p>避免重复造轮子，模块重复利用，提高开发效率。</p>\n<p>maven常用命令</p>\n<p>clean ：清除编译后的二进制文件</p>\n<p>complie：编译命令</p>\n<p>test：单元测试命令</p>\n<p>package：打包命令</p>\n<p>install：除了跟package一样，还将打包后的包安装到本地仓库</p>\n<h2><a id=\"git_167\"></a>git</h2>\n<p>一款开源的分布式版本控制工具。能够很好控制项目的版本，让项目迭代上线。</p>\n<p>为什么要用git：</p>\n<p>分布式设计能够让开发人员多人合作开发，提高开发的效率</p>\n<p>可以避免多人合作开发中代码冲突问题。</p>\n<p>可以切换版本，当代码出现问题时，可以回退到以前版本，防止错误操作导致代码的丢失。</p>\n<h3><a id=\"git__181\"></a>git 流程</h3>\n<p>代码创建者git push 推给GIT服务器远程仓库。其他开发人员git clone克隆/git pull 、git merge(合并)代码到本地项目目录，git add 把代码添加到暂存区，git commit 提交给本地仓库，git push 推给GIT服务器远程仓库。</p>\n<h3><a id=\"git__187\"></a>git 分支</h3>\n<p>主分支：master</p>\n<p>开发分支：dev</p>\n<p>bug分支：bug</p>\n<p>分支可以让项目上线后，开发人员能够不影响客户正常使用的情况下，添加功能，或者修改bug。</p>\n<p>任何分支最后要合并master分支。（merge）</p>\n<p>dev分支下可以有子分支，例如dev-1,dev-2。bug分支也是如此。</p>\n', 1634024179302948865);
INSERT INTO `dcx_article_body` VALUES (1634024842548240387, '# springboot\n\n## springboot是什么？\n\n1. 开源免费\n2. 脚手架\n3. 简化配置，易上手\n4. 内置容器，易部署\n5. 可独立开发应用\n6. 微服务分布式基础\n7. 特点：自动装配，开箱即用\n\n\n\n\n\n------\n\n\n\n## SpringBoot技术总概\n\nSpringBoot自动配置核心原理\n\nLombok简化 JavaBean开发\n\ndev-tool 热部署，无需重启项目，自动编译成字节码\n\n\n\n------\n\n\n\n### SpringBoot自动配置\n\n1. 依赖管理。\n\n   父项目做依赖管理，有版本仲裁机制。\n\n2. 有各个场景启动器。\n\n   引入组件，自动配好依赖。\n\n3. 默认包结构。\n\n   自动扫描启动类所在包的同级包范围内的组件。\n\n   （改变扫描路径：@SpringBootApplication(scanBasePackages = “”)或者@ComponentScan(\"\") 注解放在启动类上\n\n4. 配置拥有默认值。都会映射在相应类上，类在容器中创建对象。\n\n5. 按需加载配置。引入某些启动器，才会加载相应配置。自动配置功能都在spring - boot - autoconfigure包里面。\n\n**常用注解**\n\n1. @Configuration（proxyBeanMethods = false）\n\n   - 在类上加入此注解，意味着此类为配置类。\n\n   - 分为Lite模式和Full模式\n\n   - 当proxyBeanMethods 值为true（默认值）为Full模式，容器中类对应的对象实例为单例。\n\n   - 当proxyBeanMethods值为true时为Lite模式，容器中的类对应的对象可以有多个副本。\n\n2. @Bean、@Component、@Controller、@Service、@Repository\n\n3. @ComponentScan 包扫描\n\n4. @Import \n\n5. @Conditional  条件装配。满足Conditional指定的条件，则进入组件注入\n\n6. @ImportResource(classpath:xxx.xml)\n\n   导入老配置文件\n\n7. @Component + @ConfigurationProperties(prefix = \"car\")将javaBean类注入容器中\n\n8. @EnableConfigurationProperties + @ConfigurationProperties\n\n### SpringBoot自动配置原理入门\n\n@SpringBootApplication\n\n- @SpringBootConfiguration\n\n  - @Configuration\n\n- @EnableAutoConfiguration\n\n  - @AutoConfigurationPacketage\n    - import(AutoConfigurationPacketages.Registrar.class)\n  - @impot(AutoConfigurationSelector.class)\n\n- @ComponentScan(excludeFilters = { @Filter(type = FilterType.CUSTOM, classes = TypeExcludeFilter.class),@Filter(type = FilterType.CUSTOM, classes = AutoConfigurationExcludeFilter.class) })\n\n  \n\n修改默认配置\n\n```java\n//给容器中添加文件上传解析器\n@Bean\n@ConditionalOnBean(MultipartResolver.class)\n@ConditionalOnMisingBean(name = DispatcherServlet.MULTIPART_RESOLVER_BEAN_NAME)\npublic MultipartResolve multipartResolver(MultipartResovler resolver){\n\n	return resolver;\n\n}\n```\n\nSpringBoot默认会在底层配好所有组件，以用户配置优先\n\n\n\n**总结**：\n\n- SpringBoot先加载所有的自动配置类 xxxAutoConfiguration\n\n- 每个自动配置类都会按照条件进行生效，默认都会绑定配置文件绑定的值。xxxProperties里面拿。\n\n- xxxProperties和配置文件进行了绑定。\n\n- 生效的配置类可以给容器装配很多组件。\n\n- 容器中有这些组件，像当于拥有这些功能。 \n\n- 定制化配置\n\n  - 用户用@Bean替换底层的组件\n\n  - 用户看组件是获取哪个配置文件什么值，然后去修改。\n\n  xxxAutoConfiguration --> 组件 -->xxxProperties里面拿 --> application.properties\n\n', '<h1><a id=\"springboot_0\"></a>springboot</h1>\n<h2><a id=\"springboot_2\"></a>springboot是什么？</h2>\n<ol>\n<li>开源免费</li>\n<li>脚手架</li>\n<li>简化配置，易上手</li>\n<li>内置容器，易部署</li>\n<li>可独立开发应用</li>\n<li>微服务分布式基础</li>\n<li>特点：自动装配，开箱即用</li>\n</ol>\n<hr />\n<h2><a id=\"SpringBoot_20\"></a>SpringBoot技术总概</h2>\n<p>SpringBoot自动配置核心原理</p>\n<p>Lombok简化 JavaBean开发</p>\n<p>dev-tool 热部署，无需重启项目，自动编译成字节码</p>\n<hr />\n<h3><a id=\"SpringBoot_34\"></a>SpringBoot自动配置</h3>\n<ol>\n<li>\n<p>依赖管理。</p>\n<p>父项目做依赖管理，有版本仲裁机制。</p>\n</li>\n<li>\n<p>有各个场景启动器。</p>\n<p>引入组件，自动配好依赖。</p>\n</li>\n<li>\n<p>默认包结构。</p>\n<p>自动扫描启动类所在包的同级包范围内的组件。</p>\n<p>（改变扫描路径：@SpringBootApplication(scanBasePackages = “”)或者@ComponentScan(&quot;&quot;) 注解放在启动类上</p>\n</li>\n<li>\n<p>配置拥有默认值。都会映射在相应类上，类在容器中创建对象。</p>\n</li>\n<li>\n<p>按需加载配置。引入某些启动器，才会加载相应配置。自动配置功能都在spring - boot - autoconfigure包里面。</p>\n</li>\n</ol>\n<p><strong>常用注解</strong></p>\n<ol>\n<li>\n<p>@Configuration（proxyBeanMethods = false）</p>\n<ul>\n<li>\n<p>在类上加入此注解，意味着此类为配置类。</p>\n</li>\n<li>\n<p>分为Lite模式和Full模式</p>\n</li>\n<li>\n<p>当proxyBeanMethods 值为true（默认值）为Full模式，容器中类对应的对象实例为单例。</p>\n</li>\n<li>\n<p>当proxyBeanMethods值为true时为Lite模式，容器中的类对应的对象可以有多个副本。</p>\n</li>\n</ul>\n</li>\n<li>\n<p>@Bean、@Component、@Controller、@Service、@Repository</p>\n</li>\n<li>\n<p>@ComponentScan 包扫描</p>\n</li>\n<li>\n<p>@Import</p>\n</li>\n<li>\n<p>@Conditional  条件装配。满足Conditional指定的条件，则进入组件注入</p>\n</li>\n<li>\n<p>@ImportResource(classpath:xxx.xml)</p>\n<p>导入老配置文件</p>\n</li>\n<li>\n<p>@Component + @ConfigurationProperties(prefix = “car”)将javaBean类注入容器中</p>\n</li>\n<li>\n<p>@EnableConfigurationProperties + @ConfigurationProperties</p>\n</li>\n</ol>\n<h3><a id=\"SpringBoot_82\"></a>SpringBoot自动配置原理入门</h3>\n<p>@SpringBootApplication</p>\n<ul>\n<li>\n<p>@SpringBootConfiguration</p>\n<ul>\n<li>@Configuration</li>\n</ul>\n</li>\n<li>\n<p>@EnableAutoConfiguration</p>\n<ul>\n<li>@AutoConfigurationPacketage\n<ul>\n<li>import(AutoConfigurationPacketages.Registrar.class)</li>\n</ul>\n</li>\n<li>@impot(AutoConfigurationSelector.class)</li>\n</ul>\n</li>\n<li>\n<p>@ComponentScan(excludeFilters = { @Filter(type = FilterType.CUSTOM, classes = TypeExcludeFilter.class),@Filter(type = FilterType.CUSTOM, classes = AutoConfigurationExcludeFilter.class) })</p>\n</li>\n</ul>\n<p>修改默认配置</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\"><span class=\"hljs-comment\">//给容器中添加文件上传解析器</span>\n<span class=\"hljs-meta\">@Bean</span>\n<span class=\"hljs-meta\">@ConditionalOnBean</span>(MultipartResolver.class)\n<span class=\"hljs-meta\">@ConditionalOnMisingBean</span>(name = DispatcherServlet.MULTIPART_RESOLVER_BEAN_NAME)\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> MultipartResolve <span class=\"hljs-title\">multipartResolver</span><span class=\"hljs-params\">(MultipartResovler resolver)</span></span>{\n\n	<span class=\"hljs-keyword\">return</span> resolver;\n\n}\n</code></div></pre>\n<p>SpringBoot默认会在底层配好所有组件，以用户配置优先</p>\n<p><strong>总结</strong>：</p>\n<ul>\n<li>\n<p>SpringBoot先加载所有的自动配置类 xxxAutoConfiguration</p>\n</li>\n<li>\n<p>每个自动配置类都会按照条件进行生效，默认都会绑定配置文件绑定的值。xxxProperties里面拿。</p>\n</li>\n<li>\n<p>xxxProperties和配置文件进行了绑定。</p>\n</li>\n<li>\n<p>生效的配置类可以给容器装配很多组件。</p>\n</li>\n<li>\n<p>容器中有这些组件，像当于拥有这些功能。</p>\n</li>\n<li>\n<p>定制化配置</p>\n<ul>\n<li>\n<p>用户用@Bean替换底层的组件</p>\n</li>\n<li>\n<p>用户看组件是获取哪个配置文件什么值，然后去修改。</p>\n</li>\n</ul>\n<p>xxxAutoConfiguration --&gt; 组件 --&gt;xxxProperties里面拿 --&gt; application.properties</p>\n</li>\n</ul>\n', 1634024842548240385);
INSERT INTO `dcx_article_body` VALUES (1634025473270898692, '# 我的第一本算法书\n\n## 线性结构\n\n\n\n### 链表\n\n1. #### 单向链表\n\n- 分散存储在内存，不需要存储在连续空间内。\n- 每个数据都有一个指针，指向下一个数据的地址\n- 查询数据：从链表头部往后查询（线性查找），时间复杂度O（n）\n- 增加数据：需要增加数据位置的前一个指针指向需要增加数据的地址，增加数据的指针再指向添加位置后面的数据地址。（改变添加位置前后的指针指向）时间复杂度O（1）\n- 删除数据：改变需要删除数据的前一个指针指向不再指向需要删除数据地址。时间复杂度O（1）\n\n\n\n\n\n2. #### 循环链表（环形链表）\n\n   链表尾部指针指向头部数据地址。\n\n   想要保存数量固定的最新数据时会使用这种链表。\n\n3. #### 双向链表\n\n   拥有两个指针，分别指向前后的数据，可以前后访问数据。\n\n   弥补了单向链表中访问数据效率低的问题，但是指针数量增加，需要更多**内存空间**来存储指针，添加删除操作时，需要改变的**指针数**增加。\n\n### 数组\n\n数据存储在连续的内存中。\n\n查询：可以直接通过数组下标直接查询。时间复杂度O（1）\n\n增加、删除：需要扩容或者缩小数组大小以及需要移动数据。时间复杂度O（n）\n\n集合ArrayList 底层用的是数组，LinkedList底层用的是链表。\n\n数组在查询方面效率较高，增加和删除效率较低。\n\n链表在查询方面效率较低，增加和删除效率较高。\n\n-----------------------\n\n### 栈\n\n栈中数据呈线性排列，分栈顶，栈底。\n\n增加，删除数据只能从一端就行，取得最新数据。\n\n后进先出（Last In First Out,LIFO）想要访问中间数据，只能从栈顶出栈（pop），直到中间数据弹出，才能访问得到。相对应有入栈操作（push）。\n\n### 队列\n\n队列中数据呈线性排列，分队首，队尾。\n\n增加数据，从队尾添加。删除数据从队首。\n\n先进先出（First In First Out,FIFO）,想要访问中间数据，只能从队首依次出队，才能访问到。\n\n\n\n\n\n### 哈希表\n\n哈希表由数组+链表组成\n\n哈希数据用key，value表示。key 是数据的标识，value 是数据内容\n\n由哈希函数计算出哈希值，哈希值%（规定数组的大小）取mod，得到结果就是数据存储在数组上的位置，如果出现结果相同（哈希冲突），在所对应相同的位置上比较数据是否一样，如果不一样则在链表尾部插入新数据。\n\n哈希冲突解决的办法：\n\n链地址法（上述）\n\n开放地址法：不断通过哈希函数计算新的哈希值，取mod获得数组上的新索引。计算出一个候补地址（数组上的位置），看数组上对应位置上是否有数据，如果有，则再次重复此方法一直查找到候补地址是空地址为止。\n\n\n\n### 堆\n\n堆是一种图的树形结构，被用于实现“优先队列”（priority queues）。可以自由添加数据，删除数据时需要从最小的数值开始删除（根节点）。在堆的树形结构中，各个顶点被称为“节点”（node），数据就存储在这些节点中。\n\n堆：根节点数值不能比子节点大，左节点 < 右节点。\n\n添加数据从树的最右边的右节点开始添加数据，交换规则按照堆结构规范。\n\n取数据的时间复杂度：O（1） 直接从树的顶端开始取\n\n重构树的时间复杂度：O（logn)  需要最低端开始向上换位置，跟树的高度成正比（log2n）\n\n添加数据的时间复杂度：O（logn) 需要最低端开始向上换位置，跟树的高度成正比（log2n）\n\n\n\n### 二叉查找树\n\n二叉查找树是一种树形结构。又称为二分搜索树和二叉排序树。\n\n数据存储在树的节点上。\n\n根节点 > 左子树节点 && 根节点 <  右子树节点。\n\n查找数据：从顶端开始查找，大于根节点就向右子树节点查找。小于根节点就向左子树查找。依次类推，直到找到。\n\n添加数据：从顶端开始，数据大于根节点从左边开始寻找位置，找到位置后，添加节点即可。如果占用了树原来的节点，则考虑节点重新按照二叉查找树排序。\n\n删除数据：先通过查找数据找到需要删除的数据，确定需要删除的节点后。将其他节点重新按照二叉查找树排序。\n\n查找，添加，删除都依赖于移动节点。如果树节点比较均匀，则时间复杂度与树的高度呈正比。时间复杂度O（logn)，如果是从单一侧分布节点，则树会变得很高。则时间复杂度为O（n）\n\n\n\n\n\n## 排序\n\n\n\n\n\n### 冒泡排序\n\n冒泡排序通过分轮次不断比较相邻的俩个数依次找到较小（较大）的数字然后进行排序。\n\n例如：第一轮，会将最大值（最小值）排序后放到第一位\n\n第一轮：n-1次\n\n第二轮：n-2次\n\n第三轮：n-3次\n\n第n-1轮：1次\n\n时间复杂度=(n-1)+(n-2)+(n-3)...+1约等于n平方/2\n\n\n\n### 选择排序\n\n比较得出数字最小的放在第一位，然后比较剩余n-1位，得到最小的，放在第二位，然后比较剩余n-2为，得到最小的，放在第三位。以此类推。\n\n时间复杂度O（n平方）\n\n\n\n### 插入排序\n\n插入排序是通过左部的数比较右部的数，找到合适的位置，插入。\n\n设左边的数字为第一个数字，右边数字比较左部分数字，如果比它大就放在第一个数字右边，比它小就放在左边，以此类推。\n\n时间复杂度O（n平方）\n\n\n\n### 堆排序\n\n基于堆结构的排序，将数据放入堆中，从顶端开始取数据。时间复杂度O（nlogn）\n\n\n\n### 归并排序\n\n将数字拆分为多组。对半拆分到只剩下俩个数字。一组有俩个数字，俩组第一个数字相比较，较小的放在归并的第一个数字，然后再继续比较放置第二个，第三个位置。直到合并为一个整体。\n\n时间复杂度 O（nlogn)\n\n\n\n### 快速排序法（递归分治）\n\n1. 随机寻找基准值，小于基准值的放在基准值右边，大于基准值的放在基准值左边。\n2. 分为三大部分。\n3. 小于基准值的部分看是不是只剩下一个数字，如果不是则再进行快速排序。大于基准值的部分也是如此。\n\n时间复杂度：\n\n- 随机的基准值每次都是最小值，则时间复杂度为O（n平方）\n- 随机的基准值都处于中间位置，则时间复杂度和堆排序的时间复杂一样O(nlogn)\n\n\n\n## 数组的查找\n\n### 线性查找\n\n查询数据中的一个数字，从第一个数字开始比较，如果相同则返回结果。如果不一致，则继续从下一个数字依次查找。\n\n时间复杂度O(n)\n\n\n\n\n\n### 二分查找\n\n二分查找前提：是排序好的数据\n\n选择数据中间位置进行比较，和需要查找的数据一致，则得到结果。\n\n如果比中间位置的数据小，则表明要查询的数字在数据的左边，比中间位置的数据大，则表明要查询的数字在数据的右边。例如查询的数字比中间数字要小，则在左边区域再确定中间位置，与之进行比较，重复前面的比较规则。\n\n\n\n## 图\n\n图由顶点（节点）和连接节点的线组成。线上带有数字，称为权。\n\n图分类：\n\n- 有向图\n- 无向图\n- 加权图\n\n**重点：**\n\n- 图的搜索：搜索图中的节点（广度优先搜索，深度优先搜索）\n- 图的最短路径：权重和最小的路径\n\n​	\n\n### 广度优先搜索\n\n搜索的时候用到队列（FIFO）\n\n广度优先是广泛的搜索，目标顶点离起点越近，搜索结束得越快。\n\n没有闭合的图，可以称为是树。\n\n先从节点开始搜索，按照同一级，从左到右开始搜索。然后再进入下一级，继续从左到右开始搜索，以此类推。\n\n### 深度优先搜索\n\n搜索的时候用到栈（LIFO）\n\n深度优先是找到一条路径一直搜索下去，搜索不到再回头搜索另外得路线。\n\n深度优先是从最新的候选点搜。广度优先是从最早的候选节点搜索，离起点越近越早成为候补。\n\n\n\n### 贝斯曼.福特算法\n\n查理德.贝斯曼 和 莱斯特.福特是创始人\n\n寻找最短路径算法。\n\n将起始节点的权重设为0，其他所有的节点设置为无穷大。\n\n节点权重+边权重=路径权重\n\n路径权重小于下一个节点权重则替换原来无穷大的节点权重成路径权重。反之，不做任何处理。相当于最小路径的权重赋给了下一个节点。\n\n节点权重+ 边权重 **<** 下一个节点权重，则替换。否则不做处理。边权重为负也可。\n\n所有节点最终权重都要符合上述要求。\n\n\n\n### 狄克斯特拉算法\n\n狄克斯特拉算法和贝斯曼福特算法一样都是求路径最短问题。\n\n狄克斯特拉：存在负值权重的时候，会出现错误。不能适用存有负值的图。\n\n贝斯曼福特算法：存在负值权重的时候，同样可以使用。\n\n\n\n狄克斯特拉算法：\n\n将所有节点初始权重全部设为无穷大，起始节点设为0。\n\n与第一个节点相连的节点作为候选节点。在候选节点中，优先选择（节点权重+线上权重）较小的节点。较小的权重可以替换原来下一个节点的权重。也同时计算，下一个节点的权重。\n\n核心点：在选择图搜索的路径时候，优先选择图中所有目前为止最小权重的节点，并且把此节点作为最短路径的节点，继续计算下一个节点权重。最终所有节点的权重陆陆续续计算出来，并且到达目的点，如果某一条路径的点到到达目的点的所有权重小于原来的目的点权重，则替换，否则不变\n\n\n\n\n\n### A*算法\n\n1. 起始点权重、预估权重、终点权重\n2. 标记终点权重	=	起始点权重 + 预估权重\n3. 预估权重是预估值，是对到终点的距离的估值。\n4. 将标记终点权重作为节点权重\n5. A*算法遵循节点权重小于相连的节点权重，即可将优先选择较小的节点进行搜索。\n6. 预估权重越准确，则A*算法执行效果更佳。预估权重如果偏移量大，则会发生错误！\n\n\n\n## 安全算法\n\n### 网络安全问题\n\n- 窃听\n- 冒充\n- 篡改\n- 事后否认\n\n\n\n\n\n1. 防止窃听 （加密）\n2. 防止冒充（消息认证码，数字签名）\n3. 防止篡改（消息认证码，数字签名）\n4. 防止事后否认（数字签名）\n\n### 加密，解密\n\n加密：使用密钥对二进制的文件（数据）进行数值运算成第三者计算机无法理解的密文。\n\n解密：是将密文恢复成原来的二进制文件（数据）\n\n\n\n### 哈希函数\n\n将二进制文件转换成由0-9，a-f范围内的字符组成16进制16个字符的文件。\n\n​	**哈希函数五大特征**\n\n1. 不可逆。哈希函数计算出来的哈希值不可以逆向将哈希值变成原来的数据。\n2. 同个数据使用哈希函数转换得到的哈希值必定相同\n3. 稍有差异的数据使用哈希函数转换得到的哈希值差异很大\n4. 不是同个数据使用哈希函数转换得到的哈希值可能一样（哈希冲突）\n5. 长度不一样的数据使用哈希函数转换得到哈希值长度是都是一样，哈希值由16个字符组成\n\n\n\n哈希函数使用到的算法\n\nMD5 (Message Diggest Alogrithm)\n\nSHA-1(Secure Hash Alogrithm -1)\n\nSHA-2(Secure Hash Alogrithm -2)\n\n前两种算法都有一定隐患。\n\n\n\n### 共享密钥加密（对称加密）\n\nA用密钥加密数据，发送给B。B解密也用相同的密钥进行密文解密。\n\n发送，接收双方用的都是同个密钥。（对称加密）\n\n隐患：第三方窃听，获取到了密钥。安全性不足。\n\n\n\n### 公开密钥，私有密钥（非对称加密）\n\nB创建公开密钥（可发布在网上），私有密钥自己保存。\n\nB将公开密钥发送给A，A收到密钥后将数据用密钥计算得密文，再发送给B。\n\nB接收到密钥后，用私有密钥解密。\n\n加密解密用的不是同个密钥（非对称加密）\n\n\n\n**隐患：**\n\n恶意中间人创建密钥以及私有密钥，将公开密钥发送给A，A会用中间人的公开密钥加密数据，然后发送给B的时候，被中间人窃听，从A获取到密文后用私有密钥解密。B用公开密钥发送给A时，被中间人窃听，中间人篡改数据后用B发送的公开密钥加密，发给B，B获取密文后用私有密钥解密后的数据可能存有巨大的安全问题。\n\n\n\n### 混合密钥加密\n\nA向B发送数据：\n\n1. A生成共享密钥。B生成公开密钥和私有密钥\n2. B向A发送公开密钥，A将共享密钥用从B接收来的公有密钥加密，然后发送给B。\n3. B接收到A发送来的密文，用私有密钥解密，得到B的共享密钥。\n4. A向B发送A用共享密钥加密后的密文。\n5. B接收到A发送来的密文，用B的共享密钥解密即可。\n\n效果，速度得到提升，以及更加安全。\n\nSSL协议（Security Sockets  Layer）中用到了混合密钥算法\n\n后升级为TLS（Transport  Layer Security）传输层安全\n\n称为为：SSL/TLS协议\n\n\n\n\n\n### 迪菲·赫尔曼密钥交换\n\n**密钥合成原则：**\n\n1. 密钥A和密钥B以及密钥C合成密钥ABC，密钥ABC不能分解成密钥A密钥B密钥C。\n2. 密钥ABC合成顺序不同，但是密钥结果一样。密钥ABC和密钥ACB结果一致。\n3. 合成后的密钥可以跟新的密钥再合成\n\n**过程：**\n\n1. A向B发送公有密钥p\n2. A生成私有密钥。\n3. B生成私有密钥。B接收A发送的公有密钥。\n4. A的公有密钥和私有合成密钥pA，B将接收到的公有密钥和私有密钥合成pB\n5. A将合成后的密钥(SPA)发送给B，B也将合成后的密钥(SPB)发送给A。\n6. A将SPA和SB合成为SPAB,B将SPB和SB合成为SPBA。\n7. SPAB 和 SPBA 是同个密钥。\n\n\n\n**原理：**\n\n引入素数P,P的原根G，次方X，次方Y\n\nP,G是公开密钥中的俩个元素。\n\nA，B生成自己的私有密钥（分别是X，Y）\n\nA,	B分别将私有密钥和公有密钥合成，（G的X次方 mod  P，G的Y次方 mod  P）\n\nA，B互相发送合成的密钥，G的X次方 mod  P，G的Y次方 mod  P\n\nA,	B再次合成对方发送来的密钥。（G的X次方 * G的Y次方） mod  P即为最终密钥\n\n\n\n\n\n根据素数 *P*、生成元 *G* 和“*G**X* mod *P*”求出 *X* 的问题就是“离散对数问题”，人们\n\n至今还未找到这个问题的解法，而迪菲 - 赫尔曼密钥交换正是利用了这个数学难题。\n\n使用迪菲 - 赫尔曼密钥交换，通信双方仅通过交换一些公开信息就可以实现密钥\n\n交换。但实际上，双方并没有交换密钥，而是生成了密钥。因此，该方法又被叫作“迪 \n\n菲 - 赫尔曼密钥协议”。\n\n\n\n\n\n### 消息认证码\n\n\n\n防止A向B发送密文时，被中间人篡改，而B却不知。\n\nA向B发送密钥（用于制作消息认证码的密钥）\n\nA将密钥和密文计算得出的MAC（Message Authentication Code ）和密文一同发送给B。\n\nB接收到MAC后，通过先前获得的密钥与接收到密文计算得出MAC，看A发送来的MAC和B自己计算出来的MAC是否相同，相同则为被篡改，否则视为被篡改，再次向A发送请求。\n\n\n\n我们可以把MAC想象成是由密钥和密文组成的字符串的“哈希值”。计算MAC的算法有\n\nHMAC①、OMAC②、CMAC③等。目前，HMAC的应用最为广泛。\n\n\n\n### 数字签名\n\n数字签名确认发送方身份。\n\nA生成私有密钥，公开密钥，以及消息。\n\nA向B发送公开密钥。\n\nA用私有密钥加密消息成密文（数字签名）、以及消息发送给B。\n\nB用公开密钥解密密文。得到消息，看是否是A发送来的。\n\n常规情况，是把消息转换成哈希值，然后将哈希值加密，作为数字签名发送给B\n\n可以防止冒充的安全问题。\n\n\n\n### 数字证书\n\n数字签名中，签名可能会被X（中间人）篡改，不安全。\n\n数字证书，解决了这一问题。\n\n数字证书由各大型企业（可信任）签发。\n\nA向受信任的组织机构申请数字证书，机构向A发送具有邮箱等信息的数字证书（证明是A的证书）并且机构中存有A的公开密钥。\n\nA向B发送数字证书，证明是由A本身发送的。\n\n机构向B发送A的公开密钥，然后B用公开密钥解密数字证书，验证证书是不是真的来自于机构。\n\n数字证书签发者一般都是大型受信任的大型企业，小型不受信任的企业也想发展此业务，需要向受信任的大型企业取得信任，他们形成了一个树状结构，产生了根节点（大型受信任的企业）。根节点有根证书（root），需要有根证书授权。\n\n\n\n机构向B发送A的公开密钥时，X窃听获得公开密钥，存有隐患。\n\n其实机构向B发送A的公开密钥，这个公开密钥是以数字证书的形式交付的，会有更高级的认证中心对这个认证中心署名，确保了安全。\n\n​		到目前为止，我们了解的都是个人之间交付公开密钥的例子，其实在网站之间的通\n\n信中同样也要用到数字证书。只要能收到来自网站的含有公开密钥的证书，就能确认该\n\n网站未被第三者冒充。\n\n此处的证书叫作“服务器证书”，同样由认证中心发行。个人的证书会与他的邮箱\n\n信息相对应，而服务器证书与域名信息相对应。因此，我们还可以确认网站域名和存储\n\n网站本身内容的服务器是由同一个组织来管理的。\n\n数字证书就是像这样通过认证中心来担保公开密钥的制作者。这一系列技术规范被\n\n统称为“公钥基础设施”（Public Key Infrastructure，PKI）。\n\n\n\n\n\n\n\n### 聚类\n\n相似的聚集在一组，为簇。\n\nK-Means聚类算法\n\n随机排列的点，取三个中心点，点与中心点的距离最短的为一组。\n\n最后可分为3组。\n\n中心点的数量不同，组数就不同。\n\n中心的位置不同，组中位置就不同。\n\n\n\n### 欧几里得算法（辗转相除法）\n\n欧几里得算法求最大公约数\n\n求A、B最大公约数\n\nA	mod	B   =  X1\n\nB	mod	X2	=	X3\n\nX2 	mod	X3	=	X4\n\nX3	mod	X4	=	0\n\n则X4 为最大公约数 	\n\n除数，被除数，余数都存有倍数关系。（核心）	\n\n\n\n### 素性测试\n\n素数在数字签名里面用的比较多。\n\n判断某个数是否为素数\n\n方法1：该数除以小于该数的平方根大于2的数。如果存有余数等于0，则为素数\n\n方法2：例如判断5是否为素数\n\n4的5次方	mod	5	=	4\n\n3的5次方	mod	5	=	3\n\n2的5次方	mod	5	=	2\n\n是否满足上列式子\n\n\n\n### 网页搜索\n\n网页搜索中，比较有价值的网页放在前面\n\n链状结构：看权重。上级权重是下级权重的和，下级权重是上级权重的平均值。\n\n环状结构：取概率（某一刻浏览该页面的概率）浏览该页面概率设为1-a,浏览其他页面设为a,浏览1000次，取得每个页面的概率。\n\n链状结构和环状结构都可以用概率方式搜索\n\n\n\n### 汉诺塔\n\n汉诺塔\n\nABC三个地方。\n\n其中A存放着大小不一样的盘子，上面小，下面大，现将A处的盘子全部移动到C处。\n\n规则：一次性只能移动一个盘子，大的盘子在下面，小的盘子在上面\n\n\n\n假设只有一个盘子在A处，直接将A处盘子移到C处\n\n假设有俩个盘子在A处，先将上面的小盘子移动到B处，然后将A处的大盘子移动到C处，将B处的小盘子移动到C处。\n\n移动n个盘子，按照n-1个盘子的步骤移动。递归调用，最后回到只调用1个盘子。\n\n时间复杂度：盘子为一个的时候，时间为T（1）\n\n盘子为n时，需要将A处n-1个盘子移动到B，时间为：T（n-1）\n\n将A处最大的盘子移动到C处，时间为：T（1）\n\n将B处n-1个盘子移动到C处，时间为：T（n-1)\n\n总共时间为：2T（n-1) + 1\n\nT(n)=2的n次方-1\n\n\n\n\n\n', '<h1><a id=\"_0\"></a>我的第一本算法书</h1>\n<h2><a id=\"_2\"></a>线性结构</h2>\n<h3><a id=\"_6\"></a>链表</h3>\n<ol>\n<li>\n<h4><a id=\"_8\"></a>单向链表</h4>\n</li>\n</ol>\n<ul>\n<li>分散存储在内存，不需要存储在连续空间内。</li>\n<li>每个数据都有一个指针，指向下一个数据的地址</li>\n<li>查询数据：从链表头部往后查询（线性查找），时间复杂度O（n）</li>\n<li>增加数据：需要增加数据位置的前一个指针指向需要增加数据的地址，增加数据的指针再指向添加位置后面的数据地址。（改变添加位置前后的指针指向）时间复杂度O（1）</li>\n<li>删除数据：改变需要删除数据的前一个指针指向不再指向需要删除数据地址。时间复杂度O（1）</li>\n</ul>\n<ol start=\"2\">\n<li>\n<h4><a id=\"_20\"></a>循环链表（环形链表）</h4>\n<p>链表尾部指针指向头部数据地址。</p>\n<p>想要保存数量固定的最新数据时会使用这种链表。</p>\n</li>\n<li>\n<h4><a id=\"_26\"></a>双向链表</h4>\n<p>拥有两个指针，分别指向前后的数据，可以前后访问数据。</p>\n<p>弥补了单向链表中访问数据效率低的问题，但是指针数量增加，需要更多<strong>内存空间</strong>来存储指针，添加删除操作时，需要改变的<strong>指针数</strong>增加。</p>\n</li>\n</ol>\n<h3><a id=\"_32\"></a>数组</h3>\n<p>数据存储在连续的内存中。</p>\n<p>查询：可以直接通过数组下标直接查询。时间复杂度O（1）</p>\n<p>增加、删除：需要扩容或者缩小数组大小以及需要移动数据。时间复杂度O（n）</p>\n<p>集合ArrayList 底层用的是数组，LinkedList底层用的是链表。</p>\n<p>数组在查询方面效率较高，增加和删除效率较低。</p>\n<p>链表在查询方面效率较低，增加和删除效率较高。</p>\n<hr />\n<h3><a id=\"_48\"></a>栈</h3>\n<p>栈中数据呈线性排列，分栈顶，栈底。</p>\n<p>增加，删除数据只能从一端就行，取得最新数据。</p>\n<p>后进先出（Last In First Out,LIFO）想要访问中间数据，只能从栈顶出栈（pop），直到中间数据弹出，才能访问得到。相对应有入栈操作（push）。</p>\n<h3><a id=\"_56\"></a>队列</h3>\n<p>队列中数据呈线性排列，分队首，队尾。</p>\n<p>增加数据，从队尾添加。删除数据从队首。</p>\n<p>先进先出（First In First Out,FIFO）,想要访问中间数据，只能从队首依次出队，才能访问到。</p>\n<h3><a id=\"_68\"></a>哈希表</h3>\n<p>哈希表由数组+链表组成</p>\n<p>哈希数据用key，value表示。key 是数据的标识，value 是数据内容</p>\n<p>由哈希函数计算出哈希值，哈希值%（规定数组的大小）取mod，得到结果就是数据存储在数组上的位置，如果出现结果相同（哈希冲突），在所对应相同的位置上比较数据是否一样，如果不一样则在链表尾部插入新数据。</p>\n<p>哈希冲突解决的办法：</p>\n<p>链地址法（上述）</p>\n<p>开放地址法：不断通过哈希函数计算新的哈希值，取mod获得数组上的新索引。计算出一个候补地址（数组上的位置），看数组上对应位置上是否有数据，如果有，则再次重复此方法一直查找到候补地址是空地址为止。</p>\n<h3><a id=\"_84\"></a>堆</h3>\n<p>堆是一种图的树形结构，被用于实现“优先队列”（priority queues）。可以自由添加数据，删除数据时需要从最小的数值开始删除（根节点）。在堆的树形结构中，各个顶点被称为“节点”（node），数据就存储在这些节点中。</p>\n<p>堆：根节点数值不能比子节点大，左节点 &lt; 右节点。</p>\n<p>添加数据从树的最右边的右节点开始添加数据，交换规则按照堆结构规范。</p>\n<p>取数据的时间复杂度：O（1） 直接从树的顶端开始取</p>\n<p>重构树的时间复杂度：O（logn)  需要最低端开始向上换位置，跟树的高度成正比（log2n）</p>\n<p>添加数据的时间复杂度：O（logn) 需要最低端开始向上换位置，跟树的高度成正比（log2n）</p>\n<h3><a id=\"_100\"></a>二叉查找树</h3>\n<p>二叉查找树是一种树形结构。又称为二分搜索树和二叉排序树。</p>\n<p>数据存储在树的节点上。</p>\n<p>根节点 &gt; 左子树节点 &amp;&amp; 根节点 &lt;  右子树节点。</p>\n<p>查找数据：从顶端开始查找，大于根节点就向右子树节点查找。小于根节点就向左子树查找。依次类推，直到找到。</p>\n<p>添加数据：从顶端开始，数据大于根节点从左边开始寻找位置，找到位置后，添加节点即可。如果占用了树原来的节点，则考虑节点重新按照二叉查找树排序。</p>\n<p>删除数据：先通过查找数据找到需要删除的数据，确定需要删除的节点后。将其他节点重新按照二叉查找树排序。</p>\n<p>查找，添加，删除都依赖于移动节点。如果树节点比较均匀，则时间复杂度与树的高度呈正比。时间复杂度O（logn)，如果是从单一侧分布节点，则树会变得很高。则时间复杂度为O（n）</p>\n<h2><a id=\"_120\"></a>排序</h2>\n<h3><a id=\"_126\"></a>冒泡排序</h3>\n<p>冒泡排序通过分轮次不断比较相邻的俩个数依次找到较小（较大）的数字然后进行排序。</p>\n<p>例如：第一轮，会将最大值（最小值）排序后放到第一位</p>\n<p>第一轮：n-1次</p>\n<p>第二轮：n-2次</p>\n<p>第三轮：n-3次</p>\n<p>第n-1轮：1次</p>\n<p>时间复杂度=(n-1)+(n-2)+(n-3)…+1约等于n平方/2</p>\n<h3><a id=\"_144\"></a>选择排序</h3>\n<p>比较得出数字最小的放在第一位，然后比较剩余n-1位，得到最小的，放在第二位，然后比较剩余n-2为，得到最小的，放在第三位。以此类推。</p>\n<p>时间复杂度O（n平方）</p>\n<h3><a id=\"_152\"></a>插入排序</h3>\n<p>插入排序是通过左部的数比较右部的数，找到合适的位置，插入。</p>\n<p>设左边的数字为第一个数字，右边数字比较左部分数字，如果比它大就放在第一个数字右边，比它小就放在左边，以此类推。</p>\n<p>时间复杂度O（n平方）</p>\n<h3><a id=\"_162\"></a>堆排序</h3>\n<p>基于堆结构的排序，将数据放入堆中，从顶端开始取数据。时间复杂度O（nlogn）</p>\n<h3><a id=\"_168\"></a>归并排序</h3>\n<p>将数字拆分为多组。对半拆分到只剩下俩个数字。一组有俩个数字，俩组第一个数字相比较，较小的放在归并的第一个数字，然后再继续比较放置第二个，第三个位置。直到合并为一个整体。</p>\n<p>时间复杂度 O（nlogn)</p>\n<h3><a id=\"_176\"></a>快速排序法（递归分治）</h3>\n<ol>\n<li>随机寻找基准值，小于基准值的放在基准值右边，大于基准值的放在基准值左边。</li>\n<li>分为三大部分。</li>\n<li>小于基准值的部分看是不是只剩下一个数字，如果不是则再进行快速排序。大于基准值的部分也是如此。</li>\n</ol>\n<p>时间复杂度：</p>\n<ul>\n<li>随机的基准值每次都是最小值，则时间复杂度为O（n平方）</li>\n<li>随机的基准值都处于中间位置，则时间复杂度和堆排序的时间复杂一样O(nlogn)</li>\n</ul>\n<h2><a id=\"_189\"></a>数组的查找</h2>\n<h3><a id=\"_191\"></a>线性查找</h3>\n<p>查询数据中的一个数字，从第一个数字开始比较，如果相同则返回结果。如果不一致，则继续从下一个数字依次查找。</p>\n<p>时间复杂度O(n)</p>\n<h3><a id=\"_201\"></a>二分查找</h3>\n<p>二分查找前提：是排序好的数据</p>\n<p>选择数据中间位置进行比较，和需要查找的数据一致，则得到结果。</p>\n<p>如果比中间位置的数据小，则表明要查询的数字在数据的左边，比中间位置的数据大，则表明要查询的数字在数据的右边。例如查询的数字比中间数字要小，则在左边区域再确定中间位置，与之进行比较，重复前面的比较规则。</p>\n<h2><a id=\"_211\"></a>图</h2>\n<p>图由顶点（节点）和连接节点的线组成。线上带有数字，称为权。</p>\n<p>图分类：</p>\n<ul>\n<li>有向图</li>\n<li>无向图</li>\n<li>加权图</li>\n</ul>\n<p><strong>重点：</strong></p>\n<ul>\n<li>图的搜索：搜索图中的节点（广度优先搜索，深度优先搜索）</li>\n<li>图的最短路径：权重和最小的路径</li>\n</ul>\n<p>​</p>\n<h3><a id=\"_228\"></a>广度优先搜索</h3>\n<p>搜索的时候用到队列（FIFO）</p>\n<p>广度优先是广泛的搜索，目标顶点离起点越近，搜索结束得越快。</p>\n<p>没有闭合的图，可以称为是树。</p>\n<p>先从节点开始搜索，按照同一级，从左到右开始搜索。然后再进入下一级，继续从左到右开始搜索，以此类推。</p>\n<h3><a id=\"_238\"></a>深度优先搜索</h3>\n<p>搜索的时候用到栈（LIFO）</p>\n<p>深度优先是找到一条路径一直搜索下去，搜索不到再回头搜索另外得路线。</p>\n<p>深度优先是从最新的候选点搜。广度优先是从最早的候选节点搜索，离起点越近越早成为候补。</p>\n<h3><a id=\"_248\"></a>贝斯曼.福特算法</h3>\n<p>查理德.贝斯曼 和 莱斯特.福特是创始人</p>\n<p>寻找最短路径算法。</p>\n<p>将起始节点的权重设为0，其他所有的节点设置为无穷大。</p>\n<p>节点权重+边权重=路径权重</p>\n<p>路径权重小于下一个节点权重则替换原来无穷大的节点权重成路径权重。反之，不做任何处理。相当于最小路径的权重赋给了下一个节点。</p>\n<p>节点权重+ 边权重 <strong>&lt;</strong> 下一个节点权重，则替换。否则不做处理。边权重为负也可。</p>\n<p>所有节点最终权重都要符合上述要求。</p>\n<h3><a id=\"_266\"></a>狄克斯特拉算法</h3>\n<p>狄克斯特拉算法和贝斯曼福特算法一样都是求路径最短问题。</p>\n<p>狄克斯特拉：存在负值权重的时候，会出现错误。不能适用存有负值的图。</p>\n<p>贝斯曼福特算法：存在负值权重的时候，同样可以使用。</p>\n<p>狄克斯特拉算法：</p>\n<p>将所有节点初始权重全部设为无穷大，起始节点设为0。</p>\n<p>与第一个节点相连的节点作为候选节点。在候选节点中，优先选择（节点权重+线上权重）较小的节点。较小的权重可以替换原来下一个节点的权重。也同时计算，下一个节点的权重。</p>\n<p>核心点：在选择图搜索的路径时候，优先选择图中所有目前为止最小权重的节点，并且把此节点作为最短路径的节点，继续计算下一个节点权重。最终所有节点的权重陆陆续续计算出来，并且到达目的点，如果某一条路径的点到到达目的点的所有权重小于原来的目的点权重，则替换，否则不变</p>\n<h3><a id=\"A_288\"></a>A*算法</h3>\n<ol>\n<li>起始点权重、预估权重、终点权重</li>\n<li>标记终点权重	=	起始点权重 + 预估权重</li>\n<li>预估权重是预估值，是对到终点的距离的估值。</li>\n<li>将标记终点权重作为节点权重</li>\n<li>A*算法遵循节点权重小于相连的节点权重，即可将优先选择较小的节点进行搜索。</li>\n<li>预估权重越准确，则A*算法执行效果更佳。预估权重如果偏移量大，则会发生错误！</li>\n</ol>\n<h2><a id=\"_299\"></a>安全算法</h2>\n<h3><a id=\"_301\"></a>网络安全问题</h3>\n<ul>\n<li>窃听</li>\n<li>冒充</li>\n<li>篡改</li>\n<li>事后否认</li>\n</ul>\n<ol>\n<li>防止窃听 （加密）</li>\n<li>防止冒充（消息认证码，数字签名）</li>\n<li>防止篡改（消息认证码，数字签名）</li>\n<li>防止事后否认（数字签名）</li>\n</ol>\n<h3><a id=\"_317\"></a>加密，解密</h3>\n<p>加密：使用密钥对二进制的文件（数据）进行数值运算成第三者计算机无法理解的密文。</p>\n<p>解密：是将密文恢复成原来的二进制文件（数据）</p>\n<h3><a id=\"_325\"></a>哈希函数</h3>\n<p>将二进制文件转换成由0-9，a-f范围内的字符组成16进制16个字符的文件。</p>\n<p>​	<strong>哈希函数五大特征</strong></p>\n<ol>\n<li>不可逆。哈希函数计算出来的哈希值不可以逆向将哈希值变成原来的数据。</li>\n<li>同个数据使用哈希函数转换得到的哈希值必定相同</li>\n<li>稍有差异的数据使用哈希函数转换得到的哈希值差异很大</li>\n<li>不是同个数据使用哈希函数转换得到的哈希值可能一样（哈希冲突）</li>\n<li>长度不一样的数据使用哈希函数转换得到哈希值长度是都是一样，哈希值由16个字符组成</li>\n</ol>\n<p>哈希函数使用到的算法</p>\n<p>MD5 (Message Diggest Alogrithm)</p>\n<p>SHA-1(Secure Hash Alogrithm -1)</p>\n<p>SHA-2(Secure Hash Alogrithm -2)</p>\n<p>前两种算法都有一定隐患。</p>\n<h3><a id=\"_351\"></a>共享密钥加密（对称加密）</h3>\n<p>A用密钥加密数据，发送给B。B解密也用相同的密钥进行密文解密。</p>\n<p>发送，接收双方用的都是同个密钥。（对称加密）</p>\n<p>隐患：第三方窃听，获取到了密钥。安全性不足。</p>\n<h3><a id=\"_361\"></a>公开密钥，私有密钥（非对称加密）</h3>\n<p>B创建公开密钥（可发布在网上），私有密钥自己保存。</p>\n<p>B将公开密钥发送给A，A收到密钥后将数据用密钥计算得密文，再发送给B。</p>\n<p>B接收到密钥后，用私有密钥解密。</p>\n<p>加密解密用的不是同个密钥（非对称加密）</p>\n<p><strong>隐患：</strong></p>\n<p>恶意中间人创建密钥以及私有密钥，将公开密钥发送给A，A会用中间人的公开密钥加密数据，然后发送给B的时候，被中间人窃听，从A获取到密文后用私有密钥解密。B用公开密钥发送给A时，被中间人窃听，中间人篡改数据后用B发送的公开密钥加密，发给B，B获取密文后用私有密钥解密后的数据可能存有巨大的安全问题。</p>\n<h3><a id=\"_379\"></a>混合密钥加密</h3>\n<p>A向B发送数据：</p>\n<ol>\n<li>A生成共享密钥。B生成公开密钥和私有密钥</li>\n<li>B向A发送公开密钥，A将共享密钥用从B接收来的公有密钥加密，然后发送给B。</li>\n<li>B接收到A发送来的密文，用私有密钥解密，得到B的共享密钥。</li>\n<li>A向B发送A用共享密钥加密后的密文。</li>\n<li>B接收到A发送来的密文，用B的共享密钥解密即可。</li>\n</ol>\n<p>效果，速度得到提升，以及更加安全。</p>\n<p>SSL协议（Security Sockets  Layer）中用到了混合密钥算法</p>\n<p>后升级为TLS（Transport  Layer Security）传输层安全</p>\n<p>称为为：SSL/TLS协议</p>\n<h3><a id=\"_401\"></a>迪菲·赫尔曼密钥交换</h3>\n<p><strong>密钥合成原则：</strong></p>\n<ol>\n<li>密钥A和密钥B以及密钥C合成密钥ABC，密钥ABC不能分解成密钥A密钥B密钥C。</li>\n<li>密钥ABC合成顺序不同，但是密钥结果一样。密钥ABC和密钥ACB结果一致。</li>\n<li>合成后的密钥可以跟新的密钥再合成</li>\n</ol>\n<p><strong>过程：</strong></p>\n<ol>\n<li>A向B发送公有密钥p</li>\n<li>A生成私有密钥。</li>\n<li>B生成私有密钥。B接收A发送的公有密钥。</li>\n<li>A的公有密钥和私有合成密钥pA，B将接收到的公有密钥和私有密钥合成pB</li>\n<li>A将合成后的密钥(SPA)发送给B，B也将合成后的密钥(SPB)发送给A。</li>\n<li>A将SPA和SB合成为SPAB,B将SPB和SB合成为SPBA。</li>\n<li>SPAB 和 SPBA 是同个密钥。</li>\n</ol>\n<p><strong>原理：</strong></p>\n<p>引入素数P,P的原根G，次方X，次方Y</p>\n<p>P,G是公开密钥中的俩个元素。</p>\n<p>A，B生成自己的私有密钥（分别是X，Y）</p>\n<p>A,	B分别将私有密钥和公有密钥合成，（G的X次方 mod  P，G的Y次方 mod  P）</p>\n<p>A，B互相发送合成的密钥，G的X次方 mod  P，G的Y次方 mod  P</p>\n<p>A,	B再次合成对方发送来的密钥。（G的X次方 * G的Y次方） mod  P即为最终密钥</p>\n<p>根据素数 <em>P</em>、生成元 <em>G</em> 和“<em>G**X</em> mod <em>P</em>”求出 <em>X</em> 的问题就是“离散对数问题”，人们</p>\n<p>至今还未找到这个问题的解法，而迪菲 - 赫尔曼密钥交换正是利用了这个数学难题。</p>\n<p>使用迪菲 - 赫尔曼密钥交换，通信双方仅通过交换一些公开信息就可以实现密钥</p>\n<p>交换。但实际上，双方并没有交换密钥，而是生成了密钥。因此，该方法又被叫作“迪</p>\n<p>菲 - 赫尔曼密钥协议”。</p>\n<h3><a id=\"_453\"></a>消息认证码</h3>\n<p>防止A向B发送密文时，被中间人篡改，而B却不知。</p>\n<p>A向B发送密钥（用于制作消息认证码的密钥）</p>\n<p>A将密钥和密文计算得出的MAC（Message Authentication Code ）和密文一同发送给B。</p>\n<p>B接收到MAC后，通过先前获得的密钥与接收到密文计算得出MAC，看A发送来的MAC和B自己计算出来的MAC是否相同，相同则为被篡改，否则视为被篡改，再次向A发送请求。</p>\n<p>我们可以把MAC想象成是由密钥和密文组成的字符串的“哈希值”。计算MAC的算法有</p>\n<p>HMAC①、OMAC②、CMAC③等。目前，HMAC的应用最为广泛。</p>\n<h3><a id=\"_473\"></a>数字签名</h3>\n<p>数字签名确认发送方身份。</p>\n<p>A生成私有密钥，公开密钥，以及消息。</p>\n<p>A向B发送公开密钥。</p>\n<p>A用私有密钥加密消息成密文（数字签名）、以及消息发送给B。</p>\n<p>B用公开密钥解密密文。得到消息，看是否是A发送来的。</p>\n<p>常规情况，是把消息转换成哈希值，然后将哈希值加密，作为数字签名发送给B</p>\n<p>可以防止冒充的安全问题。</p>\n<h3><a id=\"_491\"></a>数字证书</h3>\n<p>数字签名中，签名可能会被X（中间人）篡改，不安全。</p>\n<p>数字证书，解决了这一问题。</p>\n<p>数字证书由各大型企业（可信任）签发。</p>\n<p>A向受信任的组织机构申请数字证书，机构向A发送具有邮箱等信息的数字证书（证明是A的证书）并且机构中存有A的公开密钥。</p>\n<p>A向B发送数字证书，证明是由A本身发送的。</p>\n<p>机构向B发送A的公开密钥，然后B用公开密钥解密数字证书，验证证书是不是真的来自于机构。</p>\n<p>数字证书签发者一般都是大型受信任的大型企业，小型不受信任的企业也想发展此业务，需要向受信任的大型企业取得信任，他们形成了一个树状结构，产生了根节点（大型受信任的企业）。根节点有根证书（root），需要有根证书授权。</p>\n<p>机构向B发送A的公开密钥时，X窃听获得公开密钥，存有隐患。</p>\n<p>其实机构向B发送A的公开密钥，这个公开密钥是以数字证书的形式交付的，会有更高级的认证中心对这个认证中心署名，确保了安全。</p>\n<p>​		到目前为止，我们了解的都是个人之间交付公开密钥的例子，其实在网站之间的通</p>\n<p>信中同样也要用到数字证书。只要能收到来自网站的含有公开密钥的证书，就能确认该</p>\n<p>网站未被第三者冒充。</p>\n<p>此处的证书叫作“服务器证书”，同样由认证中心发行。个人的证书会与他的邮箱</p>\n<p>信息相对应，而服务器证书与域名信息相对应。因此，我们还可以确认网站域名和存储</p>\n<p>网站本身内容的服务器是由同一个组织来管理的。</p>\n<p>数字证书就是像这样通过认证中心来担保公开密钥的制作者。这一系列技术规范被</p>\n<p>统称为“公钥基础设施”（Public Key Infrastructure，PKI）。</p>\n<h3><a id=\"_535\"></a>聚类</h3>\n<p>相似的聚集在一组，为簇。</p>\n<p>K-Means聚类算法</p>\n<p>随机排列的点，取三个中心点，点与中心点的距离最短的为一组。</p>\n<p>最后可分为3组。</p>\n<p>中心点的数量不同，组数就不同。</p>\n<p>中心的位置不同，组中位置就不同。</p>\n<h3><a id=\"_551\"></a>欧几里得算法（辗转相除法）</h3>\n<p>欧几里得算法求最大公约数</p>\n<p>求A、B最大公约数</p>\n<p>A	mod	B   =  X1</p>\n<p>B	mod	X2	=	X3</p>\n<p>X2 	mod	X3	=	X4</p>\n<p>X3	mod	X4	=	0</p>\n<p>则X4 为最大公约数</p>\n<p>除数，被除数，余数都存有倍数关系。（核心）</p>\n<h3><a id=\"_571\"></a>素性测试</h3>\n<p>素数在数字签名里面用的比较多。</p>\n<p>判断某个数是否为素数</p>\n<p>方法1：该数除以小于该数的平方根大于2的数。如果存有余数等于0，则为素数</p>\n<p>方法2：例如判断5是否为素数</p>\n<p>4的5次方	mod	5	=	4</p>\n<p>3的5次方	mod	5	=	3</p>\n<p>2的5次方	mod	5	=	2</p>\n<p>是否满足上列式子</p>\n<h3><a id=\"_591\"></a>网页搜索</h3>\n<p>网页搜索中，比较有价值的网页放在前面</p>\n<p>链状结构：看权重。上级权重是下级权重的和，下级权重是上级权重的平均值。</p>\n<p>环状结构：取概率（某一刻浏览该页面的概率）浏览该页面概率设为1-a,浏览其他页面设为a,浏览1000次，取得每个页面的概率。</p>\n<p>链状结构和环状结构都可以用概率方式搜索</p>\n<h3><a id=\"_603\"></a>汉诺塔</h3>\n<p>汉诺塔</p>\n<p>ABC三个地方。</p>\n<p>其中A存放着大小不一样的盘子，上面小，下面大，现将A处的盘子全部移动到C处。</p>\n<p>规则：一次性只能移动一个盘子，大的盘子在下面，小的盘子在上面</p>\n<p>假设只有一个盘子在A处，直接将A处盘子移到C处</p>\n<p>假设有俩个盘子在A处，先将上面的小盘子移动到B处，然后将A处的大盘子移动到C处，将B处的小盘子移动到C处。</p>\n<p>移动n个盘子，按照n-1个盘子的步骤移动。递归调用，最后回到只调用1个盘子。</p>\n<p>时间复杂度：盘子为一个的时候，时间为T（1）</p>\n<p>盘子为n时，需要将A处n-1个盘子移动到B，时间为：T（n-1）</p>\n<p>将A处最大的盘子移动到C处，时间为：T（1）</p>\n<p>将B处n-1个盘子移动到C处，时间为：T（n-1)</p>\n<p>总共时间为：2T（n-1) + 1</p>\n<p>T(n)=2的n次方-1</p>\n', 1634025473270898690);

-- ----------------------------
-- Table structure for dcx_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `dcx_article_tag`;
CREATE TABLE `dcx_article_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634025473270898692 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_article_tag
-- ----------------------------
INSERT INTO `dcx_article_tag` VALUES (1634018812250578946, 1634018812250578945, 5);
INSERT INTO `dcx_article_tag` VALUES (1634020500210475010, 1634020500210475009, 13);
INSERT INTO `dcx_article_tag` VALUES (1634020745891831810, 1634020745828917249, 13);
INSERT INTO `dcx_article_tag` VALUES (1634020960057188354, 1634020960057188353, 13);
INSERT INTO `dcx_article_tag` VALUES (1634022692501872642, 1634022692501872641, 6);
INSERT INTO `dcx_article_tag` VALUES (1634024179302948866, 1634024179302948865, 11);
INSERT INTO `dcx_article_tag` VALUES (1634024842548240386, 1634024842548240385, 9);
INSERT INTO `dcx_article_tag` VALUES (1634025473270898691, 1634025473270898690, 13);

-- ----------------------------
-- Table structure for dcx_category
-- ----------------------------
DROP TABLE IF EXISTS `dcx_category`;
CREATE TABLE `dcx_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_category
-- ----------------------------
INSERT INTO `dcx_category` VALUES (1, '/static/category/front.png', '前端', 'Vue...');
INSERT INTO `dcx_category` VALUES (2, '/static/category/java.png', '后端', 'Java,php,python');
INSERT INTO `dcx_category` VALUES (3, '/static/category/life.png', '程序人生', '思想');
INSERT INTO `dcx_category` VALUES (4, '/static/category/database.png', '关系型数据库', 'Mysql,Oracle,');
INSERT INTO `dcx_category` VALUES (5, '/static/category/nosql.png', '非关系型数据库', 'Redis,MongoDB');
INSERT INTO `dcx_category` VALUES (6, '/static/category/spring.png', '后端框架Spring', '从Spring到Alibaba');

-- ----------------------------
-- Table structure for dcx_comment
-- ----------------------------
DROP TABLE IF EXISTS `dcx_comment`;
CREATE TABLE `dcx_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `article_id` bigint(11) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `to_uid` bigint(20) NOT NULL,
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1625836153242411011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dcx_permission
-- ----------------------------
DROP TABLE IF EXISTS `dcx_permission`;
CREATE TABLE `dcx_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_permission
-- ----------------------------
INSERT INTO `dcx_permission` VALUES (7, '1213', '123', '123');
INSERT INTO `dcx_permission` VALUES (8, '删除权限', '', '删除权限');
INSERT INTO `dcx_permission` VALUES (9, '123', '159', '少时诵诗书');

-- ----------------------------
-- Table structure for dcx_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `dcx_sys_log`;
CREATE TABLE `dcx_sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` bigint(20) NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `module` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `operation` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `userid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcx_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `dcx_sys_user`;
CREATE TABLE `dcx_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `admin` bit(1) NULL DEFAULT NULL COMMENT '是否管理员',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_date` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `last_login` bigint(20) NULL DEFAULT NULL COMMENT '最后登录时间',
  `mobile_phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634017175196950530 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_sys_user
-- ----------------------------
INSERT INTO `dcx_sys_user` VALUES (1634017175196950529, 'dcx', b'1', '/static/img/user.png', 1678415027792, b'0', '', 1678415027792, NULL, '小清流吖', 'f053627d6fcb37f3b3e0aaa3ce7d30b6', '', '');

-- ----------------------------
-- Table structure for dcx_tag
-- ----------------------------
DROP TABLE IF EXISTS `dcx_tag`;
CREATE TABLE `dcx_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dcx_tag
-- ----------------------------
INSERT INTO `dcx_tag` VALUES (1, '/static/tag/html.png', 'HTML');
INSERT INTO `dcx_tag` VALUES (2, '/static/tag/css.png', 'CSS');
INSERT INTO `dcx_tag` VALUES (3, '/static/tag/js.png', 'JS');
INSERT INTO `dcx_tag` VALUES (4, '/static/tag/vue.png', 'Vue');
INSERT INTO `dcx_tag` VALUES (5, '/static/tag/spring.png', 'Spring');
INSERT INTO `dcx_tag` VALUES (6, '/static/tag/springmvc.png', 'SpringMVC');
INSERT INTO `dcx_tag` VALUES (7, '/static/tag/mybatis.png', 'Mybatis');
INSERT INTO `dcx_tag` VALUES (8, '/static/tag/mybatis-plus.png', 'Mybatis-plus');
INSERT INTO `dcx_tag` VALUES (9, '/static/tag/springboot.png', 'SpringBoot');
INSERT INTO `dcx_tag` VALUES (10, '/static/tag/redis.png', 'Redis');
INSERT INTO `dcx_tag` VALUES (11, '/static/tag/maven.png', 'Maven');
INSERT INTO `dcx_tag` VALUES (12, '/static/tag/database.png', 'MySQL');
INSERT INTO `dcx_tag` VALUES (13, '/static/tag/java.png', 'Java');

-- ----------------------------
-- Table structure for stu_permission
-- ----------------------------
DROP TABLE IF EXISTS `stu_permission`;
CREATE TABLE `stu_permission`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `stu_permission_id` int(11) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `teacher_permission_id` int(11) NULL DEFAULT NULL,
  `admin_permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_permission
-- ----------------------------
INSERT INTO `stu_permission` VALUES (1, 1, 10001, 1, 1);
INSERT INTO `stu_permission` VALUES (2, 0, 1154843, 0, 1);
INSERT INTO `stu_permission` VALUES (3, 0, 164456, 1, 0);

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
