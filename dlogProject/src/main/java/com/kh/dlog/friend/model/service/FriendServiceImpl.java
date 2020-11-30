package com.kh.dlog.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.friend.model.dao.FriendDao;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.member.model.vo.Member;

@Service
public class FriendServiceImpl implements FriendService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FriendDao fDao;

	@Override
	public int selectFriendListCount(int friendOwner) {
		return fDao.selectFriendListCount(sqlSession, friendOwner);
	}
	
	@Override
	public ArrayList<Friend> selectFriendList(int friendOwner, PageInfo pi) {
		return fDao.selectFriendList(sqlSession, friendOwner, pi);
	}

	@Override
	public int deleteFriend(Friend f) {
		return fDao.deleteFriend(sqlSession, f);
	}

	@Override
	public ArrayList<Member> searchFriend(Member m) { // 친구 목록에서의 검색
		return fDao.searchFriend(sqlSession, m);
	}

	@Override
	public ArrayList<Member> findFriend(Member m) { // 친구 요청에서의 검색
		return fDao.findFriend(sqlSession, m);
	}
	
	@Override
	public ArrayList<Friend> requestFriend(int friendOwner) {
		return fDao.requestFriend(sqlSession, friendOwner);
	}

	
}
