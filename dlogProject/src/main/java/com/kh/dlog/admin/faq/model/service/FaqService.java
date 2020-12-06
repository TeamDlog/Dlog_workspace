package com.kh.dlog.admin.faq.model.service;

import java.util.ArrayList;

import com.kh.dlog.admin.faq.model.vo.Faq;
import com.kh.dlog.common.model.vo.PageInfo;



public interface FaqService {
		
	
		// 1. 게시판 리스트 조회용 서비스
		int selectListCount();	
		ArrayList<Faq> serviceMain();
		ArrayList<Faq> selectList();
		
		// 2. 게시판 상세조회용 서비스
		int increaseCount(int bno);
		Faq selectFaq(int bno);
		
		// 3. 게시판 검색 서비스
		int searchListCount(String condition, String keyword);	
		ArrayList<Faq> searchList(PageInfo pi, String condition, String keyword);
		
		// 4. 게시판 삭제 서비스
		int deleteFaq(String[] arr);
		
		// 5. 게시판 작성용 서비스
		int insertFaq(Faq f);
}
