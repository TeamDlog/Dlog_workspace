package com.kh.dlog.admin.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.admin.report.model.dao.ReportDao;
import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;

@Service 
public class ReportServiceImpl implements ReportService {
	
	@Autowired // new라는 객체생성없이 만들수 있는 어노테이션
	private ReportDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		 return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Report> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}
	
	@Override
	public Report selectReport(int bno) {
		return rDao.selectReport(sqlSession, bno);
	}
	
	@Override
	public Reply selectReply(int pNo) {
		return rDao.selectReply(sqlSession, pNo);
	}
	
	@Override
	public int updateReportProcess(Report r) {
		return rDao.updateReportProcess(sqlSession, r);
	}
	
	@Override
	public int adminReplyDelete(int reNo) {
		return rDao.adminReplyDelete(sqlSession, reNo);
	}
	
	@Override
	public Freenote selectFreenote(int pNo) {
		return rDao.selectFreenote(sqlSession, pNo);
	}
	
	@Override
	public int adminFreenoteDelete(int frNo) {
		return rDao.adminFreenoteDelete(sqlSession, frNo);
	}
}
