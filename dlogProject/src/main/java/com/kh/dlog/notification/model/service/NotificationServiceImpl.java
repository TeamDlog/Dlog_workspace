package com.kh.dlog.notification.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.notification.model.dao.NotificationDao;
import com.kh.dlog.notification.model.vo.Notification;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDao nDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Notification likePostNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 게시글 \"" + freenoteTitle + "\"에 좋아요를 표시했습니다.");
		n.setNotificationCategory(1);
		n.setMemberNo(freenoteWriterNo);
		nDao.insertNotification(sqlSession, n);
		return n;
	}
	
	@Override
	public Notification likeReplyNotify(String loginUserNickname, String replyContent, int replyWriter) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 댓글 \"" + replyContent + "\"에 좋아요를 표시했습니다.");
		n.setNotificationCategory(1);
		n.setMemberNo(replyWriter);
		nDao.insertNotification(sqlSession, n);
		return n;
	}
	
	@Override
	public Reply selectReplyContent(int rno) {
		return nDao.selectReply(sqlSession, rno);
	}

	@Override
	public Notification replyNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 게시글 \"" + freenoteTitle + "\"에 댓글을 남겼습니다.");
		n.setNotificationCategory(2);
		n.setMemberNo(freenoteWriterNo);
		nDao.insertNotification(sqlSession, n);
		return n;
	}

	@Override
	public Notification friendRequestNotify(String loginUserNickname, int friendAccepted) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 친구 요청을 하셨습니다.");
		n.setNotificationCategory(3);
		n.setMemberNo(friendAccepted);
		nDao.insertNotification(sqlSession, n);
		return n;
	}

	@Override
	public Notification friendAcceptNotify(String loginUserNickname, int friendNo) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 친구 수락을 하셨습니다.");
		n.setNotificationCategory(4);
		n.setMemberNo(findFriendOwnerNo(friendNo));
		nDao.insertNotification(sqlSession, n);
		return n;
	}
	
	@Override
	public int findFriendOwnerNo(int friendNo) {
		return nDao.findFriendOwnerNo(sqlSession, friendNo);
	}

	@Override
	public ArrayList selectFriendList(int loginUserNo) {
		return nDao.selectFriendList(sqlSession, loginUserNo);
	}

	@Override
	public Notification friendNewPostNotify(int loginUserNo, String loginUserNickname) {
		Notification n = new Notification();
		n.setNotificationContent("친구 " + loginUserNickname + "님이 새글을 등록했습니다.");
		n.setNotificationCategory(5);
		ArrayList flist = selectFriendList(loginUserNo);
		nDao.insertNotifications(sqlSession, n, flist);
		return n;
	}
	
	@Override
	public Notification inquiryEmailNotify(int inquiryWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent("1:1문의 답변이 이메일로 전송되었습니다.");
		n.setNotificationCategory(6);
		n.setMemberNo(inquiryWriterNo);
		nDao.insertNotification(sqlSession, n);
		return n;
	}

	@Override
	public Notification reportCheckNotify(int reportWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent("신고하신 내역이 처리되었습니다.");
		n.setNotificationCategory(7);
		n.setMemberNo(reportWriterNo);
		nDao.insertNotification(sqlSession, n);
		return n;
	}

	@Override
	public ArrayList<Notification> selectNotificationList(int loginUserNo) {
		return nDao.selectNotificationList(sqlSession, loginUserNo);
	}

	@Override
	public int deleteNotification(int notificationNo) {
		return nDao.deleteNotification(sqlSession, notificationNo);
	}


}
