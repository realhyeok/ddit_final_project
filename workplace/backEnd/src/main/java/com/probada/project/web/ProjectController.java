package com.probada.project.web;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.probada.project.service.ProjectService;
import com.probada.project.service.ProjectTagService;
import com.probada.project.vo.ProjectTagVO;
import com.probada.project.vo.ProjectVO;

@Controller
@RequestMapping("/app/project")
public class ProjectController {

	@Resource(name="projectService")
	ProjectService projectService;
	@Resource(name="projectTagService")
	ProjectTagService projectTagService;

	private static final Logger LOGGER = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping("/main")
	public ModelAndView main(@RequestParam(defaultValue="") String tab, ModelAndView mnv) {
		String url = "/web-app/project/project";
		mnv.addObject("tab",tab);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/getProjectList")
	@ResponseBody
	public ResponseEntity<List<ProjectVO>> getProjectList() throws Exception {
		ResponseEntity<List<ProjectVO>> entity = null;

		LOGGER.debug("[요청받음] => /getProjectList");

		List<ProjectVO> projectList = new ArrayList<ProjectVO>();
		List<String> tagList = new ArrayList<String>();
		try {

			projectList = projectService.getProjectList();

			for (ProjectVO projectVO : projectList) {
				List<ProjectTagVO> projectTagList = projectTagService.getTagNameList(projectVO.getProjNo());

				for (ProjectTagVO projectTagVO : projectTagList) {
					if(projectTagVO.getProjNo().equals(projectVO.getProjNo())) {
						tagList.add(projectTagVO.getTagName());
					}
				}
				projectVO.setTagNames(tagList);
				tagList = new ArrayList<String>();
			}

			entity = new ResponseEntity<List<ProjectVO>>(projectList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<ProjectVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping("/getProjectByProjNo")
	@ResponseBody
	public ResponseEntity<ProjectVO> getProjectByProjNo(@RequestParam(defaultValue="") String projNo) throws Exception {
		ResponseEntity<ProjectVO> entity = null;

		ProjectVO projectVO = new ProjectVO();
		List<ProjectTagVO> projectTagList = new ArrayList<ProjectTagVO>();
		List<String> tagList = new ArrayList<String>();
		try {

			projectVO = projectService.getProjectByProjNo(projNo);
			projectTagList = projectTagService.getTagNameList(projNo);
			if(projectTagList != null) {
				for (ProjectTagVO projectTagVO : projectTagList) {
					tagList.add(projectTagVO.getTagName());
				}

				projectVO.setTagNames(tagList);
			}

			entity = new ResponseEntity<ProjectVO>(projectVO,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<ProjectVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping(value = "/modifyProjectDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> modifyProjectDetail(ProjectVO projectVO) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;

		try {

			projectService.modifyProjectDetail(projectVO);

			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping(value = "/registProject", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> registProject(ProjectVO projectVO) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;

		HashMap<String,Object> hashmap = new HashMap<String,Object>();

		try {

			String projNo = projectService.registProject(projectVO);

			hashmap.put("projNo", projNo);

			entity = new ResponseEntity<HashMap<String, Object>>(hashmap,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}


	@RequestMapping(value = "/modifyProjectNotice", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> modifyProjectNotice(ProjectVO projectVO) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;

		try {

			projectService.modifyProjectNotice(projectVO);

			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

/*
	@RequestMapping("/getProjectDashCard")
	@ResponseBody
	public ResponseEntity<List<Map<String,Integer>>> getProjectDashCard() throws Exception {
		ResponseEntity<List<Map<String,Integer>>> entity = null;

		return entity;
	}*/
}
