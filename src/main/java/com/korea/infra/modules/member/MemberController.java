package com.korea.infra.modules.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.korea.infra.common.constants.Constant;
import com.korea.infra.common.util.UtilDateTime;
import com.mysql.cj.Constants;



@Controller

public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
// 회원관리 	
	@RequestMapping(value = "xdmin/member/memberList")
	public String memberList(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {
		
	

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
		
		MultipartFile multipartFile = dto.getFile();
		String fileName = multipartFile.getOriginalFilename();
		String ext =fileName.substring(fileName.lastIndexOf(".")+ 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		multipartFile.transferTo(new File("/Users/admin/Desktop/Fectory/ws_sts3/springmvc_korea/src/main/webapp/resources/upload/"+ uuidFileName));
		
		// 입력을 작동시킨다.
		dto.setOriginalFileName(fileName);
		dto.setUuidFileName(uuidFileName);
		
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
		
		return "redirect:/xdmin/member/memberView?ifmmSeq=" + vo.getIfmmSeq() +"&shOption=" + vo.getShOption() +"&shValue=" + vo.getShValue() +"&thisPage=" + vo.getThisPage() ; 
		
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
	
	
	@ResponseBody //구글 로그인
	@RequestMapping(value = "/member/GloginProc")
	public Map<String, Object> GloginProc(@RequestParam("ifmmId")String name,Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		System.out.println(name);
	
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	
	
	

}
