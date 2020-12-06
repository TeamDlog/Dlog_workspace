package com.kh.dlog.admin.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.admin.notice.model.vo.Notice;
import com.kh.dlog.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession){
		
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", bno);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession,String condition, String keyword) {
		
		if(condition.equals("title")) {
			return sqlSession.selectOne("noticeMapper.searchListCount_title",keyword);
		}else {
			return sqlSession.selectOne("noticeMapper.searchListCount_content",keyword);
		}
	}
	
	
	public ArrayList<Notice> searchList(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(condition.equals("title")) {
			return (ArrayList)sqlSession.selectList("noticeMapper.searchList_title", keyword, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("noticeMapper.searchList_content", keyword, rowBounds);
		}
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, String[] array) {
		
		int result=0;
		for(int i = 0 ; i < array.length ; i++) {
			int bno = Integer.parseInt((String)array[i]);
			result= sqlSession.update("noticeMapper.deleteNotice", bno);
		}
		return result;
		
	}
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
}
