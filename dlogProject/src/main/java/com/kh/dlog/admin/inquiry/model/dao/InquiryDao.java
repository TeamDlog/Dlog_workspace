package com.kh.dlog.admin.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.admin.inquiry.model.vo.Inquiry;
import com.kh.dlog.common.model.vo.PageInfo;

@Repository
public class InquiryDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inquiryMapper.selectListCount");
	}
	
	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", null, rowBounds);
	}
	
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", bno);
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.insert("inquiryMapper.insertInquiry", i);
	}
	
	public int insertInquiryAnswer(SqlSessionTemplate sqlSession,Inquiry i) {
		return sqlSession.insert("inquiryMapper.insertInquiryAnswer", i);
	}
	
	public int updateInquiryProcess(SqlSessionTemplate sqlSession,Inquiry i) {
		return sqlSession.insert("inquiryMapper.updateInquiryProcess", i);
	}
}
