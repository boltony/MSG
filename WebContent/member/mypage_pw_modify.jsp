<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify My Info</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
.mya {
	color: black;
	font-size: 20px;
}
.mya:hover {
	text-decoration: none;
}

.leftContainer {
	width: 100%;
	height: 500px;
	min-width: 1100px;
	position: relative;
}

#leftBar {
	width: 300px;
	height: 100%;
	float: left;
	padding-left: 30px;
	line-height: 20px;
	text-align: center;
}

#leftBar p, #leftBarTitle{
 width:160px; text-align: center;
}

#leftBarTitle {
	height: 100px;
	width: 100%;
	padding-top: 30px;
}

#leftBar_contents1 {
	background-color: #7ac9d8;
	width: 70%;
	height: 100px;
	min-width: 800px;
	float: left;
	text-align: center;
}

#leftBar_contents1 h2 {
	line-height: 100px;
}

#leftBar_contents2 {
	width: 70%;
	height: 70%;
	float: left;
}

#pwRe {
	width: 120px; height: 40px;
	background-color: #66b5d0;
	border-radius: 5px;
	color: #f8f8f8;
	border: none;
}
</style>

</head>
<body>
	
	<c:choose>
		<c:when test="${sessionScope.loginInfo==null}">
			<jsp:forward page="/member/login_my.jsp"/>;
		</c:when>	
	</c:choose>
	
	<!-- ----- navi 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<!-- ----- navi 끝 ------------------------------------------  -->

	<!-- ----- quick menu 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<!-- ----- quick menu 끝 ------------------------------------------  -->


	<div class=leftContainer>
		<div id=leftBar>
			<div id=leftBarTitle>
				<h3 style="text-align: center; width: 160px;">마이 페이지</h3>
			</div>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp" class=mya>나의 정보</a>
			</p>
			<p><div style="width:160px; height:30px; background-color: #66b5d0; line-height: 30px;">
				<a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya style="color:white;">정보 수정하기</a>
			</div></p>	
			<p>
				<a href="${pageContext.request.contextPath}/mywrite.mem" class=mya>내 글 목록</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_out.jsp" class=mya>회원 탈퇴</a>
			</p>

		</div>
		<div id=leftBar_contents1>
			<h2 style="color:white;">안전한 사용을 위하여 비밀번호를 다시 한 번 확인합니다.</h2>
		</div>
		<div id=leftBar_contents2 style="">
		<form action="${pageContext.request.contextPath}/relogin_modify.mem" method="post" name="frm" id="frm">
			<div
				style="background-color: white; width: 400px; height: 100px; margin: auto; line-height: 40px; padding-top: 50px">
				아이디　　<span><b>${sessionScope.loginInfo.id}</b></span><br> 비밀번호　<input type="password"
					style="height: 25px; width:180px;" id="pw" name=pw><br>
				<br>
				<div style="padding-left: 80px;">
					<button id=pwRe>확인</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	
	<script>
		$("#pwRe").on("click",function(){
			var pw = $("#pw").val();
			if(pw==""){
				alert("비밀번호를 입력해 주세요.");
			}else{
				$("#frm").submit();
			}
			
		})
	</script>



	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->
	

</body>
</html>