package com.kh.dlog.mainmenu.account.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.dlog.mainmenu.account.model.service.AccountService;
import com.kh.dlog.mainmenu.account.model.vo.Account;


@Controller
public class AccountController {
	
	@Autowired
	private AccountService aService;
	
	@RequestMapping("accountList.ac")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		//System.out.print(currentPage);
				
		ArrayList<Account> list = aService.selectList();
		
		model.addAttribute("list",list);
		
		return "mainmenu/account/accountList";
		
	}
	
	@RequestMapping("accountDelete.ac")
	public String deleteAccount(int bno,  Model model) {
		
		int result = aService.deleteAccount(bno);
		
		if(result>0) {
			
			return "redirect:accountList.ac";
		}else {
		
			return "common/errorPage";
		}
			
		
	}
	
	@RequestMapping("accountEnrollForm.ac")
	public String enrollForm() {
		return "mainmenu/account/accountEnrollForm";
	}
	
	
	

	
	@ResponseBody
	@RequestMapping(value="accountInsert.ac",method = RequestMethod.GET, produces = "application/pkix-attr-cert;charset=utf8")
	public String selectAccountList(Account a) {
		// ajax요청
		
		aService.insertAccount(a);
		
		Account list = aService.selectAccountList();
		
	
		System.out.print(list);
		return new Gson().toJson(list);
		
		
	}

	
	
	
}
