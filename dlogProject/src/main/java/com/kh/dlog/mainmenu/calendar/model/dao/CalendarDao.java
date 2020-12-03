package com.kh.dlog.mainmenu.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) { // 캘린더 작성
		return sqlSession.insert("calendarMapper.insertCalendar",c);
	}
	
	
	public ArrayList<Calendar> selectCalendarList(SqlSessionTemplate sqlSession, int calendarWriter) {  // 캘린더 전체 불러오기 
		return (ArrayList)sqlSession.selectList("calendarMapper.selectList", calendarWriter);
	}

	public Calendar selectCalendarDetail(SqlSessionTemplate sqlSession, Calendar c) { // 캘린더 상세 조회
		return sqlSession.selectOne("calendarMapper.selectDetail",c);
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, int calendarNo) { // 캘린더 삭제
		return sqlSession.delete("calendarMapper.deleteCalendar", calendarNo);
	}
	
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) { // 캘린더 수정
		return sqlSession.update("calendarMapper.updateCalendar", c);
	}
	
}
