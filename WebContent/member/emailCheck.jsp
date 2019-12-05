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

#email_check_container{
	text-align: center;
	background-color: #ffcc57;
	padding: 10px;
	width: 500px;
	height: 300px;
	font-family: 'GoyangIlsan';
	margin: auto;
}
#received_key{
	width: 250px;
	height: 30px;
	text-align: center;
}
#received_key_btn{
 	border: none;
 	width: 100px;
 	height: 30px;
 	border-radius: 10px;
 	background-color: #c9af96;
}
#email_check_logo{
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<div id="email_check_container">
	<img src="resources/images/logo_blue.png" id="email_check_logo">
		<br><br>
	이메일로 전송된 인증번호를 입력하세요 <br><br>
	<input type="text" id="received_key"> <br><br><br>
	<button type="button" id="received_key_btn">확인</button>
	</div>
	<script>

	$("#received_key_btn").on("click",function(){
		var received_key = $("#received_key").val();
		var email_key = "${email_key}";

		var email_check_result;
		
		if(email_key==received_key){
			alert("이메일 인증되었습니다!")
			window.opener.emailCheckValid = 1;
			setTimeout(function() {window.close();}, 0);

		}else{
			alert("이메일 인증에 실패하였습니다. 다시 인증해주세요");
			window.opener.emailCheckValid = 0;
		}
		
		
	})
	
	</script>
</body>
</html>