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
	
	int insertMember(Member m);
	
	int insertActive();
	
	int insertPrivacy();
	
	int insertColor();
	
	
	ArrayList<Member> infoList();
	
	int infoUpdate(Member m);
	
	ArrayList<Member> introList(Member m);
	
	ArrayList<Member> introListMn(Member m);
	
	int introInsert(Member m);
	
	int introUpdate(Member m);

	int deleteMember(String memberId);

	int updatePwd(Member m);
	
	
	

}
