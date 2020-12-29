package com.kh.dlog.mainmenu.diary.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;

@Repository
public class DiaryDao {

	public int selectListCount(SqlSessionTemplate sqlSession,int diaryMemberNo) {
		
		return sqlSession.selectOne("diaryMapper.selectListCount", diaryMemberNo);
	}
	
	public ArrayList<Diary> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int diaryMemberNo){
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.selectList",diaryMemberNo, rowBounds);
	}
	
	public int insertDiary(SqlSessionTemplate sqlSession, Diary d) {
		return sqlSession.insert("diaryMapper.insertDiary", d);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.update("diaryMapper.increaseCount", dno);
	}
	
	public Diary detailDiary(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("diaryMapper.detailDiary", dno);
	}
	
	public int deleteDiary(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.update("diaryMapper.deleteDiary", dno);
	}

	public int updateDiary(SqlSessionTemplate sqlSession, Diary dn) {
		// TODO Auto-generated method stub
		return sqlSession.update("diaryMapper.updateDiary", dn);
	}
	
}
