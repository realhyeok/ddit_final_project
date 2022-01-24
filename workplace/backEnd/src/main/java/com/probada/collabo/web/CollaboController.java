package com.probada.collabo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/collabo")
public class CollaboController {

	@RequestMapping("/main")
	public String index() {
		String url ="/web-app/collabo/collabo";
		return url;
	}
	
}
