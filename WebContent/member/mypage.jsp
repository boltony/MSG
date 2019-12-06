<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.boot	strapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
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
	width: 70%;
	min-width: 800px;
	float: left;
	height:65px;
	border-bottom: 1px solid black;
}

#leftBar_contents1 h1 {
}

#leftBar_contents2 {
	width: 70%;
	height: 70%;
	float: left;
	height: 350px;
	line-height: 50px;
}

.my_icons_container {
	position: relative;
	width: 800px;
	height: 200px;
	padding-top: 100px;
	margin: auto;
	text-align: center;
}

.my_icons {
	float: left;
	text-align: center;
	width: 110px;
	height: 100px;
	margin-left: 25px;
	margin-right: 25px;
	color: #433e3d;
	font-size: 20px;
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
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya>정보 수정하기</a>
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
			<h1>마이 페이지</h1>

		</div>

		<c:choose>
			<c:when test="${loginInfo==null}">
				<div id=leftBar_contents2>
					<div class=my_icons_container>
						<a href="${pageContext.request.contextPath}/member/login_my.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_info.png" style="width: 100px;"><br>내
								정보
							</div></a> <a href="${pageContext.request.contextPath}/member/login_my.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_modify.png" style="width: 100px;"><br>정보
								수정
							</div></a> <a href="${pageContext.request.contextPath}/member/login_my.jsp"><div class=my_icons id=mywrite>
								<img src="${pageContext.request.contextPath}/resources/images/my_write.png" style="width: 100px;"><br>내가
								쓴 글
							</div></a> <a href="${pageContext.request.contextPath}/member/login_my.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_heart.png" style="width: 100px;"><br>내
								후원 내역
							</div></a> <a href="${pageContext.request.contextPath}/member/login_my.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_delete.png" style="width: 100px;"><br>회원
								탈퇴
							</div></a>
					</div>
					<div style="width: 100%; height: 100px;"></div>
				</div>
			</c:when>
			<c:otherwise>
				<div id=leftBar_contents2>
					<div class=my_icons_container>
						<a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_info.png" style="width: 100px;"><br>내
								정보
							</div></a>
							<a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_modify.png" style="width: 100px;"><br>정보
								수정
							</div></a>
							<a href="${pageContext.request.contextPath}/mywrite.mem"><div class=my_icons id=mywrite>
								<img src="${pageContext.request.contextPath}/resources/images/my_write.png" style="width: 100px;"><br>내가
								쓴 글
							</div></a> 
							<a href="${pageContext.request.contextPath}/mydonate.mem"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_heart.png" style="width: 100px;"><br>내
								후원 내역
							</div></a> 
							<a href="${pageContext.request.contextPath}/member/mypage_out.jsp"><div class=my_icons>
								<img src="${pageContext.request.contextPath}/resources/images/my_delete.png" style="width: 100px;"><br>회원
								탈퇴
							</div></a>
					</div>
					<div style="width: 100%; height: 100px;"></div>
				</div>
			</c:otherwise>
		</c:choose>



	</div>

	<script>
		$("#mywrite").on("click", function() {
			location.href = "${pageContext.request.contextPath}/member/mywrite.bor";
		});
	</script>




	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>