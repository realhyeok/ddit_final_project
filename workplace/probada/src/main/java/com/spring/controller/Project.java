package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/project")
public class Project {

	
	
	@RequestMapping("/index")
	public String index() {
		String url ="/web-app/project/project";
		return url;
	}
	
	@RequestMapping("/list")
	public String list() {
		String url ="/web-app/project/project-list";
		return url;
	}
	
}
