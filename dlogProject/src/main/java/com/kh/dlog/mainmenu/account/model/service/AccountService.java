package com.kh.dlog.mainmenu.account.model.service;

import java.util.ArrayList;

import com.kh.dlog.mainmenu.account.model.vo.Account;


public interface AccountService {
	
	
	ArrayList<Account> selectList();
	
	int deleteAccount(int bno);
	
	int insertAccount(Account a);
	
	Account selectAccountList();
}
