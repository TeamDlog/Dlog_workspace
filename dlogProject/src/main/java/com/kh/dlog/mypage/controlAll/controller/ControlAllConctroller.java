package com.kh.dlog.mypage.controlAll.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dlog.member.controller.MemberController;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.mypage.controlAll.model.service.ControlAllService;
import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;

@Controller
public class ControlAllConctroller {
	
	@Autowired
	private ControlAllService caService;
	@Autowired
	private MemberController mController;
	
	
	@RequestMapping("main.ca")
	public String ControlAllMain(HttpSession session,Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		loginUser.setDiaryMemberNo(loginUser.getMemberNo());
		mController.widgetSessionUpdate(session, loginUser.getDiaryMemberNo());
		session.setAttribute("loginUser", loginUser);
		return "mypage/control/controlAllMain";
	}
	
	@RequestMapping("activeWidget.ca")
	@ResponseBody
	public ControlAll ActiveWidget(HttpSession session, ControlAll ca, Model model) {
		caService.ActiveWidget(ca);
		return caService.ControlAllMain(ca.getMemberNo());
	}
	
	@RequestMapping("privacyWidget.ca")
	@ResponseBody
	public ControlAll PrivacyWidget(HttpSession session, ControlAll ca, Model model) {
		caService.PrivacyWidget(ca);
		return caService.ControlAllMain(ca.getMemberNo());
	}
	
	@RequestMapping("widgetChecked.ca")
	@ResponseBody
	public ControlAll WidgetChecked(HttpSession session, String memberNo) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		return caService.ControlAllMain(loginUser.getMemberNo()+"");
	}
	
	@RequestMapping("myColor.ca")
	public String myColor(HttpSession session, ControlAll ca) {
		int result = caService.myColor(ca);
		if(result > 0) {
			session.setAttribute("alertMsg", "테마적용 완료!");
			return "redirect:main.ca";
		}else {
			session.setAttribute("alertMsg", "테마적용 실패..");
			return "redirect:main.ca";
		}
	}
	
	@RequestMapping("reset.ca")
	public String resetMyColor(HttpSession session, String memberNo) {
		int result = caService.resetMyColor(memberNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "테마초기화 완료!");
			return "redirect:main.ca";
		}else {
			session.setAttribute("alertMsg", "테마초기화 실패..");
			return "redirect:main.ca";
		}
	}
	
}
