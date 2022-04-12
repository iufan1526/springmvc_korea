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
</head>
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
  <form id="form" name="form" method="post" action="/infra/xdmin/member/memberInst" enctype="multipart/form-data">
  	<input type="hidden" name="shOption" id="shOption" value="<c:out value="${vo.shOption}"/>">
  	<input type="hidden" name="shValue" id="shValue" value="<c:out value="${vo.shValue}"/>">
    <div class="main_from container">
      <div class="row">
        <h5>아이디</h5>
        <div class="col-sm-12">
          <input type="text" class="form-control" name="ifmmId" id="ifmmId" placeholder="영문(소문자)숫자4~10자리 조합" aria-label="First name">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h5>비밀번호</h5>
          <input type="password" class="form-control" name="ifmmPassword" id="ifmmPassword" placeholder="영문(대소문자)특수문자,숫자4~20자리 조합" aria-label="First name">
        </div>
        <div class="col col-md-6">
          <h5>비밀번호 확인</h5>
          <input type="password" class="form-control" name="ifmmPasswordCk" id="ifmmPasswordCk" placeholder="영문(대소문자)특수문자,숫자4~20자리 조합" aria-label="Last name">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h5>이름</h5>
          <input type="text" class="form-control" name="ifmmName" id="ifmmName" placeholder="" aria-label="First name">
        </div>
        <div class="col-sm-12 col-md-6">
          <h5>이름(영문)</h5>
          <input type="text" class="form-control" name="ifmmEngName" id="ifmmEngName" placeholder="" aria-label="Last name">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-4">
          <h5>성별</h5>
          <select class="form-select" id="ifmmGenderCd" name="ifmmGenderCd" aria-label="Default select example">
            <option value="0"selected>성별</option>
            <option value="1">남자</option>
            <option value="2">여자</option>
            <option value="3">기타</option>
          </select>
        </div>
        <div class="col-sm-12 col-md-4">
          <h5>국적</h5>
          <select class="form-select" aria-label="Default select example">
            <option value="0" selected>대한민국</option>
            <option value="1">미국</option>
            <option value="2">일본</option>
            <option value="3">중국</option>
          </select>
        </div>
        <div class="col-sm-12 col-md-4">
          <h5>생일</h5>
          <input type="text" id="ifmmDob" name="ifmmDob" >
          <!-- <input type="date" id="ifmmDob" name="ifmmDob"width="100px"> -->
     
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h5>Email</h5>
          <input type="text" class="form-control" name="ifmeEmailFull" id="ifmeEmailFull" placeholder="" aria-label="First name">
        </div>
        <div class="col">
          <h5>이메일 정보 마케팅 사용동의</h5>
          <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">동의합니다
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h5>핸드폰</h5>
          <select class="form-select" aria-label="Default select example" id="ifmeTelecomCd" name="ifmeTelecomCd">
            <option value="0"selected>통신사</option>
            <option value="18">SKT</option>
            <option value="19">KT</option>
            <option value="20">LG</option>
          </select>
          <input type="text" class="form-control"id="ifmeNumber" name="ifmeNumber" placeholder="" aria-label="First name">
        </div>
        <div class="col">
          <h5>핸드폰 정보 마케팅 사용동의</h5>
          <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">동의합니다
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h5>주소</h5>
           <select class="form-select" aria-label="Default select example" id="ifmaTypeCd" name="ifmaTypeCd">
            <option value="0"selected>용도</option>
            <option value="1">집</option>
            <option value="2">회사</option>
          </select>
          	<input type="text" class="form-control" id="sample3_postcode" placeholder="우편번호">
			<input type="button" class="btn btn-success" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
			<input type="button" class="btn btn-danger" id="btnAddressDel" name="btnAddressDel" value="X"><br>
			<input type="text" class="form-control" id="sample3_address" name="ifmaAddress1" placeholder="주소"><br>
			<input type="text" class="form-control" id="sample3_detailAddress" name="ifmaAddress2" placeholder="상세주소">
			<input type="text" class="form-control" id="sample3_extraAddress" placeholder="참고항목">
			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
        </div>
        <div class="col-sm-12 col-md-6">
          <input type="text" id="lat" name="lat">
          <input type="text" id="lng" name="lng">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h5>자기소개</h5>
          <textarea class="form-control" name="ifmmDesc" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="col">
          <h5>정보보관기간</h5>
          <select class="form-select" aria-label="Default select example" id="ifmmSavedCd" name="ifmmSavedCd">
            <option value="6"selected>1년</option>
            <option value="7">5년</option>
            <option value="8">10년</option>
            <option value="17">탈퇴시</option>
          </select>
          	<div class="mb-3">
			  <label for="formFile" class="form-label">프로필 이미지를 선택해주세요.</label>
			  <input class="form-control" type="file" id="file" name="file" multiple="multiple" onChange="upload(0,2)">
			</div>
        </div>
        <div class="main_botton">
         <button type="submit" class="btn btn-success" id="btnSubmit" name="btnSubmit">등록</button></a>
          <a href="javascript:goList()"><button type="button" class="btn btn-danger">취소</button></a>
        </div>
      </div>
    </div>
    </form>
  </main>
  
  
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd5bb8a34e9b5da12e10f884d7ff484d&libraries=services"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/infra/resources/common/js/validation.js"></script>


 <script>
 // 우편번호 찾기 찾기 화면을 넣을 element
 var element_wrap = document.getElementById('wrap');

 function foldDaumPostcode() {
     // iframe을 넣은 element를 안보이게 한다.
     element_wrap.style.display = 'none';
 }

 function sample3_execDaumPostcode() {
     // 현재 scroll 위치를 저장해놓는다.
     var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
     new daum.Postcode({
         oncomplete: function(data) {
             // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("sample3_extraAddress").value = extraAddr;
                 document.getElementById('sample3_postcode').value = data.zonecode;
                 document.getElementById("sample3_address").value = addr;
             } else {
                 document.getElementById("sample3_extraAddress").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             /* document.getElementById('sample3_postcode').value = data.zonecode;
             document.getElementById("sample3_address").value = addr; */
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("sample3_detailAddress").focus();

             // iframe을 넣은 element를 안보이게 한다.
             // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
             element_wrap.style.display = 'none';

             // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
             document.body.scrollTop = currentScroll;
         },
         // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
         onresize : function(size) {
             element_wrap.style.height = size.height+'px';
         },
         width : '100%',
         height : '100%'
     }).embed(element_wrap);

     // iframe을 넣은 element를 보이게 한다.
     element_wrap.style.display = 'block';
     
		/* lat and lng from address s */
		
		// 주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색
		geocoder.addressSearch(addr, function(result, status) {
		 
			// 정상적으로 검색이 완료됐으면,
			if (status == daum.maps.services.Status.OK) {
				
				document.getElementById("lat").value=result[0].x;
				document.getElementById("leg").value=result[0].y;
				
/* 						
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
				y = result[0].x;
				x = result[0].y;
		
				// 결과값으로 받은 위치를 마커로 표시합니다.
				var marker = new daum.maps.Marker({
					map: map,
					position: coords
				});
		
				// 인포윈도우로 장소에 대한 설명표시
				var infowindow = new daum.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
				});
		
				infowindow.open(map,marker);
		
				// 지도 중심을 이동
				map.setCenter(coords);
				
				document.getElementById("ifmaLatArray0").value=x;
				document.getElementById("ifmaLngArray0").value=y;
*/						
			}
		});
		/* lat and lng from address e */
 }
	
	
    $(function() {
        //input을 datepicker로 선언
        $("#ifmmDob").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트              
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
        });                    
        
        //초기값을 오늘 날짜로 설정해줘야 합니다.
        $('#ifmmDob').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });
       
        
