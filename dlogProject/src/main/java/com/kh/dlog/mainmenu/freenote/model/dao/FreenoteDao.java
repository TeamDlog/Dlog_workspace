package com.kh.dlog.mainmenu.freenote.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.mainmenu.freenote.model.vo.SearchCondition;

@Repository
public class FreenoteDao {

	// 프리노트
	public int selectListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("freenoteMapper.selectListCount", sc);
	}
	
	public ArrayList<Freenote> selectList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectList", sc, rowBounds);
	}
	
	public ArrayList<String> selectCategory(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectCategory", mno);
	}
	
	public int insertFreenote(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.insert("freenoteMapper.insertFreenote", fn);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("freenoteMapper.increaseCount", fno);
	}
	
	public Freenote selectFreenote(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.selectOne("freenoteMapper.selectFreenote", fn);
	}
	
	public int updateFreenote(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.update("freenoteMapper.updateFreenote", fn);
	}
	
	public int deleteFreenote(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("freenoteMapper.deleteFreenote", fno);
	}
	
	// 댓글
	public int selectReplyListCount(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("freenoteMapper.selectReplyListCount", fno);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, Freenote fn, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectReplyList", fn, rowBounds);
	}
	
	public ArrayList<Reply> selectReplyList2(SqlSessionTemplate sqlSession, Freenote fn) {
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectReplyList2", fn);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("freenoteMapper.insertReply", r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("freenoteMapper.deleteReply", rno);
	}
	
	public int checkLikePost(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.selectOne("freenoteMapper.checkLikePost", fn);
	}
	
	public int likePost(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.insert("freenoteMapper.likePost", fn);
	}
	
	public int dislikePost(SqlSessionTemplate sqlSession, Freenote fn) {
		return sqlSession.delete("freenoteMapper.dislikePost", fn);
	}
	
	public int checkLikeReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("freenoteMapper.checkLikeReply", r);
	}
	
	public int likeReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("freenoteMapper.likeReply", r);
	}
	
	public int dislikeReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.delete("freenoteMapper.dislikeReply", r);
	}
	
	// 커뮤니티
	public int selectCommListCount(SqlSessionTemplate sqlSession, String topicName) {
		return sqlSession.selectOne("freenoteMapper.selectCommListCount", topicName);
	}
	
	public ArrayList<Freenote> selectCommList(SqlSessionTemplate sqlSession, String topicName, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectCommList", topicName, rowBounds);
	}
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("freenoteMapper.selectSearchListCount", sc);
	}
	
	public ArrayList<Freenote> selectSearchList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectSearchList", sc, rowBounds);
	}
	
	public int checkReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.selectOne("freenoteMapper.checkReport", r);
	}
	
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("freenoteMapper.insertReport", r);
	}
	
	// 관리자
	public ArrayList<Freenote> selectAdminCommList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("freenoteMapper.selectAdminCommList");
	}
	
	public int deleteCommunity(SqlSessionTemplate sqlSession, String[] list) {
		int result = 0;
		for(int i=0; i<list.length; i++) {
			result = sqlSession.update("freenoteMapper.deleteFreenote", Integer.parseInt(list[i]));
		}
		return result;
	}
	
	
}
