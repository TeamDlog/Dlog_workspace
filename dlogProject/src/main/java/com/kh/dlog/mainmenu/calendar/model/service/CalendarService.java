package com.kh.dlog.mainmenu.calendar.model.service;

import java.util.ArrayList;

import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertCalendar(Calendar c);
	int deleteCalendar(int calendarNo);
	int enrollCalendar(int calendarWriter);
	ArrayList<Calendar> selectCalendarList(int calendarWriter);
	Calendar selectCalendarDetail(int calendarNo);
	int updateCalendar(Calendar c);
	
}
