package com.probada.totalSearch.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.probada.chat.vo.ChatVO;
import com.probada.project.service.ProjectService;
import com.probada.project.vo.ProjectVO;
import com.probada.totalSearch.service.SearchService;
import com.probada.totalSearch.vo.SearchProjVO;
import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;



@RestController
@RequestMapping("/search")
public class SearchController {

	private static final Logger LOGGER = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	UserService userService;
	

	@Autowired
	ProjectService projectService;
	
	@Autowired
	SearchService searchService;
	
	
	@RequestMapping("/result")
	public ModelAndView my_page(ModelAndView mnv, HttpSession session,String resultData) throws Exception{
		
		String url = "/web-app/Search/totalSearch";
		
		UserVO userVO= (UserVO)session.getAttribute("userVO");
		LOGGER.debug("test=> {}",resultData);
		
	 	UserVO user = new UserVO();
	 	
	 	
		mnv.addObject("user", userVO);
		mnv.addObject("resultData", resultData);
		mnv.setViewName(url);
	 	
	    return mnv;
	}
	
	
	@RequestMapping(value="/data", method= RequestMethod.POST)
	public ResponseEntity <List<String>> passwordCheck(HttpSession session) throws Exception{
		
		ResponseEntity<List<String>> entity = null;
		List<String> realTotal = new ArrayList<>();
		
		UserVO userVO= (UserVO)session.getAttribute("userVO");
		
		
		//모든 유저
		List<UserVO> user = new ArrayList<>();
	
		
		//모든 프로젝트 
		List<ProjectVO> project = new ArrayList<>();
		


		project = projectService.getProjectList();
		user = userService.getPriUser();
		
		realTotal = realTotalResult(project,user);

		
		entity =  new ResponseEntity <List<String>>(realTotal,HttpStatus.OK);

		
		return entity;
	}
	
	
	@RequestMapping("/readUser")
	@ResponseBody
	public ResponseEntity<List<UserVO>> getSearchUser(HttpSession session,String result) throws Exception {
		ResponseEntity<List<UserVO>> entity = null;

		LOGGER.debug("resut {}",result);
		LOGGER.debug("[요청받음] => /getSearchUser");
		UserVO userVO= (UserVO)session.getAttribute("userVO");
	 	
	 	List<UserVO> user = new ArrayList<>();
	 	
	 	user = searchService.getResultSearchUser(result);
	 

		try {

			LOGGER.debug("프로젝트 리스트, {}",user);

			entity = new ResponseEntity<List<UserVO>>(user,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<UserVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	
	@RequestMapping("/readProject")
	@ResponseBody
	public ResponseEntity<List<SearchProjVO>> getSearchProject(HttpSession session,String result) throws Exception {
		ResponseEntity<List<SearchProjVO>> entity = null;

		
		
		LOGGER.debug("resut {}",result);
		
		LOGGER.debug("[요청받음] => /getSearchProject");
		UserVO userVO= (UserVO)session.getAttribute("userVO");
	 	
	 	List<ProjectVO> project = new ArrayList<>();
	 	List<String> PL = new ArrayList<>();
	 	List<SearchProjVO> projVO = new ArrayList<>();
	 	
	 	project = searchService.getResultSearchProject(result);
	 	PL = searchService.getResultSearchPL(result);
	 	
	 	LOGGER.debug("project {}",project);
	 	LOGGER.debug("PL {}",PL);

	 	
	 	for (int i = 0; i < project.size(); i++) {
			
	 		SearchProjVO tempVO = new SearchProjVO();
	 		
	 		tempVO.setPlId(PL.get(i));
	 		tempVO.setPrivacy(project.get(i).getPrivacy());
	 		tempVO.setTitle(project.get(i).getTitle());
	 		tempVO.setProjNo(project.get(i).getProjNo());
	 		
	 		projVO.add(tempVO);
	 		
		}
	 	
	
	 	
		try {

			LOGGER.debug("2523001 projVO, {}",projVO);

			entity = new ResponseEntity<List<SearchProjVO>>(projVO,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<SearchProjVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<String> realTotalResult(List<ProjectVO> project, List<UserVO> user){
		
		HashSet<String> temp = new HashSet<String>();
		
		
		List<String> userName = new ArrayList<>();
		List<String> projectName = new ArrayList<>();
		List<String> total = new ArrayList<>();
		List<String> realTotal = new ArrayList<>();
		
		for (ProjectVO pv : project) {
			projectName.add(pv.getTitle());
		}

		for (UserVO uv : user) {
			userName.add(uv.getNickname());
		}
		
		
		
		total.addAll(userName);
		total.addAll(projectName);
		
		for (String string : total) {
			
			temp.add(string);
			
		}
		
		
		LOGGER.debug("temp=>{}",temp);
		realTotal = new ArrayList<String>(temp);
		
		return realTotal;
		
	}
	
	
	
	
	
	
	
}



	
	
	
	
	
	
	