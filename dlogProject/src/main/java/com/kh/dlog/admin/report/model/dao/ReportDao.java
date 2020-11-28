package com.kh.dlog.admin.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;

@Repository
public class ReportDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}
	
	public ArrayList<Report> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectList", null, rowBounds);
	}
	
	public Report selectReport(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("reportMapper.selectReport", bno);
	}
	
	public Reply selectReply(SqlSessionTemplate sqlSession, int pNo){
		return sqlSession.selectOne("reportMapper.selectReply", pNo);
	}
	
	public int updateReportProcess(SqlSessionTemplate sqlSession,Report r) {
		return sqlSession.insert("reportMapper.updateReportProcess", r);
	}
	
	public int adminReplyDelete(SqlSessionTemplate sqlSession, int reNo) {
		return sqlSession.update("reportMapper.adminReplyDelete", reNo);
	}
	
	public Freenote selectFreenote(SqlSessionTemplate sqlSession, int pNo){
		return sqlSession.selectOne("reportMapper.selectFreenote", pNo);
	}
	
	public int adminFreenoteDelete(SqlSessionTemplate sqlSession, int frNo) {
		return sqlSession.update("reportMapper.adminFreenoteDelete", frNo);
	}
}
