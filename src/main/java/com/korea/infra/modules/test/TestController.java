package com.korea.infra.modules.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class TestController {
	
	@Autowired
	TestServiceImp service;
	
	
	@RequestMapping(value="xdmin/login/loginTestForm")
	public String loginTestForm() {
		
		return "xdmin/login/loginTestForm";
	}
	
	@RequestMapping(value="xdmin/login/index")
	public String index() {
		
		return "xdmin/login/index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "Test/loginProc")
	public Map<String, Object> loginProc(Test dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Test rtTest = service.selectOneLogin(dto);
		
		if(rtTest != null) {

			if(rtTest.getIfmmSeq() != null) {
	
				System.out.println(dto.getIfmmId()+"로그인 성공!!");
				httpSession.setAttribute("sessSeq", rtTest.getIfmmSeq());
				httpSession.setAttribute("sessId", rtTest.getIfmmId());
				httpSession.setAttribute("sessName", rtTest.getIfmmPassword());
				
				returnMap.put("rt", "success");
			} else {
				System.out.println("잘모쇴습니다");
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

}
