package com.kh.dlog.notification.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.notification.model.vo.Notification;

@Repository
public class NotificationDao {
	
	
	public int insertNotification(SqlSessionTemplate sqlSession, Notification n) {
		return sqlSession.insert("notificationMapper.insertNotification", n);
	}
	
	public int insertNotifications(SqlSessionTemplate sqlSession, Notification n, ArrayList flist) {
		int result = 0;
		for(int i=0; i<flist.size(); i++) {
			n.setMemberNo((int)flist.get(i));
			result = sqlSession.insert("notificationMapper.insertNotification", n);
		}
		return result;
	}
	
	public Reply selectReply(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("notificationMapper.selectReplyContent", rno);
	}
	
	public ArrayList selectFriendList(SqlSessionTemplate sqlSession, int loginUserNo) {
		return (ArrayList)sqlSession.selectList("notificationMapper.selectFriendList", loginUserNo);
	}
	
	public int findFriendOwnerNo(SqlSessionTemplate sqlSession, int friendNo) {
		return sqlSession.selectOne("notificationMapper.findFriendOwnerNo", friendNo);
	}
	
	public ArrayList<Notification> selectNotificationList(SqlSessionTemplate sqlSession, int loginUserNo) {
		return (ArrayList)sqlSession.selectList("notificationMapper.selectNotificationList", loginUserNo);
	}
	
	public int deleteNotification(SqlSessionTemplate sqlSession, int notificationNo) {
		return sqlSession.delete("notificationMapper.deleteNotification", notificationNo);
	}

}
