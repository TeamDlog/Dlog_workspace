package com.kh.dlog.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	
	
	
	public ArrayList<Member> infoList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("memberMapper.infoList", null);
	}
	public int infoUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.infoUpdate", m);
	}
	
	public ArrayList<Member> introList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memeberMapper.introList", null);
	}
}
