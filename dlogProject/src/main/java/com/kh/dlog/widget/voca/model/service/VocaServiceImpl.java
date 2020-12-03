package com.kh.dlog.widget.voca.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.widget.voca.model.dao.VocaDao;
import com.kh.dlog.widget.voca.model.vo.Voca;

@Service
public class VocaServiceImpl implements VocaService {
	
	@Autowired
	private VocaDao vDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(int mno) {
		return vDao.selectListCount(sqlSession, mno);
	}

	@Override
	public ArrayList<Voca> selectList(PageInfo pi, int mno) {
  		return vDao.selectList(sqlSession, pi, mno);
	}

	@Override
	public int enrollVoca(Voca v) {
		return vDao.enrollVoca(sqlSession, v);
	}

	@Override
	public int deleteVoca(String[] list) {
		return vDao.deleteVoca(sqlSession, list);
	}
	
	@Override
	public int searchListCount(Voca v) {
		return vDao.searchListCount(sqlSession, v);
	}

	@Override
	public ArrayList<Voca> searchVoca(PageInfo pi, Voca v) {
		return vDao.searchVoca(sqlSession, v, pi);
	}

	@Override
	public Voca randomList(int mno) {
		return vDao.randomVoca(sqlSession, mno);
	}

}
