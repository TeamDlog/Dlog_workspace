package com.kh.dlog.mypage.controlAll.model.service;

import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;

public interface ControlAllService {
	public int ActiveWidget(ControlAll ca);
	public int PrivacyWidget(ControlAll ca);
	public ControlAll ControlAllMain(String memberNo);
}
