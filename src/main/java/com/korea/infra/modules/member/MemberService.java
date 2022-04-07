package com.korea.infra.modules.member;

import java.util.List;


public interface MemberService {
	
	public List<Member> selectList(MemberVo vo) throws Exception;
	
	public Member selectOne(MemberVo vo) throws Exception;
	
	public Member selectOneLogin(Member dto) throws Exception;
	
//등록	
	public int insertMember(Member dto) throws Exception;
	
	public int insertEmail(Member dto) throws Exception;
	
	public int insertAddress(Member dto) throws Exception;
	
	public int insertPhone(Member dto) throws Exception;
	
	
	
//삭제
	public int delete(MemberVo vo) throws Exception;
	
	public int deleteAddress(MemberVo vo) throws Exception;
	
	public int deleteEmail(MemberVo vo) throws Exception;
	
	public int deletePhone(MemberVo vo) throws Exception;
	
	public int selectOneCount(MemberVo vo) throws Exception;
	
//업데이트
	public int update(Member dto) throws Exception;
	
	public int updateAddress(Member dto) throws Exception;
	
	public int updateEmail(Member dto) throws Exception;
	
	public int updatePhone(Member dto) throws Exception;

}
