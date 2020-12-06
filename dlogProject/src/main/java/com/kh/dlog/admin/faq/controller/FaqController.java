package com.kh.dlog.admin.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dlog.admin.faq.model.service.FaqService;
import com.kh.dlog.admin.faq.model.vo.Faq;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;


@Controller
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	@RequestMapping("serviceMain.fo")
	public String serviceMain(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		
		ArrayList<Faq> list = fService.serviceMain();
		
		model.addAttribute("list",list);
		
		return "service/serviceMain";
	}
	
	@RequestMapping("list.fo")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition, String keyword,Model model) {
		
		condition="";
		keyword="";
		
		int listCount = fService.searchListCount(condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Faq> list = fService.searchList(pi, condition, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "service/faqListView";
	}
	@RequestMapping("detail.fo")
	public String selectNotice(int bno, Model model) {
		int result = fService.increaseCount(bno);
		
		if(result >0) {
		
			Faq f = fService.selectFaq(bno);
			
			model.addAttribute("f", f);
		}
		return "service/faqDetailView";
		
	}
	@RequestMapping("searchlist.fo")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition, String keyword, Model model) {
		
		int listCount = fService.searchListCount(condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Faq> list = fService.searchList(pi, condition, keyword);
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("conditon",condition);
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "service/faqListView";
	}
	@RequestMapping("adminFaqList.fo")
	public String adminSelectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = fService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Faq> list = fService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "admin/adminFaqList";
	}
	@RequestMapping("adminFaqDetail.no")
	public String adminSelectFaq(int bno, Model model) {
		System.out.println("bno = " + bno);
		Faq f = fService.selectFaq(bno);
		
		model.addAttribute("f", f);
			
		return "admin/adminFaqDetail";
		
	}
	
	@RequestMapping("adminFaqDelete.no")
	public String deleteFaq(String array, Model model) {
		
		String[] arr = array.split(",");
		System.out.println("array = " +array);
		int result = fService.deleteFaq(arr);
		
		if(result>0) {
			
			return "redirect:adminFaqList.fo";
		}else {
		
			return "common/errorPage";
		}
			
		
	}
	
	@RequestMapping("enrollForm.fo")
	public String enrollForm() {
		return "admin/faqEnrollForm";
	}
	
	@RequestMapping("faqInsert.fo")
	public String insertFaq(Faq f , Model model) {
		

	
		int result = fService.insertFaq(f);
		
		if(result > 0) {
		
			return "redirect:adminFaqList.fo";
		}else {
			
			return "common/errorPage";
		}
		
	}
	
	
}
