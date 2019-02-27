package com.tqy.cams;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@MapperScan("com.tqy.cams.dao")
@ServletComponentScan("com.tqy.cams.filter")
public class ClientApplication{
	
	public static void main(String[] args) {
		SpringApplication.run(ClientApplication.class, args);
	}

}
