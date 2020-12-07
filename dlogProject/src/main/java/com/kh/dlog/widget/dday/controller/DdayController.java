package com.kh.dlog.widget.dday.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.widget.dday.model.service.DdayService;
import com.kh.dlog.widget.dday.model.vo.Dday;
import com.kh.dlog.widget.dday.model.vo.WidgetCheck;

@Controller
public class DdayController {
	
	@Autowired
	private DdayService dService;
	
	@RequestMapping("main.dd")
	public String ddayMain(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String memberNo = loginUser.getDiaryMemberNo()+"";
			ArrayList<Dday> list = dService.ddayMain(memberNo);
			
			
			session.setAttribute("dlist", list);
			
			return "widget/dday/ddayMain";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("insert.dd")
	public String insertDday(Dday d, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			int result = dService.ddayCount(d.getMemberNo());
			
			if(result >= 10) {
				session.setAttribute("alertMsg", "디데이는 최대 10개 까지 등록 가능합니다.");
				return "redirect:main.dd";
			}
			
			if(dService.insertDday(d) > 0) {
				session.setAttribute("alertMsg", "디데이 추가 완료!");
			}else {
				session.setAttribute("alertMsg", "디데이 추가 실패..");
			}
			
			return "redirect:main.dd";
			
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("update.dd")
	public String updateDday(Dday d, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			if(dService.updateDday(d) > 0) {
				session.setAttribute("alertMsg", "디데이 수정 완료!");
			}else {
				session.setAttribute("alertMsg", "디데이 수정 실패..");
			}
			return "redirect:main.dd";
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("delete.dd")
	public String deleteDday(String[] deleteDday, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			if(deleteDday != null) {
				int result = dService.deleteDday(deleteDday);
				if(result > 0) {
					session.setAttribute("alertMsg", "디데이 삭제 완료!");
					return "redirect:main.dd";
				}else {
					session.setAttribute("alertMsg", "디데이 삭제 실패..");
					return "redirect:main.dd";
				}
			}else {
				session.setAttribute("alertMsg", "선택된 항목이 없습니다.");
				return "redirect:main.dd";
			}
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("widgetCheck.dd")
	public String widgetCheck(WidgetCheck wc, String[] dlist, HttpSession session) {
		
		if(wc.getWidgetCount() != 0) {
			int result = dService.widgetDday(wc, dlist);
			if(result > 0) {
				session.setAttribute("alertMsg", "위젯 설정 완료!");
				return "redirect:main.dd";
			}else {
				session.setAttribute("alertMsg", "위젯 등록 실패..");
				return "redirect:main.dd";
			}
		}else {
			int result = dService.widgetDday(wc, dlist);
			if(result > 0) {
				session.setAttribute("alertMsg", "모든 위젯이 해제되었습니다.");
				return "redirect:main.dd";
			}else {
				session.setAttribute("alertMsg", "위젯 등록 실패..");
				return "redirect:main.dd";
			}
		}
			
	}
	
}
