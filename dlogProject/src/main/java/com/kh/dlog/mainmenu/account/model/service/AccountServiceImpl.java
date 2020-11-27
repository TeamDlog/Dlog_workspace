package com.kh.dlog.mainmenu.account.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.mainmenu.account.model.dao.AccountDao;
import com.kh.dlog.mainmenu.account.model.vo.Account;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired // new라는 객체생성없이 만들수 있는 어노테이션
	private AccountDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Account> selectList() {
		return aDao.selectList(sqlSession);
	}
	
	@Override
	public int deleteAccount(int bno) {
		return aDao.deleteAccount(sqlSession, bno);
	}
	
	@Override
	public int insertAccount(Account a) {
		return aDao.insertAccount(sqlSession, a);
	}
	
	@Override
	public Account selectAccountList() {
		return aDao.selectAccountList(sqlSession);
	}

}
