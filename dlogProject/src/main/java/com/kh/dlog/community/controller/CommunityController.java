package com.kh.dlog.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.mainmenu.freenote.model.service.FreenoteService;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.SearchCondition;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.notification.model.service.NotificationService;

@Controller
public class CommunityController {
	
	@Autowired
	private FreenoteService fService;
	@Autowired
	private NotificationService nService;
	
	@RequestMapping("list.co")
	public String community() {
		return "mainpage/community/communityMain";
	}
	
	@ResponseBody
	@RequestMapping(value="commList.co", produces="application/json; charset=utf-8")
	public String selectCommunityList(int topic, int currentPage) {
		String topicName = "";
		switch(topic) {
		case 1: topicName="엔터"; break;
		case 2: topicName="생활"; break;
		case 3: topicName="취미"; break;
		case 4: topicName="지식"; break;
		default: topicName= "";
		}
		
		int listCount = fService.selectCommListCount(topicName);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Freenote> list = fService.selectCommList(topicName, pi);
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", list);
		jobj.put("pi", pi);
		jobj.put("topic", topic);
		
		return new Gson().toJson(jobj);
	}
	
	@RequestMapping("search.co")
	public String searchCommunity(String keyword, String condition, @RequestParam(value="sort", defaultValue="recent") String sort, @RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		SearchCondition sc = new SearchCondition();
		sc.setCondition(condition);
		sc.setKeyword(keyword);
		sc.setSort(sort);
		
		int listCount = fService.selectSearchListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		//ArrayList<Freenote> list = fService.selectSearchList(sc, pi);
		
		model.addAttribute("pi", pi);
		//model.addAttribute("list", list);
		model.addAttribute("sc", sc);
		return "mainpage/community/communitySearchList";
	}
	
	@ResponseBody
	@RequestMapping(value="searchList.co", produces="application/json; charset=utf-8")
	public String selectSearchList(SearchCondition sc, int currentPage, Model model) {
		
		int listCount = fService.selectSearchListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Freenote> list = fService.selectSearchList(sc, pi);
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", list);
		jobj.put("pi", pi);
		//jobj.put("sc", sc);
		return new Gson().toJson(jobj);
	}
	
	@RequestMapping("detail.co")
	public String selectCommunity(int fno, Model model, HttpSession session) {
		int result = fService.increaseCount(fno);
		
		if(result>0) {
			Freenote fn = fService.selectFreenote(fno, ((Member)session.getAttribute("loginUser")).getMemberNo());
			model.addAttribute("fn", fn);
			return "mainpage/community/communityDetailView";			
		}else {
			// 에러페이지
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="report.co", produces="text/html; charset=utf-8")
	public String reportPost(Report r) {
		System.out.println(r);
		if(fService.checkReport(r)==0) {
			return fService.insertReport(r) + "";
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="friend.co", produces="text/html; charset=utf-8")
	public String requestFriend(Friend friend, HttpSession session) {
		
		int result = fService.checkFriend(friend);
		if(result==0) {
			nService.friendRequestNotify(((Member)session.getAttribute("loginUser")).getNickname(), friend.getFriendAccepted());
			result = fService.requestFriend(friend);
			return "1";
		}else {
			return "0";
		}
	}
	
	
}





