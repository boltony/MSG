<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/childStyle.css">
<title>실종 아동 목록</title>
<style>
* {
	box-sizing: border-box
}

.missing_list {
	max-width: 1000px;
}

.simple_list {
	border: 1px solid black;
	min-width: 400px;
	max-width: 400px;
	border-radius: 20px;
}

.simple_list>img {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.simple_list>h {
	font-size: 12px;
}

</style>
</head>
<body>
	<!-- ----- navi 시작 --------------------------------------------------  -->
	<div id=upnavi>
		<a href="#" class=mainSmallMenu>로그인</a> <a href="#"
			class=mainSmallMenu>회원가입</a> <a href="#" class=mainSmallMenu>마이페이지</a>
	</div>

	<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%">
		<a class="navbar-brand" href="#"><img
			src="${pageContext.request.contextPath}/child/image/policylogo.png"
			style="width: 130px;"> LOGO</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">HOME
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">실종아동검색</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 실종아동등록 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 자원봉사 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<button class="btn btn-outline-success" type="button">후원하기</button>
			</ul>
		</div>
	</nav>
	<!-- ----- navi 끝 ---------------------------------------------------  -->
	

	<!-- ----- quick menu 시작 --------------------------------------------  -->
	<div id="container0">
		<div class="menu0">
			<img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/login-64.png"
				alt="">
			<p>로그인</p>
		</div>
		<div class="menu0">
			<a href=""> <img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/active-search-64.png"
				alt="">
				<p>실종아동찾기</p>
			</a>
		</div>
		<div class="menu0">
			<img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/reviewer-64.png"
				alt="">
			<p>실종아동등록</p>
		</div>
		<div class="menu0">
			<img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/banknotes-64%20(1).png"
				alt="">
			<p>후원하기</p>
		</div>
		<div class="menu0">
			<img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/text-file-4-64.png"
				alt="">
			<p>실종아동등록</p>
		</div>
		<div class="menu0">
			<img class="quick_menu_img"
				src="${pageContext.request.contextPath}/child/image/chat-4-64%20(1).png"
				alt="">
			<p>문의하기</p>
		</div>
	</div>
	<!-- ----- quick menu 끝 ---------------------------------------------  -->
	
	
	<!-- ----- child list 시작 --------------------------------------------  -->
	<br>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-12 text-center">
				<h4>#실종아동 목록</h4>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3 text-center d-none d-sm-block">1</div>
			<div class="col-sm-3 text-center d-none d-sm-block">2</div>
			<div class="col-sm-3 text-center d-none d-sm-block">3</div>
			<div class="col-sm-3 text-center d-none d-sm-block">4</div>
		</div>
	</div>
	<hr>
	<div class="container missing_list">
		<c:choose>
			<c:when test="${list.size()==0}">
				<div class="row r1">
					<div class="col-12 text-center">작성된 글이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="col-12 col-sm-5 simple_list mb-4 offset-1">
							<img
								src="${pageContext.request.contextPath}/child/image/dubuzzing.jpg">
							<br>
							<h4>${dto.name}(${dto.get_real_gender()})</h4>
							<h>생년월일 : ${dto.get_formed_birth()}</h>
							<br>
							<h>실종일자 : ${dto.get_formed_missing_date()}</h>
							<br>
							<h>실종지역 : ${dto.get_real_missing_area()}</h>
							<br> <br>
							<div>
								<button>상세정보</button>
								<button>공유하기</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<br>
	<div class="container pageNavi">
		<div class="row">
			<div class="col-12 text-center">${pageNavi}</div>
		</div>
	</div>
	<br><br>
	<hr>
	<!-- ----- child list 끝 ---------------------------------------------  -->


	<!-- ----- footer 시작 ------------------------------------------------  -->
	<div class=policyContainer>
		<div id=policyTitle1>
			<div id=policy1>
				<img
					src="${pageContext.request.contextPath}/child/image/policylogo.png"
					style="width: 140px;"><br>
				<br> +82 10 0000 0000<br> info@msg.missingchildren<br>
				Daeil-building 3F, 120 Namdaemun-ro Jung-gu Seoul Republic of Korea<br>

			</div>
			<div id=policy2>
				<a href="#" class=poline>About Us</a><br> <a href="#"
					class=poline>Careers and Internships</a><br> <a href="#"
					class=poline>Private Policy</a><br> <a href="#" class=poline>Terms
					of Use</a><br> <a href="#" class=poline>Feedback</a><br>
			</div>
		</div>

		<div id=policyTitle2>Copyright © 2019 KH Missing children Go
			home ㅣ Created by MSG All Right Reserved</div>
	</div>
	<!-- ----- footer 끝 -------------------------------------------------  -->
	
	<script>
		$("#backBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/index.jsp";
		});
	</script>
</body>
</html>