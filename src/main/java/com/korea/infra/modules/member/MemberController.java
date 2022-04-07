package com.korea.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller

public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
// 회원관리 	
	@RequestMapping(value = "xdmin/member/memberList")
	public String memberList(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {
		
//		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
//		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constant.DATE_INTERVAL) : UtilDateTime.add00TimeString(vo.getShDateStart()));
//		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addNowTimeString(vo.getShDateEnd()));

		//Count 가져오는 쿼리
		
			int sum = service.selectOneCount(vo);
			
			System.out.println(sum);
			
			vo.setParamsPaging(sum);
			
			//count 가0이아니면 lis 가져오는부분수후 모델에담
			
			
			if(sum != 0) {
			
				List<Member> list = service.selectList(vo);
				
				model.addAttribute("list", list);
				model.addAttribute("sum", sum);
			}else {
				System.out.println("값이없습니다");
			
			}
		
		return "xdmin/member/memberList";
		
	}
	
	@RequestMapping(value = "xdmin/member/memberView")
	public String memberView(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {
		
		System.out.println("vo.getShOption() " + vo.getShOption());
		System.out.println("vo.getShValue() " + vo.getShValue());
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		return "xdmin/member/memberView";
		
		
	}
	@RequestMapping(value = "xdmin/member/memberEdit")
	public String memberEdit(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {
		
		System.out.println("vo.getShOption() " + vo.getShOption());
		System.out.println("vo.getShValue() " + vo.getShValue());
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		return "xdmin/member/memberEdit";
		
		
	}
	@RequestMapping(value = "xdmin/member/memberForm")
	public String memberForm(@ModelAttribute("vo")MemberVo vo) throws Exception {
		
		System.out.println(" 폼 vo.getShOption() " + vo.getShOption());
		System.out.println(" 폼 vo.getShValue() " + vo.getShValue());
		
		return "xdmin/member/memberForm";
		
	}
	
	@RequestMapping(value = "xdmin/member/memberInst")
	public String memberInst(Member dto,MemberVo vo) throws Exception {
		
		service.insertMember(dto);
		service.insertAddress(dto);
		service.insertEmail(dto);
		service.insertPhone(dto);
		
		return "redirect:/xdmin/member/memberList";
		
	}
	
	@RequestMapping(value = "xdmin/member/memberDele")
	public String memberDele(MemberVo vo) throws Exception {
		
		service.deletePhone(vo);
		service.deleteEmail(vo);
		service.deleteAddress(vo);
		service.delete(vo);
		
		return "redirect:/xdmin/member/memberList";
		
	}
	
	@RequestMapping(value = "xdmin/member/memberUpdt")
	public String memberUpdt(Member dto,@ModelAttribute("vo")MemberVo vo) throws Exception {
		
		
		System.out.println("업데이트 vo.getShOption() " + vo.getShOption());
		System.out.println("업데이트 vo.getShValue() " + vo.getShValue());
		
		service.updateAddress(dto);
		service.updateEmail(dto);
		service.updatePhone(dto);
		service.update(dto);
		System.out.println("업데이트2 vo.getShValue() " + vo.getShValue());
		
		return "redirect:/xdmin/member/memberView?ifmmSeq=" + vo.getIfmmSeq() +"&shOption=" + vo.getShOption() +"&shValue=" + vo.getShValue() ; 
		
	}
	
	
// 로그인
	@RequestMapping(value = "xdmin/member/loginForm")
	public String loginForm() throws Exception {
		
		return "/xdmin/login/loginForm";
		
	}
	
	 
	@ResponseBody
	@RequestMapping(value = "member/loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(dto);

		if(rtMember != null) {

			if(rtMember.getIfmmSeq() != null) {
	
				httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember.getIfmmId());
				httpSession.setAttribute("sessName", rtMember.getIfmmName());
				
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/logoutProc")
	public Map<String, Object> logoutProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		returnMap.put("rt", "success");
	
		return returnMap;
	}
	
	
	
	

}
