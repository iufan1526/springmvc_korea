package com.korea.infra.modules.member;

import java.util.List;


public interface MemberService {
	
	public List<Member> selectList() throws Exception;

}