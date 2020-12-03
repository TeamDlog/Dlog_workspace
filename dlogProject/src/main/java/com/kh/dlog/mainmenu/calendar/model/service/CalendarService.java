package com.kh.dlog.mainmenu.calendar.model.service;

import java.util.ArrayList;

import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertCalendar(Calendar c);
	int deleteCalendar(int calendarNo);
	ArrayList<Calendar> selectCalendarList(int calendarWriter);
	Calendar selectCalendarDetail(Calendar c);
	int updateCalendar(Calendar c);
	
}
