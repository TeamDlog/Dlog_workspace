package com.kh.dlog.mypage.controlAll.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.mypage.controlAll.model.Dao.ControlAllDao;
import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;

@Service
public class ControlAllServiceImpl implements ControlAllService{

	@Autowired
	private ControlAllDao caDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ControlAll ControlAllMain(String memberNo) {
		// TODO Auto-generated method stub
		return caDao.ControlAllMain(sqlSession, memberNo);
	}
	
	public int ActiveWidget(ControlAll ca) {
		return caDao.ActiveWidget(sqlSession, ca);
	}
	
	public int PrivacyWidget(ControlAll ca) {
		return caDao.PrivacyWidget(sqlSession, ca);
	}

	@Override
	public int myColor(ControlAll ca) {
		// TODO Auto-generated method stub
		return caDao.myColor(sqlSession, ca);
	}

	@Override
	public int resetMyColor(String memberNo) {
		// TODO Auto-generated method stub
		return caDao.resetMyColor(sqlSession, memberNo);
	}
	
	
}
