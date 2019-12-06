<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
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
@font-face {
	font-family: 'BMEULJIRO';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.mya {
	color: black;
}

.mya:hover {
	text-decoration: none;
}

.procedure {
	float: left;
	width: 33.3%;
	height: 80px;
	text-align: center;
	line-height: 80px;
	margin: 0px;
	background-color: #66B5D0;
	color: white;
	border-radius: 10px;
	padding-top: 5px;
}

.ul {
	height: 400px;;
	float: left;
	margin: 0px;
	border: 1px solid #99a0a2;
}

#form {
	border: 1px solid black;
	margin: auto;
	width: 100%;
}

.element {
	width: 30%;
	text-align: center;
	float: left;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #f4f2f2;
	background-color: #eaeef0;
}

.value {
	width: 70%;
	float: left;
	overflow: hidden;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #f4f2f2;
	text-align: center;
}

input[type=text] {
	width: 60%;
	height: 30%;
	text-align: center;
}

.a {
	height: 50px;
	border-bottom: 1px solid #f4f2f2;
	border-radius: 10px;
}

.b {
	float: left;
	height: 100%;
}

#go_main {
	width: 200px;
	height: 80px;
	background-color: #66B5D0;
	box-shadow: none;
	border: none;
	font-size: 25px;
	font-family: 'GoyangIlsan';
	color: white;
	border-radius: 8px;
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


	<!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
	<div style="width: 100%; min-width:1500px; height: 1200px; position: relative;">
		<div
			style="width: 300px; height: 100%; float: left; padding-left: 30px; line-height: 20px;">
			<div style="height: 100px; width: 160px; padding-top: 30px; text-align:center">
				<h3>후원하기</h3>
			</div>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; background-color:#66b5d0; line-height:30px;">
				<a href="${pageContext.request.contextPath}/support/support_page.jsp" class=mya style="color:white">후원하기</a>
			</p>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; line-height:30px;">
				<a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
			</p>

		</div>
		<div
			style="width: 60%; height: 1050px; float: left; position: relative; left: 5%; border-bottom: 1px solid black;">
			<div
				style="width: 100%; border-bottom: 1px solid black; padding-top: 30px">
				<p style="font-size: 40px; line-height:">후원하기</p>
			</div>
			<div
				style="width: 100%; height: 60px; position: relative; top: 50px; overflow: hidden;">
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP1.<br>후원신청
					</h5>
				</div>
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP2.<br>신청서 작성
					</h5>
				</div>
				<div class="procedure">
					<h5>
						STEP3.<br>신청 완료
					</h5>
				</div>
			</div>
			<div style="position: relative; top: 100px;">
				<div style="height: 50%; overflow: hidden;">
					<div style="text-align: center; height: 100%;">
						<img src="${pageContext.request.contextPath}/resources/images/thank.png" style="margin: auto;">
					</div>
				</div>
				<div style="border-radius: 15px; background-color: antiquewhite; text-align: center; width: 72%; margin: auto;">
					<br>
					<h4 style="font-weight:bold">함께하는 사랑이 세상을 아름답게 만들어
						갑니다.</h4>
					<br>
					<div style="margin:15px;">
					<p>아직도 우리 곁에는 도움을 필요로 하는 실종아동들이 많습니다.</p>
					<p>
						<br>작은 관심과 사랑에서부터 시작하는 사랑의 실천!<br>사랑은 나눌수록 커지고 고통은 나눌수록
						작아지는 것이라고 합니다.<br> <br>후원자님의 따듯한 마음과 아름다운 손길로 어려운
						실종아동가족에게 행복한 웃음을 더 많이 전해주시길 기대합니다.<br>보내주신 후원금은 도움을 필요로 하는
						실종아동기관에서 정직하고 성실하게 사용 할 것을 약속드립니다.<br>
					</p>
					<br>
					<p>아름다운 세상을 만들기 위한 꿈, 그 꿈을 변화시키는 것은 바로 여러분! 후원자님입니다.<br>감사합니다.</p>
					<br>
					</div>
				</div>
				<div style="height: 100px; position: relative; top: 10px; text-align: center;">
				<input type="button" value="메인으로 이동" id="go_main">
			</div>
			</div>
		</div>
	</div>
	<!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->





	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->
	
	<script>
	$("#go_main").on("click",function(){
		location.href = "${pageContext.request.contextPath}/main.jsp";
	})
	</script>

</body>
</html>