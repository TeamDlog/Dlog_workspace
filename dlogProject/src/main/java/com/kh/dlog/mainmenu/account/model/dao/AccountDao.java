package com.kh.dlog.mainmenu.account.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.mainmenu.account.model.vo.Account;



@Repository
public class AccountDao {
	
	public ArrayList<Account> selectList(SqlSessionTemplate sqlSession, int diaryMemberNo){
		
		return (ArrayList)sqlSession.selectList("accountMapper.selectList", diaryMemberNo);
	}
	
	public int deleteAccount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("accountMapper.deleteAccount", bno);
	}
	
	public int insertAccount(SqlSessionTemplate sqlSession, Account a) {
		return sqlSession.insert("accountMapper.insertAccount", a);
	}
	
	public Account selectAccountList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("accountMapper.selectAccountList");
	}
}
