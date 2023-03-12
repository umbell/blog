package com.dcx.blog.common.cache;

import java.lang.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/10 20:53
 * @description：
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Cache {

    long expire() default 1 * 60 * 1000;

    String name() default "";

}
