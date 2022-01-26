package com.probada.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class ChatController {

	    @GetMapping("/chat")
	    public String chat() {
	    	
	    	String url = "/web-app/document/chat";
	    	
	        return url;
	    }
	}
	
	
	
	
	
	
	
	
	
	
