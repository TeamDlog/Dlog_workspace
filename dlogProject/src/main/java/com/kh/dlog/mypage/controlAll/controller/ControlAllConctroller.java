package com.kh.dlog.mypage.controlAll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dlog.mypage.controlAll.model.service.ControlAllService;
import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;

@Controller
public class ControlAllConctroller {
	
	@Autowired
	private ControlAllService caService;
	
	@RequestMapping("main.ca")
	public String ControlAllMain(/*String memberNo, */Model model) {
		model.addAttribute("ca", caService.ControlAllMain("3"));
		return "mypage/control/controlAllMain";
	}
	
	@RequestMapping("activeWidget.ca")
	@ResponseBody
	public void ActiveWidget(ControlAll ca, Model model) {
		caService.ActiveWidget(ca);
		
	}
	
	@RequestMapping("privacyWidget.ca")
	@ResponseBody
	public void PrivacyWidget(ControlAll ca, Model model) {
		caService.PrivacyWidget(ca);
	}
	
	@RequestMapping("widgetChecked.ca")
	@ResponseBody
	public ControlAll WidgetChecked(String memberNo) {
		return caService.ControlAllMain("3");
	}
	
}
