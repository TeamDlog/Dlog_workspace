package com.kh.dlog.admin.inquiry.controller;



import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dlog.admin.inquiry.model.service.InquiryService;
import com.kh.dlog.admin.inquiry.model.vo.Inquiry;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.notification.model.service.NotificationService;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService iService;
	@Autowired
	private NotificationService nService;
	
	@RequestMapping("enrollForm.io")
	public String enrollForm() {
		return "service/inquiryEnrollForm";
	}
	
	@RequestMapping("insert.io")
	public String insertInquiry(Inquiry i , Model model, HttpSession session) {
	
		int result = iService.insertInquiry(i);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "service/inquiryEnrollForm";
		}else {
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage";
		}
		
		
	}
	
	@RequestMapping("adminInquiryAnswer.io")
	public String insertInquiryAnswer(Inquiry i , Model model) {
	
		ApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:application.xml");
			
		
		JavaMailSenderImpl mailSender = (JavaMailSenderImpl)ctx.getBean("mailSender");
				
		// 메일 제목, 내용
		String subject = "문의 해주신 답변입니다.";
		String content = i.getInquiryAnswer();
		
		// 보내는 사람
		String from = "dltjrals2003@naver.com";
		
		// 받는 사람
		String[] to = new String[1];
		to[0] = i.getInquiryEmail();
		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		iService.insertInquiryAnswer(i);
		
		
		return "redirect:adminInquiryDetail.io?bno=" + i.getInquiryNo();
	}
	
	@RequestMapping("adminInquiryProcess.io")
	public String updateInquiryProcess(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Inquiry i , Member m,Model model, HttpSession session) {
	
		iService.updateInquiryProcess(i);
		
		//알림서비스
		session.setAttribute("notification", nService.inquiryEmailNotify(i.getInquiryWriter()));
		
	
		
		ArrayList<Inquiry> list = iService.selectList();
		
				
		
		model.addAttribute("list",list);
		
		return "admin/adminInquiryList";
	}
	
	@RequestMapping("adminInquiryList.io")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		
		
		ArrayList<Inquiry> list = iService.selectList();
		
		
		model.addAttribute("list",list);
		
		return "admin/adminInquiryList";
	}
	
	@RequestMapping("adminInquiryDetail.io")
	public String adminSelectNotice(int bno, Model model) {
		Inquiry i = iService.selectInquiry(bno);
		
		model.addAttribute("i", i);
			
		return "admin/adminInquiryDetail";
		
	}
	
	
}