</script>
<script type="text/javascript"> 

	goList = function(){
		$("#form").attr("action","/infra/xdmin/member/memberList");
		$("#form").submit();
		
	};
	
	$("#btnAddressDel").on("click",function(){
		
		$("#sample3_postcode").val(null);
		$("#sample3_address").val(null);
		$("#sample3_detailAddress").val(null);
		$("#sample3_extraAddress").val(null);
		

	});
	
	$("#btnSubmit").on("click",function(){
		if(!checkNull($("#ifmmId"), $("#ifmmId").val(), "아이디를입력해주세요")) return false; 
		if(!checkId($("#ifmmId"), $("#ifmmId").val(), "아이디 양식이 맞지 않습니다")) return false;
		
		if(!checkNull($("#ifmmPassword"), $("#ifmmPassword").val(), "비밀번호를 입력해주세요")) return false;
		if(!checkPassword($("#ifmmPassword"), $("#ifmmPassword").val(), "비밀번호 양식이 올바르지않습니다")) return false;
		if(!checkPasswordCk($("#ifmmPassword").val(), $("#ifmmPasswordCk").val(), "비밀번호가 맞지않습니다.")) return false;
		
		if(!checkNull($("#ifmmName"), $("#ifmmName").val(), "이름를입력해주세요")) return false;
		
		if(!checkGander($("#ifmmGenderCd"), $("#ifmmGenderCd").val(), "성별을 선택해주세요")) return false;
		
		if(!checkNull($("#ifmmDob"), $("#ifmmDob").val(), "생일을 입력해주세요")) return false;
		
		if(!checkNull($("#ifmeEmailFull"), $("#ifmeEmailFull").val(), "이메일을 입력해주세요")) return false;
		if(!checkEmail($("#ifmeEmailFull"), $("#ifmeEmailFull").val(), "이메일 양식이 올바르지않습니다.")) return false;
		
		if(!checkNull($("#ifmeNumber"), $("#ifmeNumber").val(), "핸드폰 번호를 입력해주세요")) return false;
		if(!checkMobile($("#ifmeNumber"), $("#ifmeNumber").val(), "핸드폰 번호 양식이 올바르지않습니다.")) return false;
		
		if(!checkAddress($("#ifmaTypeCd"), $("#ifmaTypeCd").val(), "주소용도를 선택해주세요")) return false; 
		if(!checkNull($("#sample4_roadAddress"), $("#sample3_address").val(), "주소를입력해주세요")) return false; 
		if(!checkNull($("#sample4_detailAddress"), $("#sample3_detailAddress").val(), "주소를입력해주세요")) return false; 

});
</script>

