package com.probada.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class index_probada {

	@RequestMapping("/index")
	public String index() {
		String url ="/web-index/common/home-page-index";
		return url;
	}
	
	@RequestMapping("/sign-in")
	public String login() {
		String url ="/web-index/common/sign-in";
		return url;
	}
	
	@RequestMapping("/sign-up")
	public String login_verify() {
		String url ="/web-index/common/sign-up";
		return url;
	}

	
}
