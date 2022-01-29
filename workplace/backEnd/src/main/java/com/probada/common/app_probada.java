package com.probada.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class app_probada {
	
	@RequestMapping("/index")
	public String main() {
		String url = "/web-app/common/app-index";
		return url;
	}
	@RequestMapping("/project-list")
	public String project() {
		String url = "/web-app/project/project-list";
		return url;
	}
	
	@RequestMapping("/collabo-none")
	public String collaboNone() {
		String url = "/web-app/collabo/collabo-none";
		return url;
	}

	@RequestMapping("/collabo-list")
	public String collabo() {
		String url = "/web-app/collabo/collabo-list";
		return url;
	}
	
	@RequestMapping("/myWork")
	public String myWork() {
		String url = "/web-app/myWork/myWork";
		return url;
	}
	
	@RequestMapping("/test")
	public String home() {
		String url = "/web-app/common/plain_page";
		return url;
	}
	

	
	@RequestMapping("/pricing")
	public String pricing() {
		String url = "/web-app/common/pricing";
		return url;
	}
	
	
}
