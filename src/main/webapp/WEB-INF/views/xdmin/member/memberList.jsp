<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<% pageContext.setAttribute("br", "\n"); %>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link href="${pageContext.request.contextPath}/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/common/css/xdmin.css" rel="stylesheet" type="text/css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">	
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
	<form method="post" id="form" name="form" action="/infra/xdmin/member/memberList">
		<input type="hidden" id="ifmmSeq" name="ifmmSeq">
		<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<nav class="navbar">
			<div class="navbar_main">
				<i class="far fa-address-card"></i>
				<a href="/infra/xdmin/member/memberList">회원관리</a>
			</div>
			<div class="navbar_logout">
			     <c:out value="${sessName }"/><span style="color:black">님 반갑습니다.</span><%-- <div style="text-align:center">${result}</div> --%>
				<button type="button" class="btn btn-secondary" id="btnLogout" name="btnLogout">로그아웃</button>
			</div>
		</nav>
		<main>
			<section class="section_search">
				<div class="section_search_menu">
					<ul>
						<li>검색어
							<select class="form-select form-select-sm"id="shOption" name="shOption" aria-label="Default select example" data-width="50%" style="width:200px; margin: 10px;">
							  <option value="0"selected>검색어를 선택해주세요</option>
							  <option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>이름</option>
							  <option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>아이디</option>
							</select>
							<input type="text"  id="shValue" name="shValue" style="height:23px; margin: 10px;"maxlength="20" value="<c:out value="${vo.shValue}"/>">
						</li>
						<li>
							<button type="submit" class="btn btn-outline-primary" id="btnSubmit" name="search">검색</button>
						</li>
					</ul>
				</div>
			</section>
			<section class="section_table">
				<div>
					<h5>Total:<c:out value="${vo.totalRows}"/></h5>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">성별</th>
								<th scope="col">아이디</th>
								<th scope="col">전화번호</th>
								<th scope="col">생일</th>
								<!-- <th scope="col">가입일</th> -->
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr>
										<td class="text-center" colspan="9">There is no data!</td>
									</tr>	
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="item" varStatus="status">
										<tr>
											<td scope="col"><c:out value="${item.ifmmSeq}"/></td>
<%-- 											<td scope="col"><a href="/infra/xdmin/member/memberView?ifmmSeq=${item.ifmmSeq}&shOption=<c:out value="${vo.shOption}"/>&shValue=<c:out value="${vo.shValue}"/>"/><c:out value="${item.ifmmName}"/></a></td> --%>
											<td scope="col"><a href="javascript:goView(<c:out value="${item.ifmmSeq}"/>);"><c:out value="${item.ifmmName}"/></a></td>
											<td scope="col"><c:out value="${item.ifmmGender}"/></td>
											<td scope="col"><c:out value="${item.ifmmId}"/></td>
											<td scope="col">	
											<c:set var="numberPhone" value="${item.ifmeNumber }"/>
							                	<c:choose>
							                		<c:when test="${fn:length(numberPhone) eq 10 }">
														<c:out value="${fn:substring(numberPhone,0,3)}"/>
														- <c:out value="${fn:substring(numberPhone,3,6)}"/>
														- <c:out value="${fn:substring(numberPhone,6,10)}"/>
							                		</c:when>
							                		<c:otherwise>
														<c:out value="${fn:substring(numberPhone,0,3)}"/>
														- <c:out value="${fn:substring(numberPhone,3,7)}"/>
														- <c:out value="${fn:substring(numberPhone,7,11)}"/>
							                		</c:otherwise>
							               		</c:choose>
											</td>
											<td scope="col"><fmt:formatDate pattern = "yyyy/MM/dd" value="${item.ifmmDob}"/></td>
											<%-- <td scope="col"><fmt:formatDate pattern = "yyyy-MM-dd'T'HH:mm:ss" value="${item.regDateTimeSvr}"/></td> --%>
										</tr>								
									</c:forEach>
								</c:otherwise>
							</c:choose>	
						</tbody>
					</table>
				</div>
				
				
				<div class="section_botton">
	                <%-- <nav aria-label="...">
						<ul class="pagination">
							<c:if test="${vo.startPage gt vo.pageNumToShow}">
								<li class="page-item"><a class="page-link"
									href="/infra/xdmin/member/memberList?thisPage=${vo.startPage - 1}&shOption=<c:out value="${vo.shOption}"/>&shOption=<c:out value="${vo.shValue}"/>">Previous</a></li>
							</c:if>
							<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
								<c:choose>
									<c:when test="${i.index eq vo.thisPage}">
										<li class="page-item active"><a class="page-link"
											href="/infra/xdmin/member/memberList?thisPage=${i.index}">${i.index}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="/infra/xdmin/member/memberList?thisPage=${i.index}">${i.index}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${vo.endPage ne vo.totalPages}">
								<li class="page-item"><a class="page-link"
									href="/infra/xdmin/member/memberList?thisPage=${vo.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
						</nav> --%>
						<nav aria-label="...">
						  <ul class="pagination">
						    <c:if test="${vo.startPage gt vo.pageNumToShow}">
						                <li class="page-item"><a class="page-link" href="javascript:goList(<c:out value="${vo.startPage - 1}"/>);">Previous</a></li>
						</c:if>
						<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
							<c:choose>
								<c:when test="${i.index eq vo.thisPage}">
						                <li class="page-item active"><a class="page-link" href="javascript:goList(<c:out value="${i.index}"/>);">${i.index}</a></li>
								</c:when>
								<c:otherwise>             
						                <li class="page-item"><a class="page-link" href="javascript:goList(<c:out value="${i.index}"/>);">${i.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>     
						<c:if test="${vo.endPage ne vo.totalPages}">                
						                <li class="page-item"><a class="page-link" href="javascript:goList(<c:out value="${i.index + 1}"/>);">Next</a></li>
						</c:if>  
						  </ul>
						</nav>
	
						<div class="d-grid gap-2 d-md-block">						
							<a href="javascript:goForm()"><button type="button" class="btn btn-outline-primary">등록</button></a>
						</div>
					</div>
			</section>
			</form>
		</main>
	<footer>
	</footer>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/infra/resources/common/js/validation.js"></script>
	
	
	<script type="text/javascript">

	goView = function(seq){
		$("#ifmmSeq").val(seq);
		$("#form").attr("action","/infra/xdmin/member/memberView");
		$("#form").submit();
		
	};
	goForm = function(){
		$("#form").attr("action","/infra/xdmin/member/memberForm");
		$("#form").submit();
		
	};
	
	goList = function(seq){
		$("#thisPage").val(seq);
		$("#form").attr("action","/infra/xdmin/member/memberList");
		$("#form").submit();
		
	};
	
	$("btnSubmit").on("click",function(){
	if(!checkValue($("#shOption").val(), "검색어를 입력해주세요")) return false;
	
	});
	
	$("#btnLogout").on("click",function(){
		alert("로그아웃되었습니다");
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/infra/member/logoutProc"
			,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPassword" : $("#ifmmPassword").val()}
			,success: function(response) {
				if(response.rt == "success") {
					location.href = "/infra/xdmin/member/loginForm";
				} else {
					alert("회원없음");
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});

	});
	
</script>
	<!-- <script type="text/javascript">
	  var naver_id_login = new naver_id_login("Zq1ggbTsBbjnfgSnMFN2", "http://localhost:8080/infra/xdmin/member/memberList");
	  // 접근 토큰 값 출력
	  alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	    alert(naver_id_login.getProfileData('nickname'));
	    alert(naver_id_login.getProfileData('age'));
	  }
	</script> -->
</body>
</html>