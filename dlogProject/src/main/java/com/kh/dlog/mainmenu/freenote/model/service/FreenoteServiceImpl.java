package com.kh.dlog.mainmenu.freenote.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.mainmenu.freenote.model.dao.FreenoteDao;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.mainmenu.freenote.model.vo.SearchCondition;

@Service
public class FreenoteServiceImpl implements FreenoteService {

	// 프리노트 관련
	@Autowired
	private FreenoteDao fDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(SearchCondition sc) {
		return fDao.selectListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Freenote> selectList(SearchCondition sc, PageInfo pi) {
		return fDao.selectList(sqlSession, sc, pi);
	}

	@Override
	public ArrayList<String> selectCategory(int mno) {
		return fDao.selectCategory(sqlSession, mno);
	}

	@Override
	public int insertFreenote(Freenote fn) {
		return fDao.insertFreenote(sqlSession, fn);
	}
	
	@Override
	public int increaseCount(int fno) {
		return fDao.increaseCount(sqlSession, fno);
	}

	@Override
	public Freenote selectFreenote(int fno, int loginUserNo) {
		Freenote fn = new Freenote();
		fn.setFreenoteNo(fno);
		fn.setFreenoteWriter(loginUserNo+"");
		return fDao.selectFreenote(sqlSession, fn);
	}

	@Override
	public int updateFreenote(Freenote fn) {
		return fDao.updateFreenote(sqlSession, fn);
	}

	@Override
	public int deleteFreenote(int fno) {
		return fDao.deleteFreenote(sqlSession, fno);
	}

	// 댓글 관련
	@Override
	public int selectReplyListCount(int fno) {
		return fDao.selectReplyListCount(sqlSession, fno);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int fno, int loginUserNo, PageInfo pi) {
		Freenote fn = new Freenote();
		fn.setFreenoteNo(fno);
		fn.setFreenoteWriter(loginUserNo+"");
		return fDao.selectReplyList(sqlSession, fn, pi);
	}

	@Override
	public ArrayList<Reply> selectReplyList2(int fno, int loginUserNo) {
		Freenote fn = new Freenote();
		fn.setFreenoteNo(fno);
		fn.setFreenoteWriter(loginUserNo+"");
		return fDao.selectReplyList2(sqlSession, fn);
	}

	@Override
	public int insertReply(Reply r) {
		return fDao.insertReply(sqlSession, r);
	}

	@Override
	public int deleteReply(int rno) {
		return fDao.deleteReply(sqlSession, rno);
	}
	
	@Override
	public int checkLikePost(Freenote fn) {
		return fDao.checkLikePost(sqlSession, fn);
	}

	@Override
	public int likePost(Freenote fn) {
		return fDao.likePost(sqlSession, fn);
	}

	@Override
	public int dislikePost(Freenote fn) {
		return fDao.dislikePost(sqlSession, fn);
	}

	@Override
	public int checkLikeReply(Reply r) {
		return fDao.checkLikeReply(sqlSession, r);
	}

	@Override
	public int likeReply(Reply r) {
		return fDao.likeReply(sqlSession, r);
	}

	@Override
	public int dislikeReply(Reply r) {
		return fDao.dislikeReply(sqlSession, r);
	}
	
	// 커뮤니티 관련
	@Override
	public int selectCommListCount(String topicName) {
		return fDao.selectCommListCount(sqlSession, topicName);
	}

	@Override
	public ArrayList<Freenote> selectCommList(String topicName, PageInfo pi) {
		return fDao.selectCommList(sqlSession, topicName, pi);
	}

	@Override
	public int selectSearchListCount(SearchCondition sc) {
		return fDao.selectSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Freenote> selectSearchList(SearchCondition sc, PageInfo pi) {
		return fDao.selectSearchList(sqlSession, sc, pi);
	}

	@Override
	public int checkReport(Report r) {
		return fDao.checkReport(sqlSession, r);
	}

	@Override
	public int insertReport(Report r) {
		return fDao.insertReport(sqlSession, r);
	}
	
	@Override
	public int checkFriend(Friend friend) {
		return fDao.checkFriend(sqlSession, friend);
	}

	@Override
	public int requestFriend(Friend friend) {
		return fDao.requestFriend(sqlSession, friend);
	}
	
	// 관리자 관련
	@Override
	public ArrayList<Freenote> selectAdminCommList() {
		return fDao.selectAdminCommList(sqlSession);
	}

	@Override
	public int deleteCommunity(String[] list) {
		return fDao.deleteCommunity(sqlSession, list);
	}


}
