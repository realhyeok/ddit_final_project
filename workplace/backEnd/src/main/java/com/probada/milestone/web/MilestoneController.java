package com.probada.milestone.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.milestone.service.MilestoneService;
import com.probada.milestone.vo.MilestoneVO;

@Controller
@RequestMapping("/app/milestone")
public class MilestoneController {

	@Resource(name="milestoneService")
	MilestoneService milestoneService;

	@RequestMapping("/getMilestoneListByProjNo")
	@ResponseBody
	public ResponseEntity<List<MilestoneVO>> getProjectList(@RequestParam(defaultValue="") String projNo) throws Exception {
		ResponseEntity<List<MilestoneVO>> entity = null;

		List<MilestoneVO> milestoneList = new ArrayList<MilestoneVO>();

		try {

			milestoneList = milestoneService.getMilestoneListByProjNo(projNo);

			entity = new ResponseEntity<List<MilestoneVO>>(milestoneList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<MilestoneVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

}
