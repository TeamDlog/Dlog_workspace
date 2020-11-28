package com.kh.dlog.admin.notice.model.service;

import java.util.ArrayList;

import com.kh.dlog.admin.notice.model.vo.Notice;
import com.kh.dlog.common.model.vo.PageInfo;

public interface NoticeService {
		// 1. 공지사항 리스트 조회용 서비스
		int selectListCount();	
		
		ArrayList<Notice> selectList(PageInfo pi);
		
		// 2. 공지사항 상세조회용 서비스
		Notice selectNotice(int bno);
		
		// 3. 공지사항 검색 서비스
		int searchListCount(String condition, String keyword);	
		ArrayList<Notice> searchList(PageInfo pi, String condition, String keyword);
		
		// 4. 공지사항 삭제 서비스
		int deleteNotice(String[] arr);
		
		// 5. 공지사항 작성용 서비스
		int insertNotice(Notice n);
		
}
