package com.kh.dlog.admin.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dlog.mainmenu.freenote.model.service.FreenoteService;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;

@Controller
public class AdminCommunityController {
	
	@Autowired
	FreenoteService fService;
	
	@RequestMapping("adminList.co")
	public ModelAndView selectList(ModelAndView mv) {
		mv.addObject("list", fService.selectAdminCommList()).setViewName("admin/community/adminCommunityListView");
		return mv;
	}
	
	@RequestMapping("adminDetail.co")
	public String selectCommunity(int fno, Model model) {
		Freenote fn = fService.selectFreenote(fno, 0);
		if(fn != null) {
			model.addAttribute("fn", fn);
			return "admin/community/adminCommunityDetailView";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("adminDelete.co")
	public String deleteCommunity(String arr, HttpSession session) {
		String[] list = arr.split(",");
		int result = fService.deleteCommunity(list);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제되었습니다");
			return "redirect:adminList.co";
		}else {
			return "common/errorPage";
		}
	}

}
