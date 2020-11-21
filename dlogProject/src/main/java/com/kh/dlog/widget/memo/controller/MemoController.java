package com.kh.dlog.widget.memo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.widget.memo.model.service.MemoService;
import com.kh.dlog.widget.memo.model.vo.Memo;

@Controller
public class MemoController {
	
	@Autowired
	private MemoService mService;
	
	@RequestMapping("enroll.mo")
	public String enrollMemo(Model model) {
		
		Memo m = mService.selectMemoWidget(2);
		model.addAttribute("m", m);
		
		return "widget/memo/memoEnroll";
	}
	
	@RequestMapping("insert.mo")
	public String insertMemo(Memo m, HttpSession session) {
		int result = mService.insertMemo(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "저장 성공!!");
			return "redirect:selectList.mo";
		}else {
			session.setAttribute("alertMsg", "저장 실패..");
			return "redirect:selectList.mo";
		}
	}
	
	@RequestMapping("delete.mo")
	public String deleteMemo(String[] checkArr, HttpSession session) {
		int[] intNums = Arrays.stream(checkArr).mapToInt(Integer::parseInt).toArray();
		int result = mService.deleteMemo(intNums);
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제 성공!!");
			return "redirect:selectList.mo";
		}else {
			session.setAttribute("alertMsg", "삭제 실패..");
			return "redirect:selectList.mo";
		}
	}
	
	@RequestMapping(value="updateForm.mo")
	public String updateFormMemo(int memoNo, Model model) {
		
		Memo m = mService.selectMemoDetail(memoNo);
		model.addAttribute("m", m);
		
		return "widget/memo/memoDetail";
		
	}
	
	@RequestMapping("update.mo")
	public String updateMemo(Memo m, HttpSession session) {
		int result = mService.updateMemo(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "수정 성공!!");
			return "redirect:selectList.mo";
		}else {
			session.setAttribute("alertMsg", "수정 실패..");
			return "redirect:selectList.mo";
		}
	}
	
	@RequestMapping("updateDelete.mo")
	public String updateDelete(int memoNo, HttpSession session) {
		int result = mService.updateDelete(memoNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제 성공!!");
			return "redirect:selectList.mo";
		}else {
			session.setAttribute("alertMsg", "삭제 실패..");
			return "redirect:selectList.mo";
		}
	}
	
	@RequestMapping("selectList.mo")
	public String selectList(Model model, HttpSession session) {
		
		ArrayList<Memo> list = mService.selectMemoList(2);
		Memo memoWidget = mService.selectMemoWidget(2);
		session.setAttribute("memoWidget", memoWidget);
		model.addAttribute("list", list);
		
		return "widget/memo/memoMain";
	}
	
	@ResponseBody
	@RequestMapping(value="widgetNtoY.mo", produces="application/json; charset=utf-8")
	public String widgetMemoNtoY(Memo m, HttpSession session) {
		int result = mService.widgetMemoNtoY(m);
		Memo memoWidget = mService.selectMemoWidget(2);
		if(result > 0) {
			session.setAttribute("memoWidget", memoWidget);
			return new Gson().toJson(memoWidget);
		}else {
			return "변경 실패..";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="widgetAlltoN.mo", produces="text/html; charset=utf-8")
	public String widgetMemoAlltoN(int memoWriter, HttpSession session) {
		int result = mService.widgetMemoAlltoN(memoWriter);
		if(result > 0) {
			session.removeAttribute("memoWidget");
			return "변경 성공!";
		}else {
			return "변경 실패..";
		}
	}
	
}
