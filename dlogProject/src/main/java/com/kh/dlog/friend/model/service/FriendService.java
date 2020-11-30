package com.kh.dlog.friend.model.service;

import java.util.ArrayList;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.member.model.vo.Member;

public interface FriendService {

	int selectFriendListCount(int friendOwner);
	ArrayList<Friend> selectFriendList(int friendOwner, PageInfo pi);
	int deleteFriend(Friend f);
	ArrayList<Member> searchFriend(Member m);
	ArrayList<Member> findFriend(Member m);
	ArrayList<Friend> requestFriend(int friendOwner);
	
}
