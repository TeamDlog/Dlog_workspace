package com.kh.dlog.widget.voca.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.widget.voca.model.vo.Voca;

@Repository
public class VocaDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("vocaMapper.selectListCount", mno);
	}
	
	public ArrayList<Voca> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int mno){
		
		int offset=(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("vocaMapper.selectList", mno, rowBounds);
	}
	
	public int enrollVoca(SqlSessionTemplate sqlSession, Voca v) {
		return sqlSession.insert("vocaMapper.enrollVoca", v);
	}

}
