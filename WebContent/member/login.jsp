<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
html {
	background-color: #56baed;
}

body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
	background-color: rgba(239, 239, 191, 0.69);
}

a {
	color: #92badd;
	display: inline-block;
	text-decoration: none;
	font-weight: 400;
}

h2 {
	text-align: center;
	font-size: 16px;
	font-weight: 600;
	text-transform: uppercase;
	display: inline-block;
	margin: 40px 8px 10px 8px;
	color: #cccccc;
}

/* STRUCTURE */
.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	min-height: 100%;
	padding: 20px;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 90%;
	max-width: 450px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

#formFooter {
	background-color: #f6f6f6;
	border-top: 1px solid #dce8f1;
	padding: 25px;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
}

/* TABS */
h2.inactive {
	color: #cccccc;
}

h2.active {
	color: #0d0d0d;
	border-bottom: 2px solid #5fbae9;
}

/* FORM TYPOGRAPHY*/
input[type=button], input[type=button], input[type=reset] {
	background-color: #54d6bd;
	border: none;
	color: white;
	padding: 15px 80px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 40px 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=button]:hover, input[type=reset]:hover
	{
	background-color: #39ace7;
}

input[type=button]:active, input[type=button]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text], input[type=password] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 0px;
	width: 80%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
	color: #cccccc;
}

/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
	-webkit-animation-name: fadeInDown;
	animation-name: fadeInDown;
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown { 
0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}
100%{ 
opacity: 1;
-webkit-transform:none;                 
transform:none;
            
}
}

@keyframes fadeInDown { 
0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}

100% {
opacity: 1;
-webkit-transform:none;               
transform:none;                
}
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn {
from { opacity:0;}

to {opacity: 1;}

}
@-moz-keyframes fadeIn {
from { opacity:0;}

to {opacity: 1;}

}

@keyframes fadeIn {
from { opacity:0;}

to {opacity: 1;}

}
.fadeIn {
	opacity: 0;
	-webkit-animation: fadeIn ease-in 1;
	-moz-animation: fadeIn ease-in 1;
	animation: fadeIn ease-in 1;
	-webkit-animation-fill-mode: forwards;
	-moz-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	-webkit-animation-duration: 1s;
	-moz-animation-duration: 1s;
	animation-duration: 1s;
}

.fadeIn.first {
	-webkit-animation-delay: 0.4s;
	-moz-animation-delay: 0.4s;
	animation-delay: 0.4s;
}

.fadeIn.second {
	-webkit-animation-delay: 0.6s;
	-moz-animation-delay: 0.6s;
	animation-delay: 0.6s;
}

.fadeIn.third {
	-webkit-animation-delay: 0.8s;
	-moz-animation-delay: 0.8s;
	animation-delay: 0.8s;
}

.fadeIn.fourth {
	-webkit-animation-delay: 1s;
	-moz-animation-delay: 1s;
	animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #56baed;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	color: #0d0d0d;
}

.underlineHover:hover:after {
	width: 100%;
}

/* OTHERS */
*:focus {
	outline: none;
}

#icon {
	width: 60%;
}
</style>
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" id="icon" style="padding: 15px" alt="User Icon">
			</div>

			<!-- Login Form -->
			<form action="${pageContext.request.contextPath}/login.mem" id="login_form" method="post">
				<input type="text" id="id" class="fadeIn second" name="id"	placeholder="login"> 
				<input type="password" id="password" class="fadeIn third" name="pw" placeholder="password"> 
				<input type="button" id="login_btn" class="fadeIn fourth" value="Login">
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="${pageContext.request.contextPath}/member/findID.jsp">아이디 찾기</a> | 
				<a class="underlineHover" href="${pageContext.request.contextPath}/member/findPW.jsp">비밀번호 찾기</a> |
				<a class="underlineHover" href="${pageContext.request.contextPath}/member/signup.jsp">회원가입</a>
			</div>

		</div>
	</div>
	<script>
	
	$("#login_btn").on("click",function(){
		
		var login_input_id = $("#id").val();
		var login_input_pw = $("#password").val();
		if(login_input_id==""){
			alert("아이디 항목은 필수 입력값입니다.");
			return;
		}
		if(login_input_pw==""){
			alert("비밀번호 항목은 필수 입력값입니다.");
			return;
		}
		$("#login_form").submit();
	});
	
	$(document).on("keyup", function(e){
        console.log(e.keyCode);

        if(e.keyCode == 13){
        	var login_input_id = $("#id").val();
    		var login_input_pw = $("#password").val();
    		if(login_input_id==""){
    			alert("아이디 항목은 필수 입력값입니다.");
    			$("#id").focus();
    			return;
    		}
    		if(login_input_pw==""){
    			alert("비밀번호 항목은 필수 입력값입니다.");
    			$("#password").focus();
    			return;
    		}
    		$("#login_form").submit();
        }
    });
	
	</script>
</body>
</html>