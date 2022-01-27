package com.probada.chat.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/")
	   public String chat() {
	    	
	    	String url = "/web-app/chat/chat";
	    	
	        return url;
	    }
	}
	
	
	
	
	
	
	
	
	
	
