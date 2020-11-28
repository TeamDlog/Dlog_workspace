package com.kh.dlog.mainmenu.diary.model.service;

import java.util.ArrayList;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.mainmenu.diary.model.vo.Diary;

public interface DiaryService {
	
	int selectListCount();
	ArrayList<Diary> selectList(PageInfo pi);
	
	int insertDiary(Diary d);
	
	Diary detailDiary(int dno);
	
	int updateDiary(Diary dn);
	
	int deleteDiary(int dno);
	
	
}
