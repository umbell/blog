package com.dcx.blog.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 9:16
 * @description：
 */
@Configuration
@EnableAsync
public class ThreadPoolConfig {
    @Bean("taskExecutor")
    public Executor asyncServiceExecutor(){
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        //核心线程数
        executor.setCorePoolSize(5);
        //最大线程数
        executor.setMaxPoolSize(20);
        //救急线程活跃时间
        executor.setKeepAliveSeconds(60);
        //线程队列大小
        executor.setQueueCapacity(Integer.MAX_VALUE);
        //线程名字
        executor.setThreadNamePrefix("dcxBlogProject");
        //线程池在完成任务后关闭
        executor.setWaitForTasksToCompleteOnShutdown(true);
        //执行初始化
        executor.initialize();
        return executor;

    }

}
