package com.probada.payment.dao;

import java.sql.SQLException;
import java.util.Date;
import com.probada.payment.vo.PaymentsBillVO;

public interface PaymentsBillDAO {

	/**
	 * paymentsBillVO를 초기화한다.
	 * @param paymentsBillVO
	 * @throws SQLException
	 */
	public void init_free(PaymentsBillVO paymentsBillVO) throws SQLException;
	
	/**
	 * ENDDATE 기간이 만료되었는지 확인하는 function
	 * @param String
	 * @return
	 * @throws SQLException
	 */
	public Date getEndDate(String userId) throws SQLException;
	
	/**
	 * 유저 아이디를 통해 PAYMENTS_BILL의 PLAN_NO를 리턴한다.
	 * @param userId
	 * @return PAYMENTS_BILL테이블에 속한 해당 유저의 PLAN_NO
	 * @throws SQLException
	 */
	public String getPlanNo(String userId) throws SQLException;
	
	/**
	 * getPlanNo에서 가져온 PLAN_NO에 해당하는 MAX_UPLOAD_CAPACITY를 리턴한다.
	 * @param planNo
	 * @return PLAN_NO에 해당하는 MAX_UPLOAD_CAPACITY를 리턴한다.
	 * @throws SQLException
	 */
	public int getMaxUploadCapacity(String planNo)throws SQLException;
}
