
package com.korea.infra.modules.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



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
	@RequestMapping(value = "xdmin/member/testView")
	public String testView(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {
		
		
		String apiUrl = "http://localhost:8080/infra/rest/member";
		
		//api 를 호출해서 데이터를 받아온다.
		
		   
		   URL url = new URL(apiUrl);
		   HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		   httpURLConnection.setRequestMethod("GET");
		   
		   BufferedReader bufferedReader;
		   if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		   } else {
			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		   }
		   
		   StringBuilder stringBuilder = new StringBuilder();
		   String line;
		   while  ((line = bufferedReader.readLine()) != null) {
				/* System.out.println("line: " + line); */
			   stringBuilder.append(line);
		   }
		   
		   bufferedReader.close();
		   httpURLConnection.disconnect();
		   
		   //-------------------------
		   
			/* System.out.println("final line:" + stringBuilder.append(line)); */
		   
		   ObjectMapper objectMapper = new ObjectMapper();
		   List<Member> memberList = objectMapper.readValue(stringBuilder.toString(), new TypeReference<List<Member>>(){});
		   
		   model.addAttribute("list", memberList);
//		   Member member = objectMapper.readValue(stringBuilder.toString(), Member.class);
//		   
//		   model.addAttribute("item", member);
		
		
		return "xdmin/member/testView";
		
	}
//	@RequestMapping(value = "xdmin/member/publicCorona1List")
//	public String publicCorona1List(Model model) throws Exception {
//		
//		String apiUrl = "http://apis.data.go.kr/1471000/CovidDagnsRgntProdExprtStusService/getCovidDagnsRgntProdExprtStusInq?serviceKey=3nc20LL7gZSQWnltTvsoGOFaQSO62khwDAzWJ%2FRdaaqdK9GXCjG3GZus%2FvH5P1vGC%2B6uAKu3lnkrsKJqEkN%2BDg%3D%3D&numOfRows=3&pageNo=1&type=json";
//		
//		//api 를 호출해서 데이터를 받아온다.
//		
//		   
//		   URL url = new URL(apiUrl);
//		   HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
//		   httpURLConnection.setRequestMethod("GET");
//		   
//		   BufferedReader bufferedReader;
//		   if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
//			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
//		   } else {
//			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
//		   }
//		   
//		   StringBuilder stringBuilder = new StringBuilder();
//		   String line;
//		   while  ((line = bufferedReader.readLine()) != null) {
//				/* System.out.println("line: " + line); */
//			   stringBuilder.append(line);
//		   }
//		   
//		   bufferedReader.close();
//		   httpURLConnection.disconnect();
//		   
//		   System.out.println(stringBuilder.toString());
//		   
//		   ObjectMapper objectMapper = new ObjectMapper();
//		   Map<String,Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
//		   
//		   
//		   for(String key : map.keySet()) {
//			   String value = String.valueOf(map.get(key));
//			   System.out.println("[key]: " + key + "[value]"+ value);
//			   
//		   }
//		   
//		   Map<String,Object> header = new HashMap<String , Object>();
//		   header = (Map<String, Object>)map.get("header");
//		   
//		   
//		   for(String key : header.keySet()) {
//			   String value = String.valueOf(header.get(key));
//			   System.out.println(key + value);
//			   
//		   }
//		   
//		   String aaa = (String)header.get("resultCode");
//		   
//		   
//		   System.out.println(header.get("resultCode"));
//		   System.out.println(header.get("resultMsg"));
//		   
//		   Map<String,Object> body = new HashMap<String , Object>();
//		   body = (Map<String, Object>)map.get("body");
//		   
//		   List<Home> items = new ArrayList<Home>();
//		   items = (List<Home>)body.get("items");
//		   
//		  
//		  model.addAllAttributes(header);
//		  model.addAllAttributes(body);
//		   
//		return "xdmin/member/publicCorona1List";
//		
//	}
	@RequestMapping(value = "xdmin/member/publicCoronaJsonNodeList")
	public String publicCoronaJsonNodeList(Model model) throws Exception {
		
		String apiUrl = "http://apis.data.go.kr/1471000/CovidDagnsRgntProdExprtStusService/getCovidDagnsRgntProdExprtStusInq?serviceKey=3nc20LL7gZSQWnltTvsoGOFaQSO62khwDAzWJ%2FRdaaqdK9GXCjG3GZus%2FvH5P1vGC%2B6uAKu3lnkrsKJqEkN%2BDg%3D%3D&numOfRows=3&pageNo=1&type=json";
		
		URL url = new URL(apiUrl);
		   HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		   httpURLConnection.setRequestMethod("GET");
		   
		   BufferedReader bufferedReader;
		   if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		   } else {
			   bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		   }
		   
		   StringBuilder stringBuilder = new StringBuilder();
		   String line;
		   while  ((line = bufferedReader.readLine()) != null) {
				/* System.out.println("line: " + line); */
			   stringBuilder.append(line);
		   }
		   
		   bufferedReader.close();
		   httpURLConnection.disconnect();
		   
		   System.out.println(stringBuilder.toString());
		   
		   ObjectMapper objectMapper = new ObjectMapper();
		   JsonNode node = objectMapper.readTree(stringBuilder.toString());
		   
		   
		   System.out.println(node.get("header").get("resultCode").asText());
		   System.out.println(node.get("header").get("resultMsg").asText());
		   System.out.println(node.get("body").get("items").get(0).get("KIT_EXPRT_QTY").asText());
		   
		   model.addAttribute("node", node);
		
	
		return "xdmin/member/publicCoronaJsonNodeList";
		
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
		
//		MultipartFile multipartFile = dto.getFile();
//		String fileName = multipartFile.getOriginalFilename();
//		String ext =fileName.substring(fileName.lastIndexOf(".")+ 1);
//		String uuid = UUID.randomUUID().toString();
//		String uuidFileName = uuid + "." + ext;
//		multipartFile.transferTo(new File("/Users/admin/Desktop/Fectory/ws_sts3/springmvc_korea/src/main/webapp/resources/upload/"+ uuidFileName));
		
		// 입력을 작동시킨다.
		
		service.insertMember(dto);
		service.insertAddress(dto);
		service.insertEmail(dto);
		service.insertPhone(dto);
		
		return "redirect:/xdmin/member/memberList";
		
	}
	@RequestMapping(value = "xdmin/member/insert")
	public String insert(Member dto,MemberVo vo) throws Exception {
		
		
		service.insert(dto);
		
		return "/xdmin/index/form";
		
	}
	@RequestMapping(value = "xdmin/member/form")
	public String form() throws Exception {
		
		return "/xdmin/index/form";
		
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
	
				System.out.println(dto.getIfmmId()+"로그인 성공!!");
				httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember.getIfmmId());
				httpSession.setAttribute("sessName", rtMember.getIfmmName());
				
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
	
	@ResponseBody
	@RequestMapping(value = "member/logoutProc")
	public Map<String, Object> logoutProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		returnMap.put("rt", "success");
	
		return returnMap;
	}
	
	
	
	
	

}
