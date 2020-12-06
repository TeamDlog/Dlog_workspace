package com.kh.dlog.admin.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.admin.notice.model.dao.NoticeDao;
import com.kh.dlog.admin.notice.model.vo.Notice;
import com.kh.dlog.common.model.vo.PageInfo;

@Service 
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired 
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		 return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList() {
		return nDao.selectList(sqlSession);
	}

	@Override
	public Notice selectNotice(int bno) {
		return nDao.selectNotice(sqlSession, bno);
	}
	@Override
	public int searchListCount(String condition, String keyword) {
		 return nDao.searchListCount(sqlSession,condition, keyword);
	}
	
	@Override
	public ArrayList<Notice> searchList(PageInfo pi,String condition, String keyword) {
		return nDao.searchList(sqlSession, pi, condition, keyword);
	}
	
	@Override
	public int deleteNotice(String[] arr) {
		return nDao.deleteNotice(sqlSession, arr);
	}
	
	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}
}
