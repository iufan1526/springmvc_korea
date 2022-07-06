package com.korea.infra.modules.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;





@Repository
public class MemberDao {
	
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private static String namespace = "com.korea.infra.modules.member.MemberMpp";
	
	
	public List<Member> selectList(MemberVo vo){return sqlSession.selectList(namespace+ ".selectList",vo);}
	
	public Member selectOne(MemberVo vo){return sqlSession.selectOne(namespace+ ".selectOne",vo);}
	
	public Member selectOneLogin(Member dto){return sqlSession.selectOne(namespace+ ".selectOneLogin",dto);}
//등록	
	public int insertMember(Member dto) {return sqlSession.insert(namespace+".insertMember", dto);}
	
	public int insertEmail(Member dto) {return sqlSession.insert(namespace+".insertEmail", dto);}
	
	public int insertAddress(Member dto) {return sqlSession.insert(namespace+".insertAddress", dto);}
	
	public int insertPhone(Member dto) {return sqlSession.insert(namespace+".insertPhone", dto);}
	
	public int insert(Member dto) {return sqlSession.insert(namespace+".insert", dto);}
	
//삭제
	public int delete(MemberVo vo) {return sqlSession.delete(namespace+".delete", vo);}
	
	public int deleteAddress(MemberVo vo) {return sqlSession.delete(namespace+".deleteAddress", vo);}
	
	public int deleteEmail(MemberVo vo) {return sqlSession.delete(namespace+".deleteEmail", vo);}
	
	public int deletePhone(MemberVo vo) {return sqlSession.delete(namespace+".deletePhone", vo);}
	
	public int selectOneCount(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
		
	
//업데이트 

	public int update(Member dto) {return sqlSession.update(namespace+".update", dto);}
	public int updateRest(Member dto) {return sqlSession.update(namespace+".updateRest", dto);}
	public int updateAddress(Member dto) {return sqlSession.update(namespace+".updateAddress", dto);}
	public int updateEmail(Member dto) {return sqlSession.update(namespace+".updateEmail", dto);}
	public int updatePhone(Member dto) {return sqlSession.update(namespace+".updatePhone", dto);}
}
