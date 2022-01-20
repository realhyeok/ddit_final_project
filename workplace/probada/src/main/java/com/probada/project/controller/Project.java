package com.probada.project.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.probada.project.service.ProjectService;
import com.probada.project.vo.ProjectVO;

@Controller
@RequestMapping("/app/project")
public class Project {

	@RequestMapping("/main")
	public ModelAndView main(@RequestParam(defaultValue="") String tab, ModelAndView mnv) {
		String url = "/web-app/project/project";
		mnv.addObject("tab",tab);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/taskRegistForm")
	public String taskRegistForm() throws Exception {
		String url = "/web-app/project/project-task-regist";
		
		return url;
	}
	
	@RequestMapping("/taskModifyForm")
	public String taskModifyForm() throws Exception {
		String url = "/web-app/project/project-task-modify";
		
		return url;
	}
	
	@RequestMapping("/taskDetail")
	public String taskDetail() throws Exception {
		String url = "/web-app/project/project-task-detail";
		
		return url;
	}	

}
