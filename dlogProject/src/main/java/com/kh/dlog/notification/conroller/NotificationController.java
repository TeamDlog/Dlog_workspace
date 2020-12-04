package com.kh.dlog.notification.conroller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.notification.model.service.NotificationService;
import com.kh.dlog.notification.model.vo.Notification;

@Controller
public class NotificationController {
	
	@Autowired
	private NotificationService nService;
	
	@ResponseBody
	@RequestMapping(value="list.nf", produces="application/json; charset:utf-8")
	public String selectNotificationList(int loginUserNo) {
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", nService.selectNotificationList(loginUserNo));
		
		return new Gson().toJson(jobj);
	}
	
	@ResponseBody
	@RequestMapping(value="delete.nf", produces="text/html; charset:utf-8")
	public String deleteNotification(int notificationNo) {
		return nService.deleteNotification(notificationNo)+"";
	}
	
	@ResponseBody
	@RequestMapping(value="notify.nf", produces="application/json; charset:utf-8")
	public String friendNewPostNotification(HttpSession session) {
		JSONObject jobj = new JSONObject();
		
		if(session.getAttribute("notification") != null) {
			Notification n = (Notification)session.getAttribute("notification");
			session.removeAttribute("notification");
			jobj.put("n", n);
		}
		if(session.getAttribute("flist") != null) {
			ArrayList flist = (ArrayList)session.getAttribute("flist");
			session.removeAttribute("flist");
			jobj.put("flist", flist);
		}
		
		return new Gson().toJson(jobj);
	}

}
