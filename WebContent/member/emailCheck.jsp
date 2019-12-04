<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>

	이메일로 전송된 인증번호를 입력하세요 <br>
	<input type="text" id="received_key"> <br>
	<button type="button" id="received_key_btn">확인</button>
	
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