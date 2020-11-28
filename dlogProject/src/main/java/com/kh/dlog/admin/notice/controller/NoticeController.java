package com.kh.dlog.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dlog.admin.notice.model.service.NoticeService;
import com.kh.dlog.admin.notice.model.vo.Notice;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "service/noticeListView";
	}
	@RequestMapping("detail.no")
	public String selectNotice(int bno, Model model) {
		
		Notice n = nService.selectNotice(bno);
		
		model.addAttribute("n", n);
			
		return "service/noticeDetailView";
		
	}
	@RequestMapping("searchlist.no")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition, String keyword, Model model) {
		
		int listCount = nService.searchListCount(condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.searchList(pi, condition, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "service/noticeListView";
	}
	@RequestMapping("adminNoticeList.no")
	public String adminSelectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "admin/adminNoticeList";
	}
	@RequestMapping("adminNoticeDetail.no")
	public String adminSelectNotice(int bno, Model model) {
		System.out.println("bno = " + bno);
		Notice n = nService.selectNotice(bno);
		
		model.addAttribute("n", n);
			
		return "admin/adminNoticeDetail";
		
	}
	
	@RequestMapping("adminNoticeDelete.no")
	public String deleteNotice(String array, String fileName, HttpSession session, Model model) {
		
		String[] arr = array.split(",");
		System.out.println("array = " +array);
		int result = nService.deleteNotice(arr);
		
		if(result>0) {
			
			return "redirect:adminNoticeList.no";
		}else {
		
			return "common/errorPage";
		}
			
		
	}
	
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "admin/noticeEnrollForm";
	}
	
	@RequestMapping("noticeInsert.no")
	public String insertBoard(Notice n , MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session); //공통으로 쓰이게끔 뺀 메소드 호출만으로 끝
			
			n.setNoticeOriginName(upfile.getOriginalFilename());
			n.setNoticeChangeName("resources/uploadFiles/" + changeName);
			// "resources/uploadFiles/2020103014433024567.jpg"
			
		}
	
		int result = nService.insertNotice(n);
		
		if(result > 0) {
		
			return "redirect:adminNoticeList.no";
		}else {
			
			return "common/errorPage";
		}
		
	}
	
	// 전달된 파일 업로드용 공통 메소드
		public String saveFile(MultipartFile upfile, HttpSession session) {
		
			String originName = upfile.getOriginalFilename();
			
			// 저장시킬 폴더의 물리적인 경로
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
					
			// 원본명("aaa.jpg") --> 실제 서버에 업로드될명("2020103014433024567.jpg")
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return changeName;
			
		}
}
