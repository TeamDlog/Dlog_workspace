package com.kh.dlog.widget.voca.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.widget.voca.model.service.VocaService;
import com.kh.dlog.widget.voca.model.vo.Voca;

@Controller
public class VocaController {
	
	@Autowired
	private VocaService vService;
	
	@RequestMapping("list.vo")
	public String vocaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMemberNo();
		
		int listCount = vService.selectListCount(mno);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Voca> list = vService.selectList(pi, mno);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "widget/voca/vocaListView";
	}

	@RequestMapping("enroll.vo")
	public String enrollVoca(Voca v, HttpSession session) {
		
		int result = vService.enrollVoca(v);
		
		if(result > 0) {
			
			return "redirect:list.vo";
			
		}else {
			
			session.setAttribute("errorMsg", "단어 등록에 실패했습니다.");
			return "redirect:list.vo";
			
		}
		
	}
	
	@RequestMapping("delete.vo")
	public String deleteVoca(String arr, HttpSession session) {
		
		String[] list = arr.split(",");
		int result = vService.deleteVoca(list);
		
		if(result > 0) {
			return "redirect:list.vo";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.vo")
	public String searchVoca(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String keyword, int vocaWriter, Model model) {
		
		Voca v = new Voca();
		v.setKeyword(keyword);
		v.setVocaWriter(vocaWriter);
		
		int listCount = vService.searchListCount(v);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Voca> list = vService.searchVoca(pi,v);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "widget/voca/vocaListView";
	}

}
