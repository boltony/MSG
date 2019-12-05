<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
@font-face { 
    font-family: 'GoyangIlsan'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
    font-weight: normal; 
    font-style: normal; 
}
#wrapper{
	background-color: #ffcc57;
	width:280px;
	height:180px;
	padding:0px;
	margin:0px;
	text-align:center;
	font-family: 'GoyangIlsan';
}
#header{
	width:100%;
	height:40px;
	background-color:#FFCC57;
	font-weight:bold;
	color:white;
	font-size:20px;
	padding-top:30px;
}
#contents{
	font-family: 'GoyangIlsan';
	font-weight:bold;
	text-align:center;
}
button{
	color:white;
	font-weight:bold;
	border:none;
 	background-color: #c9af96;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">블랙리스트 관리</div>
		<div id="contents">
			<br>
			아이디 : ${id }
			<br>
			<br>
			<button id="black">블랙</button>&nbsp;&nbsp;&nbsp;<button id="cancel">취소</button>
		</div>
	</div>
<script>
	$("#black").on("click", function(){
		location.href="${pageContext.request.contextPath}/blackIn.bo?id=${id}";
		window.close();
	})
	$("#cancel").on("click", function(){
		window.close();
	})
</script>
</body>
</html>