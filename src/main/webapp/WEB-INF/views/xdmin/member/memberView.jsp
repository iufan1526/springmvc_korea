<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("br", "\n"); %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="${pageContext.request.contextPath}/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/common/css/xdmin.css" rel="stylesheet" type="text/css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
	
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
  <nav class="navbar">
    <div class="navbar_main">
      <i class="far fa-address-card"></i>
      <a href="/infra/xdmin/member/memberList">회원관리</a>
    </div>
   <!--  <div class="navbar_menu">
			<ul>
				<li><a href="/infra/xdmin/member/memberList">회원관리</a></li>
				<li><a href="">게시판관리</a></li>
				<li><a href="">제품관리</a></li>
				<li><a href="">이벤트관리</a></li>
				<li><a href="">팝업관리</a></li>
				<li><a href="">설문관리</a></li>
				<li><a href="">배너관리</a></li>
			</ul>		
		</div> -->
    <div class="navbar_logout">
      님 반갑습니다.
      <button type="button" class="btn btn-secondary">로그아웃</button>
    </div>
  </nav>
  
  <main>
  <form id="form" name="form" method="post" action="">
  	<input type="hidden" name="ifmmSeq" id="ifmmSeq" value="<c:out value="${rt.ifmmSeq}"/>">
  	<input type="hidden" name="shOption" id="shOption" value="<c:out value="${vo.shOption}"/>">
  	<input type="hidden" name="shValue" id="shValue" value="<c:out value="${vo.shValue}"/>">
    <table class="table view_table">
      <thead>
        <tr>
          <th scope="col">회원 기본정보</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="">프로필사진</th>
          <td><img src="../../../images/icon_kakao.svg" width="100px" height="100px"></td>
        </tr>
        <tr>
          <th scope="row">이름</th>
          <td><c:out value="${rt.ifmmName}"/></td>
        </tr>
        <tr>
          <th scope="row">성별</th>
          <td><c:out value="${rt.ifmmGender}"/></td>
        </tr>
      <!--   <tr>
          <th scope="row">(영문)이름</th>
          <td>KIM SEUNG TEA</td>
        </tr> -->
        <tr>
          <th scope="row">생일</th>
          <td colspan="2"><input type="date" value="${rt.ifmmDob}" readonly></td>
        </tr>
        <tr>
          <th scope="row">아이디</th>
          <td colspan="2"><c:out value="${rt.ifmmId}"/></td>
        </tr>
        <tr>
          <th scope="row">비밀번호</th>
          <td colspan="2"><c:out value="${rt.ifmmPassword}"/></td>
        </tr>
        <tr>
          <th scope="row">기존 이메일주소</th>
          <td colspan="2"><c:out value="${rt.ifmeEmailFull}"/></td>
        </tr>
        <tr>
          <th scope="row">국적</th>
          <td colspan="2"><input type="text" class="form-control" placeholder="" aria-label="First name" value="대한민국" readonly></td>
        </tr>
        <tr>
          <th scope="row">휴대전화번호</th>
          <td colspan="2">
            <c:out value="${rt.ifmeTelecom}"/>
            <c:out value="${rt.ifmeNumber}"/>
          </td>
        </tr>
        <tr>
          <th scope="row">주소</th>
          <td colspan="2"> <c:out value="${rt.ifmaAddress1}"/></td>
        </tr>
        <tr>
          <th scope="row">상세주소</th>
          <td colspan="2"> <c:out value="${rt.ifmaAddress2}"/></td>
        </tr>
        <tr>
          <th scope="row">자기소개</th>
          <td colspan="2"> 
          <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmDesc" class="form-label"></label>
            <%-- <p>${fn:replace(item.ifmmDesc, br, '<br/>')}</p> --%>
            <p><c:out value="${fn:replace(rt.ifmmDesc, br, '<br/>')}" escapeXml = "false"/></p>
        </div>
        </tr>
        <tr>
          <th scope="row">정보보관기간</th>
          <td colspan="2"> <c:out value="${rt.ifmmSaved}"/></td>
        </tr>
      </tbody>
    </table>
    <div class="main_botton">
      <a href="javascript:goList()"><button type="button" class="btn btn-success">목록</button></a>
      <a href="javascript:goEdit(<c:out value="${rt.ifmmSeq}"/>)"><button type="button" class="btn btn-success">수정</button></a>
      <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  삭제
	  </button>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        정말로 삭제하시겠습니까??
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <a href="/infra/xdmin/member/memberDele?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>"><button type="button" class="btn btn-danger">삭제</button></a>
	      </div>
	    </div>
	  </div>
	</div>
    </form>
  </main>
  
  
  
  
  
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/infra/resources/common/js/validation.js"></script>
	
	
	<script type="text/javascript">

	goList = function(){
		$("#form").attr("action","/infra/xdmin/member/memberList");
		$("#form").submit();
	};
	
	goEdit = function(seq){
		
		$("#ifmmSeq").val(seq);
		$("#form").attr("action","/infra/xdmin/member/memberEdit");
		$("#form").submit();
	};
	
</script>
</body>
</html>