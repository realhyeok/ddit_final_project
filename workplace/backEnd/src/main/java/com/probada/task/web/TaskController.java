package com.probada.task.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.task.service.TaskService;
import com.probada.task.vo.TaskVO;
import com.probada.user.vo.UserVO;
import com.probada.util.ProjectUtil;

@Controller
@RequestMapping("/app/task")
public class TaskController {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);

	@Resource(name = "taskService")
	TaskService taskService;
	@Resource(name = "projectUtil")
	ProjectUtil projectUtil;


	@RequestMapping("/getTaskListByProjNo")
	@ResponseBody
	public ResponseEntity<List<TaskVO>> getTaskListByProjNo(@RequestParam(defaultValue = "") String projNo)
			throws Exception {
		ResponseEntity<List<TaskVO>> entity = null;

		LOGGER.debug("[요청받음] => /getTaskListByProjNo");

		List<TaskVO> taskVOList = new ArrayList<TaskVO>();

		try {

			taskVOList = taskService.getTaskListByProjectNo(projNo);

			for (TaskVO taskVO : taskVOList) {
				String projTitle = projectUtil.getProjectNameByProjNo(projNo);
				taskVO.setProjTitle(projTitle);
			}

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

		LOGGER.debug("[요청받음] => /getTaskListForGanttByProjNo");

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



	@RequestMapping("/getTaskRegistInfoByProjNo")
	@ResponseBody
	public ResponseEntity<TaskVO> getTaskRegistInfo(String projNo) throws Exception {
		ResponseEntity<TaskVO> entity = null;

		TaskVO taskRegistVO = new TaskVO();
		try {

			String projTitle = projectUtil.getProjectNameByProjNo(projNo);
			List<UserVO> userList = projectUtil.getProjectMemberByProjNo(projNo);
			taskRegistVO.setProjTitle(projTitle);
			taskRegistVO.setUserList(userList);

			entity = new ResponseEntity<TaskVO>(taskRegistVO, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<TaskVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}


	@RequestMapping("/getTaskDetailByTaskNo")
	@ResponseBody
	public ResponseEntity<TaskVO> getTaskDetailByTaskNo(TaskVO taskVO)
			throws Exception {
		ResponseEntity<TaskVO> entity = null;

		TaskVO detailVO = new TaskVO();
		try {

			detailVO = taskService.getTaskDetailByTaskNo(taskVO);
			String projTitle = projectUtil.getProjectNameByProjNo(taskVO.getProjNo());
			List<UserVO> userList = projectUtil.getProjectMemberByProjNo(taskVO.getProjNo());
			detailVO.setProjTitle(projTitle);
			detailVO.setUserList(userList);

			entity = new ResponseEntity<TaskVO>(detailVO, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<TaskVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping("/modifyTaskDetailByTaskNo")
	@ResponseBody
	public ResponseEntity<TaskVO> modifyTaskDetailByTaskNo(TaskVO taskVO)
			throws Exception {
		ResponseEntity<TaskVO> entity = null;

		LOGGER.debug("[요청받음] => /modifyTaskDetailByTaskNo");

		TaskVO resultVO = new TaskVO();

		try {

			taskService.modifyTaskDetailByTaskNo(taskVO);

			entity = new ResponseEntity<TaskVO>(taskVO,HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<TaskVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping("/registTask")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> registTask(TaskVO taskVO) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;

		LOGGER.debug("[요청받음] => /registTask");

		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		try {

			String taskNo = taskService.registTask(taskVO);

			hashMap.put("taskNo", taskNo);

			entity = new ResponseEntity<HashMap<String, Object>>(hashMap,HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
}
