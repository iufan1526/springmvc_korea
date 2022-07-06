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
	<link href="${pageContext.request.contextPath}/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<body >

	
	<main>
		<form class="" method="post" action="" id="" name="">
			아이디:<input type="text" id="ifmmId" name="ifmmId">
			비밀번호:<input type="text" id="ifmmPassword" name="ifmmPassword">
			<button type="button" id="btnSubmit" name="btnSubmit">로그인 버튼 </button>
		  
    	
		</form>
	</main>
	<footer style="background-color:#d5d5d5"> 
	</footer>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd5bb8a34e9b5da12e10f884d7ff484d&libraries=services"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/infra/resources/common/js/validation.js"></script>
	<script>
	
	$("#btnSubmit").on("click",function(){
		if(!checkNull($("#ifmmId"), $("#ifmmId").val(), "아이디를입력해주세요")) return false;
		if(!checkNull($("#ifmmPassword"), $("#ifmmPassword").val(), "비밀번호를 입력해주세요")) return false;
		
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/infra/Test/loginProc"
			,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPassword" : $("#ifmmPassword").val()}
			,success: function(response) {
				if(response.rt == "success") {
					location.href = "/infra/xdmin/login/index";
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