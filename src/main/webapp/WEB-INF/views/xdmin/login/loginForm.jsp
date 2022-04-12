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
	  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	  <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
		<meta name ="google-signin-client_id" content="305452660396-i5igghn6uiffrgp55575j71fd920mhlr.apps.googleusercontent.com">
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
				<!-- 네이버 로그인 버튼 노출 영역 -->
				  <div id="naver_id_login"></div>
				  <!-- //네이버 로그인 버튼 노출 영역 -->
		  
		   <button class="btn btn-sm" type="button" id="GgCustomLogin">
    			<a href="javascript:void(0)" style="text-decoration: none;">
    				<p>구글로그인</p>
    			</a>
    		</button>
		  
		
    	
		</form>
	</main>
	</form>
	<footer style="background-color:#d5d5d5"> 
	</footer>



		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<script type="text/javascript">
		  	var naver_id_login = new naver_id_login("Zq1ggbTsBbjnfgSnMFN2", "http://localhost:8080/infra/xdmin/member/memberList");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("white", 2,40);
		  	naver_id_login.setDomain("http://localhost:8080");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login(); 
	
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
	
	<!-- 네이버연동 -->
	
	<script type="text/javascript">
	 	//네이버
	  	var naver_id_login = new naver_id_login("USpoTYKAVQ5tOtLqcoGA", "http://localhost:8080/infra/xdmin/member/memberList");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:8080/");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  	
	  	
	  </script>
	
	<!-- 네이버연동 -->
	
	<!-- 구글연동 -->
	<script>
		
		//처음 실행하는 함수
		function init() {
			gapi.load('auth2', function() {
				gapi.auth2.init();
				options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
		        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
		        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
				gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
			})
		}

		function onSignIn(googleUser) {
			var access_token = googleUser.getAuthResponse().access_token
			$.ajax({
		    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
				/* url: 'https://people.googleapis.com/v1/people/me' */
		        // key에 자신의 API 키를 넣습니다.
		        	/* url : "/infra/member/GloginProc" */
				 data: {personFields:'birthdays', key:'AIzaSyCYPm6zbp9Bls-A50NAey2g2qY4durAQag', 'access_token': access_token}
				, method:'GET'
			})
			.done(function(e){
		        //프로필을 가져온다.
		     
				 var profile = googleUser.getBasicProfile();
				/* console.log(profile); */
				var id= profile.getId();
				var username = profile.getName();
				
				console.log(username);
				alert(profile.getName());
				$.ajax({
					async: true 
					,cache: false
					,type: "post"
					,url: "/infra/member/GloginProc"
					,data : {"ifmmId" : profile.getName()}
					,success: function(response) {
						if(response.rt == "success") {
							/* location.href = "/infra/index/indexView"; */
							alert("로그인성공");
							location.href = "/infra/xdmin/member/memberList";
						} else {
							alert("구글 로그인 실패");
						}
					}
					,error : function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				})
				
			})
			.fail(function(e){
				console.log(e);
			})
			
		}
		
		function onSignInFailure(t){	
			
			console.log(t);
			
		}
	</script>
	<!-- //구글 api 사용을 위한 스크립트 -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>