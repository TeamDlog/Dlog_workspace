package com.kh.dlog.widget.dday.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.widget.dday.model.vo.Dday;
import com.kh.dlog.widget.dday.model.vo.WidgetCheck;

@Repository
public class DdayDao {
	
	public ArrayList<Dday> ddayMain(SqlSessionTemplate sqlSession, String memberNo){
		return (ArrayList)sqlSession.selectList("ddayMapper.ddayList", memberNo);
	}
	
	public int ddayCount(SqlSessionTemplate sqlSession, String memberNo) {
		return sqlSession.selectOne("ddayMapper.ddayCount", memberNo);
	}
	
	public int insertDday(SqlSessionTemplate sqlSession, Dday d) {
		return sqlSession.insert("ddayMapper.insertDday", d);
	}
	
	public int updateDday(SqlSessionTemplate sqlSession, Dday d) {
		return sqlSession.update("ddayMapper.updateDday", d);
	}
	
	public int deleteDday(SqlSessionTemplate sqlSession, String[] deleteDday) {
		
		int result = 1;
		for(String ddayNo : deleteDday) {
			result = result * sqlSession.delete("ddayMapper.deleteDday", ddayNo);
		}
		return result;
	}
	
	public int widgetDday(SqlSessionTemplate sqlSession, WidgetCheck wc, String[] dlist) {
		
		int result = 1;
		
		String ddayNo1 = wc.getWidgetCheck1();
		String ddayNo2 = wc.getWidgetCheck2();
		String ddayNo3 = wc.getWidgetCheck3();
		for(String ddayNo : dlist) {
			result = result * sqlSession.update("ddayMapper.widgetDday", ddayNo);
		}
		
		for(int i=1; i <= 3; i++) {
			if(i == 1) {
				result = result + sqlSession.update("ddayMapper.widgetDday1", ddayNo1);
			}else if(i == 2) {
				result = result + sqlSession.update("ddayMapper.widgetDday2", ddayNo2);
			}else if(i == 3) {
				result = result + sqlSession.update("ddayMapper.widgetDday3", ddayNo3);
			}
			
		}
		return result;
		
	}
	
	
}
