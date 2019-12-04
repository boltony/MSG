<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
}

.mya:hover {
	text-decoration: none;
}

.leftContainer {
	width: 100%;
	height: 750px;
	min-width: 1100px;
	position: relative;
}

#leftBar {
	width: 300px;
	height: 100%;
	float: left;
	padding-left: 30px;
	line-height: 20px;
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
}

#leftBar_contents1 h3 {
	line-height: 100px;
}

#leftBar_contents2 {
	width: 70%;
	height: 70%;
	float: left;
}

#pwRe1 {
	width: 130px;
	background-color: white;
	border-radius: 8px;
	background-color: #bf5f5f;
	color: #f8f8f8;
	border: none;
}

#pwRe1:hover {
	background-color: #367c89;
	transition-duration: 0.4s;
}

#pwRe2 {
	width: 100px;
	background-color: white;
	border-radius: 8px;
	background-color: #399fb2;
	color: #f8f8f8;
	border: none;
}

#pwRe2:hover {
	background-color: #367c89;
	transition-duration: 0.4s;
}

#toMain {
	width: 100px;
	height: 40px;
	margin: auto;
	text-align: center;
	position: relative;
	top: 50px;
	background-color: #49939d;
	color: white;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- ----- navi 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<!-- ----- navi 끝 ------------------------------------------  -->

	<!-- ----- quick menu 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<!-- ----- quick menu 끝 ------------------------------------------  -->


	<div class=leftContainer>
		<div id=leftBar>
			<div id=leftBarTitle>
				<h3>마이 페이지</h3>
			</div>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_Info.jsp" class=mya>나의 정보</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_modify.jsp" class=mya>정보 수정하기</a>
			</p>	
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
			<h3 style="padding-left: 30px;">회원 탈퇴 안내</h3>

		</div>
		<div id=leftBar_contents2>

			<div style="width: 100%; text-align: center;">
				<div
					style="margin: auto; width: 150px; height: 280px; line-height: 280px;">
					<img src="${pageContext.request.contextPath}/resources/images/my_out.png" style="width: 150px;">
				</div>
				<div style="margin: auto; width: 480px; height: 100px;">
					<h1>회원 탈퇴가 완료되었습니다.</h1>
				</div>

				<h4>그동안 msg 서비스를 이용해 주셔서 감사합니다.</h4>
				<h4>보다 나은 서비스로 다시 찾아뵙겠습니다.</h4>
				<div style="height: 200px;">
					<input type="button" value="메인으로" id=toMain>
				</div>

			</div>
		</div>
	</div>
	
	<script>
		$("#toMain").on("click",function(){
			location.href="${pageContext.request.contextPath}/main.jsp";
		})
	</script>




	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>