package com.dcx.blog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 12:58
 * @description：
 */

@SpringBootApplication
//@MapperScan("com.dcx.blog.dao.mapper")
public class BlogApp {
    public static void main(String[] args) {
        SpringApplication.run(BlogApp.class,args);
    }
}
