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
		Member loginMember = (Member)session.getAttribute("loginUser");
		String memberNo = loginMember.getMemberNo()+"";
		ArrayList<Dday> list = dService.ddayMain(memberNo);
		
		if(!list.isEmpty()) {
			
			model.addAttribute("dlist", list);
			
		}
		return "widget/dday/ddayMain";
	}
	
	@RequestMapping("insert.dd")
	public String insertDday(Dday d, HttpSession session) {
		
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
	}
	
	@RequestMapping("update.dd")
	public String updateDday(Dday d, HttpSession session) {
		
		if(dService.updateDday(d) > 0) {
			session.setAttribute("alertMsg", "디데이 수정 완료!");
		}else {
			session.setAttribute("alertMsg", "디데이 수정 실패..");
		}
		return "redirect:main.dd";
	}
	
	@RequestMapping("delete.dd")
	public String deleteDday(String[] deleteDday, HttpSession session) {
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
	}
	
	@RequestMapping("widgetCheck.dd")
	public String widgetCheck(WidgetCheck wc, String[] dlist, HttpSession session) {
		
		if(wc != null) {
			int result = dService.widgetDday(wc, dlist);
			if(result > 0) {
				session.setAttribute("alertMsg", "위젯 설정 완료!");
				return "redirect:main.dd";
			}else {
				session.setAttribute("alertMsg", "위젯 등록 실패..");
				return "redirect:main.dd";
			}
		}else {
			session.setAttribute("alertMsg", "선택된 항목이 없습니다.");
			return "redirect:main.dd";
		}
	}
	
}
