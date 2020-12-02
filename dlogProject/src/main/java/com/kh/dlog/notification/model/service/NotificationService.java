package com.kh.dlog.notification.model.service;

import java.util.ArrayList;

import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.notification.model.vo.Notification;

public interface NotificationService {
	
	// 글/댓글 좋아요(카테고리 번호 1)
	int likePostNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo);
	int likeReplyNotify(String loginUserNickname, String replyContent, int replyWriter);
	Reply selectReplyContent(int rno);
	// 댓글 등록(2)
	int replyNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo);
	// 친구요청(3)
	int friendRequestNotify(String loginUserNickname, int friendAccepted);
	// 친구수락(4)
	int friendAcceptNotify(String loginUserNickname, int friendAccepted);
	// 친구 새글 등록(5)
	ArrayList selectFriendList(int loginUserNo);
	int friendNewPostNotify(int loginUserNo, String loginUserNickname);
	// 1:1문의답변 이메일 전송(6)
	
	// 신고내역처리(7)
	
	// 알림 수 조회
	int selectNotificationCount(int loginUserNo);
	// 알림창 조회
	ArrayList<Notification> selectNotificationList(int loginUserNo);
	// 알림 목록에서 제거
	int deleteNotification(int notificationNo);
	

}
