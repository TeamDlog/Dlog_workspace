package com.kh.dlog.notification.conroller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.notification.model.service.NotificationService;

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

}
