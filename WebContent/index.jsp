<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<button id="inputBtn">To Input</button>
	<button id="childBtn">To Child List</button>
	
	<script>
		$("#inputBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/child/insertInfo.jsp";
		});
		
		$("#childBtn").on("click", function(){
			location.href="childList.child";
		});
	</script>
</body>
</html>