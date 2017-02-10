package com.yafeichen;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.core.env.SimpleCommandLinePropertySource;
import org.springframework.jms.annotation.EnableJms;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import java.util.Arrays;


@Slf4j
@EnableJms
@SpringBootApplication
public class Application {

    @Resource
    private Environment environment;

    /**
     * 检查入参，如果不满足条件，阻止启动
     *
     * @param args
     */
    private static void checkCommandArgs(String[] args) {

        //获取请求参数，转换为properties
        SimpleCommandLinePropertySource commandLineArgs = new SimpleCommandLinePropertySource(args);

        log.info("启动参数：{}", Arrays.toString(commandLineArgs.getPropertyNames()));
    }

    public static void main(String[] args) {
        checkCommandArgs(args);
        SpringApplication application = new SpringApplication(Application.class);
        application.run(Application.class, args);
    }

    @PostConstruct
    public void initApplication() {
        log.info("默认环境参数：{}", Arrays.toString(environment.getDefaultProfiles()));
    }

    @PreDestroy
    public void destroyApplication() {
        log.info("应用关闭中...");
    }
}
