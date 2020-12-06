package com.kh.dlog.admin.inquiry.model.service;

import java.util.ArrayList;

import com.kh.dlog.admin.inquiry.model.vo.Inquiry;
import com.kh.dlog.common.model.vo.PageInfo;


public interface InquiryService {
	
	
	
	// 1. 1:1문의  리스트 조회용 서비스
	int selectListCount();	
	
	ArrayList<Inquiry> selectList();
	
	// 2. 1:1문의 상세조회용 서비스
	Inquiry selectInquiry(int bno);
	
	// 3. 1:1문의 입력 서비스
	int insertInquiry(Inquiry i);
	
	// 4. 1:1문의 답변 입력 서비스
	int insertInquiryAnswer(Inquiry i);
	
	//5. 1:1문의 처리완료 서비스
	int updateInquiryProcess(Inquiry i);
	
}
