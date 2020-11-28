package com.kh.dlog.mypage.controlAll.model.Dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;

@Repository
public class ControlAllDao {
	
	public ControlAll ControlAllMain(SqlSession sqlSession,String memberNo) {
		return sqlSession.selectOne("controlAllMapper.controlAllMain", memberNo);
	}
	
	public int ActiveWidget(SqlSessionTemplate sqlSession,ControlAll ca) {
			return sqlSession.update("controlAllMapper.activeWidget", ca);
	}
	
	public int PrivacyWidget(SqlSessionTemplate sqlSession,ControlAll ca) {
			return sqlSession.update("controlAllMapper.privacyWidget", ca);
	}
	
}
