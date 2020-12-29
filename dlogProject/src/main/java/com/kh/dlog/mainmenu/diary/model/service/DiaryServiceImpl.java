package com.kh.dlog.mainmenu.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.diary.model.dao.DiaryDao;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired
	private DiaryDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int diaryMemberNo) {
		
		return dDao.selectListCount(sqlSession, diaryMemberNo);
	}
	

	@Override
	public ArrayList<Diary> selectList(PageInfo pi, int diaryMemberNo) {
		return dDao.selectList(sqlSession, pi, diaryMemberNo);
	}

	@Override
	public int insertDiary(Diary d) {
		return dDao.insertDiary(sqlSession, d);
	}

	@Override
	public int increaseCount(int dno) {
		return dDao.increaseCount(sqlSession, dno);
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

	//댓글들 
	@Override
	public ArrayList<Reply> selectReply(int dno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}


	}
