package com.kh.dlog.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public int idCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.idCheck", memberId);
	}
	
	public int nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck", nickname);
	}
	
	public String idSearch(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idSearch", m);
	}
	
	public String pwdSearch(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.pwdSearch", m);
	}
	
	public int pwdUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.pwdUpdate", m);
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int insertActive(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertActive");
	}
	
	public int insertPrivacy(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertPrivacy");
	}
	
	public int insertColor(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertColor");
	}
	
	
	
	public ArrayList<Member> infoList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("memberMapper.infoList", null);
	}
	public int infoUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.infoUpdate", m);
	}
	
	public ArrayList<Member> introList(Member m, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.introList", m);
	}
	
	public ArrayList<Member> introListMn(Member m, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.introList", m);
	}
	
	public int introInsert(SqlSessionTemplate sqlSession, Member m) {
		
		System.out.println(m.getMemberName());
		return sqlSession.insert("memberMapper.introInsert", m);
		
	}
	
	
	
	public int introUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.introUpdate", m);
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updtePwd", m);
	}
	
}