<script type="text/javascript">
	upload = function(seq, div){
		
		$("#ulFile" + seq).children().remove();
		
		var fileCount = $("input[type=file]")[seq].files.length;
		
		if(checkUploadedTotalFileNumber(fileCount, seq) == false) {return false;}
		
		var totalFileSize;
		
		for (var i = 0; i < fileCount ; i++) {
			if(div == 1){
				if(checkUploadedAllExt($("input[type=file]")[seq].files[i].name, seq) == false) {return false;}
			} else if(div == 2) {
				if(checkUploadedImageExt($("input[type=file]")[seq].files[i].name, seq) == false) {return false;}
			} else {
				return false;
			}
			
			if(checkUploadedEachFileSize($("input[type=file]")[seq].files[i].name, seq) == false) {return false;}
			totalFileSize += $("input[type=file]")[seq].files[i].size;
		}
		
		if(checkUploadedTotalFileSize(totalFileSize, seq) === false){return false;}
		
		for(var i = 0; i< fileCount ; i++){
			addUploadLi(seq, i, $("input[type=file]")[seq].files[i].name);
		}
	}
	
	addUploadLi = function (seq, index, name){
		
		var ul_list = $("#ulFile0");
		
		li = '<li id="li_'+seq+'_'+index+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li = li + name;
		li = li + '<span class="badge bg-danger rounded-pill" onClick="delLi('+seq+','+index+')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li = li + '</li>';
		
		$("#ulFile"+seq).append(li);
	}
	
	delLi = function(seq, index){
		$("#li_"+seq+"_"+index).remove();
	}
	
	
	
	var extArrayImage = new Array();
	extArrayImage = ["jpg", "gif", "png", "jpeg", "bmp", "tif"];
	
	var extArrayAll = new Array();
	extArrayAll = ["txt", "pdf", "hwp", "doc", "docx", "xls", "xlsx", "ppt", "pptx"];
	
</script>
</body>
</html>