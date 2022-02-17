package com.probada.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.probada.collabo.service.CollaboService;
import com.probada.collabo.vo.CollaboTaskVO;
import com.probada.collabo.vo.CollaboVO;
import com.probada.project.web.ProjectController;
import com.probada.task.vo.TaskVO;
import com.probada.user.vo.UserVO;

public class CollaboUtil {
	@Resource(name="collaboService")
	CollaboService collaboService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CollaboUtil.class);
	
	/**
	 * 콜라보 프로젝트 관계성 추가 메서드
	 * @param session
	 * @param collaboVO
	 * @throws Exception
	 */
	public void setCollaboUserRelation(CollaboVO collaboVO, String cprojNo, HttpServletRequest request)throws Exception{
		
		LOGGER.debug("[요청받음] /setCollaboUserRelation => " + collaboVO);

		CollaboVO userTo = new CollaboVO();
		CollaboVO userFrom = new CollaboVO();
		
		userTo.setUserId(collaboVO.getUserTo());
		userTo.setProjNo(collaboVO.getUserFromProjNo());
		userTo.setCprojNo(cprojNo);
		LOGGER.debug("userTo ================> " + userTo.toString());
		collaboService.registProjectUserRelation(userTo);
		
		userFrom.setUserId(collaboVO.getUserFrom());
		userFrom.setProjNo(collaboVO.getUserToProjNo());
		userFrom.setCprojNo(cprojNo);
		LOGGER.debug("userTo ================> " + userFrom);
		collaboService.registProjectUserRelation(userFrom);
		
	}
	
	
	/**
	 * 콜라보 번호로 콜라보 이름 조회
	 * @param cprojNo
	 * @return
	 * @throws SQLException
	 */
	public String getCollaboNameByCprojNo(String cprojNo)throws SQLException{
		String title = "";
		
		try {
			title = collaboService.getCprojectNameByCprojNo(cprojNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return title;
	}
	
	
	/**
	 * 콜라보 프로젝트 번호로 해당 멤버 조회
	 * @param projNo
	 * @return
	 * @throws SQLException
	 */
	public List<UserVO> getProjectMemberByCrojNo(String cprojNo) throws SQLException{
		
		List<UserVO> memberList = new ArrayList<UserVO>();
		
		try {
			memberList = collaboService.getUserByCProjNo(cprojNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return memberList;
		
	}
	
public CollaboTaskVO getSessionId(HttpServletRequest request,CollaboTaskVO collaboTaskVO) throws SQLException {
		
		try {

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");
			String sessionId = userVO.getNickname();
			collaboTaskVO.setSessionId(sessionId);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}

		return collaboTaskVO;
	}
	
	
}
