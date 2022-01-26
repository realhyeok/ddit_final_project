package com.probada.payment.service;

import java.sql.SQLException;
import java.util.Date;

import com.probada.payment.dao.PaymentsBillDAO;
import com.probada.payment.vo.PaymentsBillVO;

public class PaymentsBillServiceImpl implements PaymentsBillService{
	
	private PaymentsBillDAO paymentsBillDAO;
	
	public void setPaymentsBillDAO(PaymentsBillDAO paymentsBillDAO) {
		this.paymentsBillDAO = paymentsBillDAO;
	}

	@Override
	public void init_free(PaymentsBillVO paymentsBillVO) throws SQLException {
		paymentsBillDAO.init_free(paymentsBillVO);
	}

	@Override
	public Date getEndDate(String userId) throws SQLException {
		return paymentsBillDAO.getEndDate(userId);
	}

	@Override
	public String getPlanNo(String userId) throws SQLException {
		return paymentsBillDAO.getPlanNo(userId);
	}

	@Override
	public int getMaxUploadCapacity(String planNo) throws SQLException {
		return paymentsBillDAO.getMaxUploadCapacity(planNo);
	}

}
