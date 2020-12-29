package com.kh.dlog.mainmenu.diary.model.service;

import java.util.ArrayList;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;

public interface DiaryService {
	
	int selectListCount(int diaryMemberNo);
	ArrayList<Diary> selectList(PageInfo pi,int diaryMemberNo);
	
	int insertDiary(Diary d);
	
	int increaseCount(int dno);
	
	Diary detailDiary(int dno);
	
	int updateDiary(Diary dn);
	
	int deleteDiary(int dno);
	
	//댓글 리스트 조회용 서비스
	ArrayList<Reply> selectReply(int dno);
	
	//댓글 작성용 서비스
	int insertReply(Reply r);
}
