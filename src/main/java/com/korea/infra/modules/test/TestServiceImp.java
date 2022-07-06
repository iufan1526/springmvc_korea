package com.korea.infra.modules.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImp implements TestService{
	
	@Autowired
	TestDao dao;

	@Override
	public Test selectOneLogin(Test dto) throws Exception {
		return dao.selectOneLogin(dto);
	}

	
	

}
