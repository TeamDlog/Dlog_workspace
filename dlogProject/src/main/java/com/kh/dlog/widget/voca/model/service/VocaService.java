package com.kh.dlog.widget.voca.model.service;

import java.util.ArrayList;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.widget.voca.model.vo.Voca;

public interface VocaService {
	
	int selectListCount(int mno);
	ArrayList<Voca> selectList(PageInfo pi, int mno);

}
