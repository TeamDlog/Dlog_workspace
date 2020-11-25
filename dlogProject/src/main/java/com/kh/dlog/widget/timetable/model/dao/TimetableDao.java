package com.kh.dlog.widget.timetable.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.widget.timetable.model.vo.Timetable;

@Repository
public class TimetableDao {
	
	public ArrayList<Timetable> timetableList(SqlSessionTemplate sqlSession, int timetableWriter){
		return (ArrayList)sqlSession.selectList("timetableMapper.timetableList", timetableWriter);
	}
	
	public int insertTimetableCheck(SqlSessionTemplate sqlSession, Timetable t) {
		
		return sqlSession.selectOne("timetableMapper.insertTimetableCheck", t);
	}
	
	public int insertTimetable(SqlSessionTemplate sqlSession, Timetable t) {
		return sqlSession.insert("timetableMapper.insertTimetable", t);
	}
	
	public int insertDeleteTimetable(SqlSessionTemplate sqlSession, Timetable t) {
		return sqlSession.delete("timetableMapper.insertDeleteTimetable", t);
	}
	
	public int updateTimetableCheck(SqlSessionTemplate sqlSession, Timetable t) {
		return sqlSession.selectOne("timetableMapper.updateTimetableCheck", t);
	}
	
	public int updateTimetable(SqlSessionTemplate sqlSession, Timetable t){
		return sqlSession.update("timetableMapper.updateTimetable", t);
	}
	
	public int updateDeleteTimetable(SqlSessionTemplate sqlSession, Timetable t) {
		return sqlSession.delete("timetableMapper.updateDeleteTimetable", t);
	}
	
	public int deleteTimetable(SqlSessionTemplate sqlSession, String[] deleteTimetableCheck) {
		
		int result = 0;
		
		for(String tNo : deleteTimetableCheck) {
			result += sqlSession.delete("timetableMapper.deleteTimetable", tNo);
		}
		
		return result;
	}
	
	public int resetTimetable(SqlSessionTemplate sqlSession, String timetableWriter) {
		return sqlSession.delete("timetableMapper.resetTimetable", timetableWriter);
	}
	
}
