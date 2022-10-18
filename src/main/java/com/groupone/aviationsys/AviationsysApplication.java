package com.groupone.aviationsys;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.groupone.aviationsys.api.mapper")
public class AviationsysApplication {

    public static void main(String[] args) {
        SpringApplication.run(AviationsysApplication.class, args);
    }

}
