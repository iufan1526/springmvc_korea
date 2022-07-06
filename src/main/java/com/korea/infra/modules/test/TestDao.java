package com.korea.infra.modules.test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class TestDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private static String namespace = "com.korea.infra.modules.test.TestMpp";
	
	
	public Test selectOneLogin(Test dto){return sqlSession.selectOne(namespace+ ".selectOneLogin",dto);}

}
