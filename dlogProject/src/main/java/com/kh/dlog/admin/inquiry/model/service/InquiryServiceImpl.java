package com.kh.dlog.admin.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.admin.inquiry.model.dao.InquiryDao;
import com.kh.dlog.admin.inquiry.model.vo.Inquiry;
import com.kh.dlog.common.model.vo.PageInfo;


@Service 
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired // new라는 객체생성없이 만들수 있는 어노테이션
	private InquiryDao iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertInquiry(Inquiry i) {
		return iDao.insertInquiry(sqlSession, i);
	}
	@Override
	public int insertInquiryAnswer(Inquiry i) {
		return iDao.insertInquiryAnswer(sqlSession, i);
	}
	
	@Override
	public int updateInquiryProcess(Inquiry i) {
		return iDao.updateInquiryProcess(sqlSession, i);
	}
	
	@Override
	public int selectListCount() {
		 return iDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Inquiry> selectList() {
		return iDao.selectList(sqlSession);
	}

	@Override
	public Inquiry selectInquiry(int bno) {
		return iDao.selectInquiry(sqlSession, bno);
	}
	
	
}
