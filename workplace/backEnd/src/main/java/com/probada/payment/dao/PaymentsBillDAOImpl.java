package com.probada.payment.dao;

import java.sql.SQLException;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.probada.payment.vo.PaymentsBillVO;

public class PaymentsBillDAOImpl implements PaymentsBillDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void init_free(PaymentsBillVO paymentsBillVO) throws SQLException {
		sqlSession.insert("PaymentsBill-Mapper.init_free", paymentsBillVO);
	}

	@Override
	public Date getEndDate(String userId) throws SQLException {
		return sqlSession.selectOne("PaymentsBill-Mapper.getEndDate", userId);
	}

	@Override
	public String getPlanNo(String userId) throws SQLException {
		return sqlSession.selectOne("PaymentsBill-Mapper.getPlanNo", userId);
	}

	@Override
	public int getMaxUploadCapacity(String planNo) throws SQLException {
		return sqlSession.selectOne("PaymentsBill-Mapper.getMaxUploadCapacity", planNo);
	}
	

}
