package com.kh.dlog.admin.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dlog.admin.report.model.service.ReportService;
import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.notification.model.service.NotificationService;
import com.kh.dlog.notification.model.vo.Notification;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	@Autowired
	private NotificationService nService;
	
	@RequestMapping("adminReportList.ro")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = rService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Report> list = rService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "admin/adminReportList";
	}
	
	@RequestMapping("adminReportDetail.ro")
	public String adminSelectReport(int bno, Model model) {
		Report r = rService.selectReport(bno);
		int pNo = r.getReportPostNo();
		Reply re = rService.selectReply(pNo); 
		Freenote fr = rService.selectFreenote(pNo);
		model.addAttribute("r", r);
		model.addAttribute("re",re);
		model.addAttribute("fr",fr);
		return "admin/adminReportDetail";
		
	}
	
	@RequestMapping("adminReportProcess.ro")
	public String updateReportProcess(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Report r ,Model model, HttpSession session) {
	
		rService.updateReportProcess(r);
		
		// 알림서비스
		session.setAttribute("notification", nService.reportCheckNotify(r.getReportWriterNo()));
		
		int listCount = rService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Report> list = rService.selectList(pi);
		
				
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "admin/adminReportList";
	}
	
	@RequestMapping("adminReportDelete.ro")
	public String adminReplyDelete(Integer reNo,Integer frNo, int bno , Model model) {
	
		if(reNo != null) {
			rService.adminReplyDelete(reNo);
		}else {
			rService.adminFreenoteDelete(frNo);
		}
		
		
		return "redirect:adminReportDetail.ro?bno=" + bno;
	}
	
	
}
