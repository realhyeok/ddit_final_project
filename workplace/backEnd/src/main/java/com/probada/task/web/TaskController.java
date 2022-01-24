package com.probada.task.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.project.vo.ProjectVO;
import com.probada.task.service.TaskService;
import com.probada.task.vo.TaskVO;

@Controller
@RequestMapping("/app/task")
public class TaskController {

	@Resource(name = "taskService")
	TaskService taskService;

	@RequestMapping("/getTaskListByProjNo")
	@ResponseBody
	public ResponseEntity<List<TaskVO>> getTaskListByProjNo(@RequestParam(defaultValue = "") String projNo)
			throws Exception {
		ResponseEntity<List<TaskVO>> entity = null;

		System.out.println("/getTaskListByProjNo 요청받음!!!");
		List<TaskVO> taskVOList = new ArrayList<TaskVO>();

		try {
			taskVOList = taskService.getTaskListByProjectNo(projNo);

			entity = new ResponseEntity<List<TaskVO>>(taskVOList, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<List<TaskVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping("/getTaskListForGanttByProjNo")
	@ResponseBody
	public ResponseEntity<List<TaskVO>> getTaskListForGanttByProjNo(@RequestParam(defaultValue = "") String projNo)
			throws Exception {
		ResponseEntity<List<TaskVO>> entity = null;

		System.out.println("/getTaskListForGanttByProjNo 요청받음!!!");
		List<TaskVO> taskVOList = new ArrayList<TaskVO>();

		try {
			taskVOList = taskService.getTaskListByProjectNo(projNo);

			entity = new ResponseEntity<List<TaskVO>>(taskVOList, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<List<TaskVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
}
