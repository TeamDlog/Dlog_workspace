package com.kh.dlog.mainmenu.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.mainmenu.calendar.model.dao.CalendarDao;
import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	// field
	@Autowired
	private CalendarDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// method
	@Override
	public int insertCalendar(Calendar c) { // 캘린더 작성
		return cDao.insertCalendar(sqlSession, c);
	}

	@Override
	public int enrollCalendar(int calendarWriter) { // 캘린더 작성 폼
		return cDao.enrollCalendar(sqlSession, calendarWriter);
	}
	@Override
	public int deleteCalendar(int calendarNo) { // 캘린더 삭제
		return cDao.deleteCalendar(sqlSession, calendarNo);
	}

	@Override
	public ArrayList<Calendar> selectCalendarList(int calendarWriter) {  // 캘린더 전체 조회 
		return null;
	}

	@Override
	public Calendar selectCalendarDetail(int calendarNo) { // 캘린더 상세 조회
		return null;
	}

	@Override
	public int updateCalendar(Calendar c) { // 캘린더 수정
		return cDao.updateCalendar(sqlSession, c);
	}

	
}
