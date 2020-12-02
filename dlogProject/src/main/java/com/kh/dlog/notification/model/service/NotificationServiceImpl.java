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
	public int likePostNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 게시글 \"" + freenoteTitle + "\"에 좋아요를 표시했습니다.");
		n.setNotificationCategory(1);
		n.setMemberNo(freenoteWriterNo);
		
		return nDao.insertNotification(sqlSession, n);
	}
	
	@Override
	public int likeReplyNotify(String loginUserNickname, String replyContent, int replyWriter) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 댓글 \"" + replyContent + "\"에 좋아요를 표시했습니다.");
		n.setNotificationCategory(1);
		n.setMemberNo(replyWriter);
		
		return nDao.insertNotification(sqlSession, n);
	}
	
	@Override
	public Reply selectReplyContent(int rno) {
		return nDao.selectReply(sqlSession, rno);
	}

	@Override
	public int replyNotify(String loginUserNickname, String freenoteTitle, int freenoteWriterNo) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 게시글 \"" + freenoteTitle + "\"에 댓글을 달았습니다.");
		n.setNotificationCategory(2);
		n.setMemberNo(freenoteWriterNo);
		
		return nDao.insertNotification(sqlSession, n);
	}

	@Override
	public int friendRequestNotify(String loginUserNickname, int friendAccepted) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 친구 요청하셨습니다.");
		n.setNotificationCategory(3);
		n.setMemberNo(friendAccepted);
		
		return nDao.insertNotification(sqlSession, n);
	}

	@Override
	public int friendAcceptNotify(String loginUserNickname, int friendAccepted) {
		Notification n = new Notification();
		n.setNotificationContent(loginUserNickname + "님이 친구 수락하셨습니다.");
		n.setNotificationCategory(4);
		n.setMemberNo(friendAccepted);
		
		return nDao.insertNotification(sqlSession, n);
	}

	@Override
	public ArrayList selectFriendList(int loginUserNo) {
		return nDao.selectFriendList(sqlSession, loginUserNo);
	}

	@Override
	public int friendNewPostNotify(int loginUserNo, String loginUserNickname) {
		Notification n = new Notification();
		n.setNotificationContent("친구 " + loginUserNickname + "님이 새글을 등록했습니다.");
		n.setNotificationCategory(5);
		ArrayList flist = selectFriendList(loginUserNo);
		return nDao.insertNotifiactions(sqlSession, n, flist);
	}
	
	@Override
	public int selectNotificationCount(int loginUserNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Notification> selectNotificationList(int loginUserNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteNotification(int notificationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
