package com.kh.dlog.admin.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.admin.faq.model.vo.Faq;
import com.kh.dlog.common.model.vo.PageInfo;

@Repository
public class FaqDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("faqMapper.selectListCount");
	}
	public ArrayList<Faq> serviceMain(SqlSessionTemplate sqlSession){
		
		
		return (ArrayList)sqlSession.selectList("faqMapper.serviceMain");
	}
	
	public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession){
		
		
		return (ArrayList)sqlSession.selectList("faqMapper.selectList");
	}
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("faqMapper.increaseCount", bno);
	}
	public Faq selectFaq(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("faqMapper.selectFaq", bno);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession,String condition, String keyword) {
		
		if(condition.equals("title")) {
			return sqlSession.selectOne("faqMapper.searchListCount_title",keyword);
		}else {
			return sqlSession.selectOne("faqMapper.searchListCount_content",keyword);
		}
	}
	
	
	public ArrayList<Faq> searchList(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(condition.equals("title")) {
			return (ArrayList)sqlSession.selectList("faqMapper.searchList_title", keyword, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("faqMapper.searchList_content", keyword, rowBounds);
		}
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, String[] array) {
		
		int result=0;
		for(int i = 0 ; i < array.length ; i++) {
			int bno = Integer.parseInt((String)array[i]);
			result= sqlSession.update("faqMapper.deleteFaq", bno);
		}
		return result;
		
	}
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("faqMapper.insertFaq", f);
	}
}
