package com.dcx.blog.common.aop;

import java.lang.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/8 20:22
 * @description：
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogAnnotation {
    String module() default "";

    String operator() default "";
}
