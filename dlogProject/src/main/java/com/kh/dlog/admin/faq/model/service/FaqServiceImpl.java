package com.kh.dlog.admin.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.admin.faq.model.dao.FaqDao;
import com.kh.dlog.admin.faq.model.vo.Faq;
import com.kh.dlog.common.model.vo.PageInfo;

@Service 
public class FaqServiceImpl implements FaqService{
	
	@Autowired 
	private FaqDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		 return fDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectList(PageInfo pi) {
		return fDao.selectList(sqlSession, pi);
	}
	@Override
	public ArrayList<Faq> serviceMain() {
		return fDao.serviceMain(sqlSession);
	}
	
	@Override
	public int increaseCount(int bno) {
		return fDao.increaseCount(sqlSession, bno);
	}
	@Override
	public Faq selectFaq(int bno) {
		return fDao.selectFaq(sqlSession, bno);
	}
	@Override
	public int searchListCount(String condition, String keyword) {
		 return fDao.searchListCount(sqlSession,condition, keyword);
	}
	
	@Override
	public ArrayList<Faq> searchList(PageInfo pi,String condition, String keyword) {
		return fDao.searchList(sqlSession, pi, condition, keyword);
	}
	
	@Override
	public int deleteFaq(String[] arr) {
		return fDao.deleteFaq(sqlSession, arr);
	}
	
	@Override
	public int insertFaq(Faq f) {
		return fDao.insertFaq(sqlSession, f);
	}
}
