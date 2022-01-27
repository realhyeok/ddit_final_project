package com.probada.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.probada.project.service.ProjectService;
import com.probada.project.service.ProjectTagService;
import com.probada.project.vo.ProjectTagVO;
import com.probada.project.vo.ProjectVO;
import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;

public class ProjectUtil {

	@Resource(name="projectService")
	ProjectService projectService;
	@Resource(name="projectTagService")
	ProjectTagService projectTagService;
	@Resource(name="userService")
	UserService userService;
	@Resource(name="taskUtil")
	TaskUtil taskUtil;

	public List<UserVO> getProjectCountUtil(List<UserVO> userList) throws SQLException {

		try {

			for (UserVO userVO : userList) {
				int projectCount = projectService.getProjectCountInProjByUserId(userVO.getUserId());
				userVO.setProjectCount(projectCount);
			}

		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}

		return userList;
	}

	public List<ProjectVO> getProjectTagList(List<ProjectVO> projectList) throws SQLException{

		List<String> tagList = new ArrayList<String>();

		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return projectList;
	}

	public ProjectVO getProjectTagListByProjNo(String projNo, ProjectVO projectVO) throws SQLException{

		List<ProjectTagVO> projectTagList = new ArrayList<ProjectTagVO>();
		List<String> tagList = new ArrayList<String>();
		try {
			projectTagList = projectTagService.getTagNameList(projNo);
			if(projectTagList != null) {
				for (ProjectTagVO projectTagVO : projectTagList) {
					tagList.add(projectTagVO.getTagName());
				}

				projectVO.setTagNames(tagList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return projectVO;
	}

	public List<ProjectVO> getProjectMemberList(List<ProjectVO> projectList) throws SQLException{

		List<UserVO> userList = new ArrayList<UserVO>();
		try {

			for (ProjectVO projectVO : projectList) {
				userList = userService.getUserByProjNo(projectVO.getProjNo());
				if(userList != null) {
					userList = getProjectCountUtil(userList);
					userList = taskUtil.getTaskCountUtil(userList);
					projectVO.setMember(userList);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return projectList;
	}
}
