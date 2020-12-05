package com.kh.dlog.member.model.service;

import java.util.ArrayList;

import com.kh.dlog.member.model.vo.Member;

public interface MemberService {
	
	int idCheck(String memberId);
	
	int nicknameCheck(String nickname);
	
	String idSearch(Member m);
	
	String pwdSearch(Member m);
	
	int pwdUpdate(Member m);
	
	Member loginMember(Member m);
	
	ArrayList<Member> selectMemberList();
	
	int insertMember(Member mn);
	
	int insertActive();
	
	int insertPrivacy();
	
	int insertColor();
	
	
	int infoUpdate(Member m);
	
	int nicknameCheck2(String nickname);
	
	int pfUpdate(int mno);
	
	int introInsert(Member m);
	
	int deleteMember(String memberId);

	int updatePwd(Member m);
	
	

}
