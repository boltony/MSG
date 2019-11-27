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
	<button id="welcomeBtn">Welcome</button>
	<button id="childBtn">To Child List</button>
	
	<script>
		$("#welcomeBtn").on("click", function(){
			alert("Welcome My Team!!");
		});
		
		$("#childBtn").on("click", function(){
			location.href="childList.child";
		});
	</script>
</body>
</html>