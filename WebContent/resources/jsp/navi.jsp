<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ----- navi 시작 --------------------------------------------------  -->
<div id=upnavi>
	<a href="#" class=mainSmallMenu>로그인</a>
	<a href="#" class=mainSmallMenu>회원가입</a>
	<a href="#" class=mainSmallMenu>마이페이지</a>
</div>

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%">
	<a class="navbar-brand" href="#">
		<img src="${pageContext.request.contextPath}/resources/images/msglogo.png" style="width: 200px;">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="#">HOME
					<span class="sr-only">(current)</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">실종아동검색</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">실종아동등록</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>

			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">자원봉사</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item" href="#">Something else here</a>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<button class="btn btn-outline-success" type="button">후원하기</button>
		</ul>
	</div>
</nav>
<!-- ----- navi 끝 ---------------------------------------------------  -->