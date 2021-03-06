package com.kh.dlog.widget.timetable.Controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.widget.timetable.model.Service.TimetableService;
import com.kh.dlog.widget.timetable.model.vo.Timetable;

@Controller
public class TimeTableController {
	
	@Autowired
	private TimetableService tService;
	
	private Calendar today = Calendar.getInstance();
	
	@RequestMapping("main.ti")
	public String timetableMain(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser != null) {
			int timetableWriter =  loginUser.getDiaryMemberNo();
			ArrayList<Timetable> tlist = tService.timetableList(timetableWriter);
			
			if(!tlist.isEmpty()) {
				for(Timetable t : tlist) {
					switch(today.get(Calendar.DAY_OF_WEEK)) {
						case 1 : t.setTimetableToDay("일요일"); break;
						case 2 : t.setTimetableToDay("월요일"); break;
						case 3 : t.setTimetableToDay("화요일"); break;
						case 4 : t.setTimetableToDay("수요일"); break;
						case 5 : t.setTimetableToDay("목요일"); break;
						case 6 : t.setTimetableToDay("금요일"); break;
						case 7 : t.setTimetableToDay("토요일"); break;
					}
				}
			}
			session.setAttribute("timetableList", tlist);
			return "widget/timetable/timetableMain";
				
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
		
	}
	
	@RequestMapping("enrollForm.ti")
	public String timetable(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			return "widget/timetable/timetableEnrollForm";
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
			
	}
	
	@RequestMapping("insert.ti")
	public String insertTimetable(Timetable t, HttpSession session) {
		
		if(session.getAttribute("loginUser") != null) {
			
			String timetableTime = "";
			
			for(int i=Integer.parseInt(t.getTimetableStart()); i<=Integer.parseInt(t.getTimetableEnd()); i++) {
				if(i != Integer.parseInt(t.getTimetableEnd())) {
					timetableTime = timetableTime + (i + ", ");
				}else {
					timetableTime = timetableTime + i;
				}
						
			}
			
			t.setTimetableTime(timetableTime);
			
			if(tService.insertTimetableCheck(t) < 1) {
				
				int result = tService.insertTimetable(t);
				
				if(result > 0) {
					
					session.setAttribute("alertMsg", "시간표 등록완료!");
					return "redirect:main.ti";
					
				}else {
					
					session.setAttribute("alertMsg", "시간표 등록실패..");
					return "common/errorPage";
					
				}
				
			}else {
				
				session.setAttribute("timetable", t);
				session.setAttribute("timetableInsertCheck", 1);
				return "redirect:main.ti";
				
			}
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
		
		
	}
	
	@RequestMapping("deleteAndInsert.ti")
	public String deleteAndInsertTimetable(Timetable t, Model model, HttpSession session) {
		
		if(session.getAttribute("loginUser") != null) {

			int result = tService.insertDeleteTimetable(t);
			if(result > 0) {
				insertTimetable(t, session);
			}else {
				session.setAttribute("alertMsg", "시간표 등록실패..");
			}
			return "redirect:main.ti";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("updateForm.ti")
	public String updateFormTimetable(Timetable t, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.setAttribute("timetable", t);
			return "widget/timetable/timetableUpdate";
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("update.ti")
	public String updateTimetable(Timetable t, HttpSession session) {
	
		if(session.getAttribute("loginUser") != null) {
			
			String timetableTime = "";
			
			for(int i=Integer.parseInt(t.getTimetableStart()); i<=Integer.parseInt(t.getTimetableEnd()); i++) {
				if(i != Integer.parseInt(t.getTimetableEnd())) {
					timetableTime = timetableTime + (i + ", ");
				}else {
					timetableTime = timetableTime + i;
				}
				
			}
			
			t.setTimetableTime(timetableTime);
			
			if(tService.updateTimetableCheck(t) < 1) {
				if(tService.updateTimetable(t) > 0) {
					session.setAttribute("alertMsg", "시간표 수정완료!");
					return "redirect:main.ti";
				}else {
					session.setAttribute("alertMsg", "시간표 수정실패..");
					return "redirect:main.ti";
				}
			}else {
				session.setAttribute("timetable", t);
				session.setAttribute("timetableUpdateCheck", 1);
				return "redirect:main.ti";
			}
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("deleteAndUpdate.ti")
	public String updateDeleteTimetable(Timetable t, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			int result = tService.updateDeleteTimetable(t);
			if(result > 0) {
				updateTimetable(t, session);
			}else {
				session.setAttribute("alertMsg", "시간표 등록실패..");
			}
			return "redirect:main.ti";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("delete.ti")
	public String deleteTimetable(String[] deleteTimetableCheck, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			int result = tService.deleteTimetable(deleteTimetableCheck);
			if(result > 0) {
				session.setAttribute("alertMsg", "시간표 삭제완료!");
			}else {
				session.setAttribute("alertMsg", "시간표 삭제실패..");
			}
			return "redirect:main.ti";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("reset.ti")
	public String resetTimetable(String timetableWriter, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			int result = tService.resetTimetable(timetableWriter);
			if(result > 0) {
				session.setAttribute("alertMsg", "시간표 초기화 완료!");
			}else {
				session.setAttribute("alertMsg", "시간표 초기화 실패..");
			}
			return "redirect:main.ti";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
}
