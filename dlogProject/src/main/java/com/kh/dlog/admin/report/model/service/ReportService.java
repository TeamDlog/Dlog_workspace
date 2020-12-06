package com.kh.dlog.admin.report.model.service;

import java.util.ArrayList;

import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;

public interface ReportService {
	
		// 1. 신고  리스트 조회용 서비스
		int selectListCount();	
		
		ArrayList<Report> selectList();
		
		// 2. 신고 상세조회용 서비스
		Report selectReport(int bno);
		
		// 3. 댓글 리스트 조회용 서비스
		Reply selectReply(int pNo);
		
		// 4. 신고 처리완료 서비스
		int updateReportProcess(Report r);
		
		// 5. 댓글 삭제용 서비스
		int adminReplyDelete(int reNo);
		
		// 6. 프리노트 리스트 조회용 서비스
		Freenote selectFreenote(int pNo);
		
		// 7. 프로노트 삭제용 서비스
		int adminFreenoteDelete(int frNo);
		
}
