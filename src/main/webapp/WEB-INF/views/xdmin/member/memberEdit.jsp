<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

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
		
	<style type="text/css">
  	
  		body {
  		
  			font-family: Georgia, "맑은 고딕", serif;;
  		}
  	</style>
</head>
<body>
  <nav class="navbar">
    <div class="navbar_main">
      <i class="far fa-address-card"></i>
      <a href="/infra/xdmin/member/memberList">회원관리</a>
    </div>
    <div class="navbar_logout">
      <c:out value="${sessName }"/><span style="color:black">님 반갑습니다.</span>
      <button type="button" class="btn btn-secondary">로그아웃</button>
    </div>
  </nav>
  
  <main>
  <form id="form" name="form" method="post" action="/infra/xdmin/member/memberUpdt">
  	<input type="hidden" name="ifmmSeq" id="ifmmSeq" value="<c:out value="${rt.ifmmSeq}"/>">
  	<input type="hidden" name="shOption" id="shOption" value="<c:out value="${vo.shOption}"/>">
  	<input type="hidden" name="shValue" id="shValue" value="<c:out value="${vo.shValue}"/>">
  	<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
    <table class="table view_table">
      <thead>
        <tr>
          <th scope="col">회원 기본정보</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="">프로필사진</th>
          <td><img src="${pageContext.request.contextPath}/resources/user/image/images.png" width="100px" height="100px"></td>
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
          <td colspan="2"> <input type="password" class="form-control" id="ifmmPassword" name="ifmmPassword" placeholder="비밀번호를 입력해주세요" aria-label="First name" value=<c:out value="${rt.ifmmPassword}"/>></td>
        </tr>
        <tr>
          <th scope="row">이메일주소</th>
          <td colspan="2"> <input type="text" class="form-control" id="ifmeEmailFull" name="ifmeEmailFull" placeholder="" aria-label="First name" value="${rt.ifmeEmailFull}"></td>
        </tr>
        <tr>
          <th scope="row">국적</th>
          <td colspan="2"><input type="text" class="form-control" placeholder="" aria-label="First name" value="대한민국" readonly></td>
        </tr>
        <tr>
          <th scope="row">휴대전화번호</th>
          <td colspan="2">
            <select id="ifmeTelecomCd" name="ifmeTelecomCd">
              <option <c:if test="${rt.ifmeTelecomCd eq 18}">selected</c:if> value="18">SKT</option>
              <option <c:if test="${rt.ifmeTelecomCd eq 19}">selected</c:if> value="19">KT</option>
              <option <c:if test="${rt.ifmeTelecomCd eq 20}">selected</c:if> value="20">LGU+</option>
            </select>
            <input type="text" class="form-control" id="ifmeNumber" name="ifmeNumber" placeholder="" aria-label="First name" value="${rt.ifmeNumber}">
          </td>
        </tr>
        <tr>
          <th scope="row">주소</th>
          <td colspan="2"><input type="text" class="form-control" id="ifmaAddress1" name="ifmaAddress1" placeholder="" aria-label="First name" value="${rt.ifmaAddress1}"></td>
        </tr>
        <tr>
          <th scope="row">상세주소</th>
          <td colspan="2"><input type="text" class="form-control" id="ifmaAddress2" name="ifmaAddress2" placeholder="" aria-label="First name" value="${rt.ifmaAddress2}"></td>
        </tr>
        <tr>
          <th scope="row">자기소개</th>
          <td colspan="2"><textarea class="form-control" name="ifmmDesc" id="exampleFormControlTextarea1" rows="3"><c:out value="${rt.ifmmDesc}"/></textarea></td>
        </tr>
      </tbody>
    </table>
    <div class="main_botton">
      <a href="javascript:goUpdt(<c:out value="${rt.ifmmSeq}"/>)"><button type="button" class="btn btn-success">수정</button></a>
      <a href="javascript:goView(<c:out value="${rt.ifmmSeq}"/>)"><button type="button" class="btn btn-danger">취소</button></a>
    </div>
    </form>
  </main>
  
  
  
  
  
  
  
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
goUpdt = function(seq){
		
		$("#ifmmSeq").val(seq);
		$("#form").attr("action","/infra/xdmin/member/memberUpdt");
		$("#form").submit();
	};

</script>
</body>
</html>