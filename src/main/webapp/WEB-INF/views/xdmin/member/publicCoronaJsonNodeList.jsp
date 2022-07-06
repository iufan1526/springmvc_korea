<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("br", "\n"); %>



<body>
	node: <c:out value="${node}"/>
	node: <c:out value="${node.get('header') }"/>
</body>
  
  
  
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