package com.probada.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.probada.collabo.service.CollaboService;
import com.probada.collabo.vo.CollaboVO;
import com.probada.user.vo.UserVO;

public class CollaboUtil {
	@Resource(name="collaboService")
	CollaboService collaboService;
	
	
	
	/**
	 * 콜라보 프로젝트 관계성 추가 메서드
	 * @param session
	 * @param collaboVO
	 * @throws Exception
	 */
	public void setCollaboUserRelation(HttpSession session, CollaboVO collaboVO)throws Exception{
		
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String userId = userVO.getUserId();
		
		collaboVO.setUserId(userId);
		collaboVO.setRole("A303");
		
		collaboService.registProjectUserRelation(collaboVO);
	}
	
	
}
