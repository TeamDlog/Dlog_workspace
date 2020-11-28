package com.kh.dlog.mainmenu.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.diary.model.dao.DiaryDao;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired
	private DiaryDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return dDao.selectListCount(sqlSession);
	}
	

	@Override
	public ArrayList<Diary> selectList(PageInfo pi) {
		return dDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertDiary(Diary d) {
		return dDao.insertDiary(sqlSession, d);
	}

	@Override
	public Diary detailDiary(int dno) {
		return dDao.detailDiary(sqlSession, dno);
	}

	@Override
	public int updateDiary(Diary dn) {
		return dDao.updateDiary(sqlSession, dn);
	}

	@Override
	public int deleteDiary(int dno) {
		return dDao.deleteDiary(sqlSession, dno);
	}

	}
