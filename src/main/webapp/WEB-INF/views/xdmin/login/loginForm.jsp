<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
	<style type="text/css">

	
		header {
		
			height:7vh;
		}
		main{
		
			height:90vh;
			
		}
		footer{
			
			height:10vh;
		}
		.navbar_main{
			color: white;
			font-size: 40px;
		}
		.navbar_main div a {
			text-decoration: none;
			color: white;
		}

	</style>
	<link href="${pageContext.request.contextPath}/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<body >

	<header style="background-color:#d5d5d5">
		<nav class="navbar_main">
			<div>
				<i class="far fa-address-card"></i>
				<a href="/xdmin/member/loginForm">회원관리</a>
			</div>
		</nav>
	</header>
	
	<form id="form" name="form" method="post" action="">	
	<main>
		<form class="" method="post" action="" id="" name="">
			<div class="container">
				<div class="row g-5">
					<div class="col-12"><h2>Login</h2></div>
					<div class="col-12">
						<input type="text" class="form-control" id="ifmmId" name="ifmmId"placeholder="아이디" aria-label="First name" maxlength="20">
					</div>
					<div class="col-12">
						<input type="password" class="form-control" id="ifmmPassword" name="ifmmPassword" placeholder="비밀번호" aria-label="Last name" maxlength="20">
					</div>
					<div class="col-8">
						<input type="checkbox" id="" name="">로그인상태유지
					</div>
					<div class="col-4">
						<a href="">아이디찾기</a> <a href="">비밀번호찾기</a>
					</div>
					<div class="col">

						<div class="d-grid gap-2 col-6 mx-auto">
	 					 	<button class="btn btn-primary" type="button" id="btnSubmit" name="btnSubmit">로그인</button>
	 					 	<button class="btn btn-warning" type="button"><img src="../../../images/icon_kakao.svg" width="30px">카카오톡 으로 로그인하기</button>
	 					 	<button class="btn btn-success" type="button"><img src="../../../images/icon_naver.png" width="30px">네이버 으로 로그인하기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</main>
	</form>
	<footer style="background-color:#d5d5d5"> 
	</footer>



		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<script type="text/javascript">
	
		$("#btnSubmit").on("click",function(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/infra/member/loginProc"
				,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPassword" : $("#ifmmPassword").val()}
				,success: function(response) {
					if(response.rt == "success") {
						location.href = "/infra/xdmin/member/memberList";
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
</body>
</html>