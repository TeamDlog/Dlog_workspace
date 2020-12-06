package com.kh.dlog.friend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.friend.model.service.FriendService;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.notification.model.service.NotificationService;
import com.kh.dlog.notification.model.vo.Notification;

@Controller
public class FriendController {
	
	@Autowired
	private FriendService fService;
	@Autowired
	private NotificationService nService;
	
	@ResponseBody
	@RequestMapping(value="selectList.fr", produces="application/json; charset=utf-8")
	public String selectFriendList(int friendOwner, Model model, HttpSession session) {
		
		ArrayList<Friend> friendList = fService.selectFriendList(friendOwner);
		session.setAttribute("friendList",friendList);
		return new Gson().toJson(friendList);
		
	}
	
	@ResponseBody
	@RequestMapping(value="delete.fr", produces="text/html; charset=utf-8")
	public String deleteFriend(int friendNo, HttpSession session) {
		
		int result = fService.deleteFriend(friendNo);
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Friend> friendList = fService.selectFriendList(m.getMemberNo());
		session.setAttribute("friendList",friendList);
		if(result > 0) {
			return "삭제 성공";
		}else {
			return "삭제 실패";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="search.fr", produces="application/json; charset=utf-8")
	public String searchFriend(Member m) {
		
		ArrayList<Friend> friendList = fService.searchFriend(m);
		if(m.getNickname().equals("")) {
			friendList.clear();
		}
		int size = friendList.size();
		List<Object> send = new ArrayList<>();
		send.add(friendList);
		send.add(size);
		return new Gson().toJson(send);
		
	}
	
	@ResponseBody
	@RequestMapping(value="find.fr", produces="application/json; charset=utf-8")
	public String findFriend(Member m) {
		
		ArrayList<Member> friendList = fService.findFriend(m);
		return new Gson().toJson(friendList);
		
	}
	
	@ResponseBody
	@RequestMapping(value="accept.fr", produces="application/json; charset=utf-8")
	public String acceptFriend(Friend f, HttpSession session) {
		
		int result = fService.acceptFriend(f);
		JSONObject jobj = new JSONObject();
		String resultStr = "";
		if(result > 0) {
			// 친구 수락 알림
			jobj.put("n", nService.friendAcceptNotify(((Member)session.getAttribute("loginUser")).getNickname(), f.getFriendNo()));
			jobj.put("result","승낙 성공");
		}else {
			jobj.put("result","승낙 실패");
		}
		return new Gson().toJson(jobj);
	}
	
	@ResponseBody
	@RequestMapping(value="reject.fr", produces="text/html; charset=utf-8")
	public String rejectFriend(Friend f) {
		
		int result = fService.rejectFriend(f);
		if(result > 0) {
			return "거절 성공";
		}else {
			return "거절 실패";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="insert.fr", produces="text/html; charset=utf-8")
	public String insertFriend(Friend f) {
		
		int result = fService.insertFriend(f);
		if(result > 0) {
			return "거절 성공";
		}else {
			return "거절 실패";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="reloadRequest.fr", produces="application/json; charset=utf-8")
	public String reloadRequest(int friendAccepted) {
		
		ArrayList<Friend> friendList = fService.requestFriend(friendAccepted);
		return new Gson().toJson(friendList);
		
	}
	
}
