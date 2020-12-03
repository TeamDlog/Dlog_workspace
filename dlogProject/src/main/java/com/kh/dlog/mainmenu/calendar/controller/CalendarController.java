package com.kh.dlog.mainmenu.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dlog.mainmenu.calendar.model.service.CalendarService;
import com.kh.dlog.mainmenu.calendar.model.vo.Calendar;
import com.kh.dlog.member.model.vo.Member;

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
	
	@RequestMapping("selectList.ca")
	public String selectList(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Calendar> list = cService.selectCalendarList(m.getMemberNo());
		int size = list.size();
		model.addAttribute("list",list);
		model.addAttribute("size",size);
		return "mainmenu/calendar/calendarMain";
	}
	
	@RequestMapping("selectDetail.ca")
	public String selectDetail(int calendarNo, HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		Calendar c = new Calendar();
		c.setCalendarNo(calendarNo);
		c.setCalendarWriter(m.getMemberNo());
		
		Calendar list = cService.selectCalendarDetail(c);
		model.addAttribute("list", list);
		return "mainmenu/calendar/calendarDetail";
	}
	
	@RequestMapping("delete.ca")
	public String deleteCalendar(int calendarNo, HttpSession session) {
		int result = cService.deleteCalendar(calendarNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제 성공!!");
			return "redirect:selectList.ca";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("update.ca")
	public String updateCalendar(Calendar c, HttpSession session) {
		int result = cService.updateCalendar(c);
		if(result > 0) {
			session.setAttribute("alertMsg", "수정 성공!!");
			return "redirect:selectList.ca";
		} else {
			return "common/errorPage";
		}
	}
	
}
