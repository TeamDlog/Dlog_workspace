package com.kh.dlog.mainmenu.diary.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.mainmenu.diary.model.service.DiaryService;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;


@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService dService;
	
	@RequestMapping("list.di")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = dService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Diary> list = dService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "mainmenu/diary/diaryListView";
	}
	
	 @RequestMapping("enrollForm.di")
	public String enrollForm() {
		return "mainmenu/diary/diaryEnrollForm";
	}
	
	 @RequestMapping("insert.di")
	public String insertDiary(Diary d, Model model, HttpSession session) {
		
		int result = dService.insertDiary(d);
	
		if(result>0) {
			
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:list.di";
		}else {
			model.addAttribute("errorMsg", "등록 실패했습니다.");
			return "common/errorPage";
			
			
		}
	}
	
	@RequestMapping("detail.di")
	public String detailDiary(int dno, Model model) {
		
		
		Diary dn = dService.detailDiary(dno);
		
		model.addAttribute("dn", dn);
		return "mainmenu/diary/diaryDetailView";
		
	}
	
	@RequestMapping("delete.di")
	public String deleteDiary(int dno, Model model, HttpSession session) {
		
		int result = dService.deleteDiary(dno);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "삭제되었습니다!");
			return "redirect:list.di";
		}else { 
			model.addAttribute("errorMsg", "삭제 실패!");
			return "common/errorPage";
		}
	
	}
	
	@RequestMapping("updateForm.di")
	public String updateForm (int dno, Model model){
	
		Diary dn = dService.detailDiary(dno);
		model.addAttribute("dn",dn);
		
		return "mainmenu/diary/diaryUpdateForm";
	}

	@RequestMapping("update.di")
	public String updateDiary(Diary dn, Model model, HttpSession session) {
		
		
		int result = dService.updateDiary(dn);
		if(result>0) {
			session.setAttribute("alertMsg", "수정되었습니다.");
			model.addAttribute("dno", dn.getDiaryNo());
			return "redirect:list.di";
		}else {
			//에러페이지
			model.addAttribute("errorMsg", "수정 실패했습니다.");
			return "common/errorPage";
			
		}
	}
	
	
}

