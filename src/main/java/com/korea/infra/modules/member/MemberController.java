package com.korea.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller

public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	
	@RequestMapping(value = "xdmin/member/memberList")
	public String memberList(Model model) throws Exception {
		
		
		List<Member> list = service.selectList();
		model.addAttribute("list", list);
		
		return "xdmin/member/memberList";
		
	}

}
