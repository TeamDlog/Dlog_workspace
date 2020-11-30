package com.kh.dlog.mainmenu.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	public int enrollCalendar(SqlSessionTemplate sqlSession, int calendarWriter) { // 캘린더 작성 폼
		return 0;
	}

	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) { // 캘린더 작성
		return 0;
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, int calendarNo) { // 캘린더 삭제
		return 0;
	}

	public ArrayList<Calendar> selectCalendarList(SqlSessionTemplate sqlSession, int calendarWriter) {  // 캘린더 전체 불러오기 
		return null;
	}

	public Calendar selectCalendarDetail(SqlSessionTemplate sqlSession, int calendarNo) { // 캘린더 상세 조회
		return null;
	}

	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) { // 캘린더 수정
		return 0;
	}
	
}
