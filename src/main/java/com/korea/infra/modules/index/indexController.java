package com.korea.infra.modules.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller

public class indexController {
	
//	@Autowired
//	MemberServiceImpl service;
	
	
// 로그인
	
	@RequestMapping(value = "index/indexView")
	public String indexView() throws Exception {
		
		return "/xdmin/index/indexView";
		
	}
	
	
	
	

}
