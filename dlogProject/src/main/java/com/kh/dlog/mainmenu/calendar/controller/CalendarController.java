package com.kh.dlog.mainmenu.calendar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dlog.mainmenu.calendar.model.service.CalendarService;
import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@RequestMapping("enroll.ca")
	public String enrollCalendar() {
		return "mainmenu/calendar/calendarEnroll";
	}
	
	@RequestMapping("insert.ca")
	public String insertCalendar(Calendar c, HttpSession session) {
		
		int result = cService.insertCalendar(c);
		if(result > 0) {
			session.setAttribute("alertMsg", "등록 성공!!");
			return "redirect:selectList.ca";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.ca")
	public String deleteCalendar() {
		return "";
	}
	
	@RequestMapping("selectList.ca")
	public String selectList() {
		return "mainmenu/calendar/calendarMain";
	}
	
	@RequestMapping("selectDetail.ca")
	public String selectDetail() {
		return "mainmenu/calendar/calendarDetail";
	}
	
	@RequestMapping("update.ca")
	public String updateCalendar() {
		return "";
	}
	
}
