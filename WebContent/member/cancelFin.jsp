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
	font-size: 20px;
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
	<!-- -->
	text-align: center;
	<!-- -->
}

<!-- -->
#leftBar p, #leftBarTitle{
 width:160px; text-align: center;
}
<!-- -->

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

#toMain {
	width: 120px; height: 40px;
	margin: auto;
	text-align: center;
	position: relative;
	top: 50px;
	background-color: #66b5d0;
	font-size: 16px;
	color: white;
	border: none;
	border-radius: 5px;
}
h2>div{

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
	<!--   -->
				<h3 style="text-align: center; width: 160px;">마이 페이지</h3>
	<!--   -->
			</div>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp" class=mya>나의 정보</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya>정보 수정하기</a>
			</p>	
			<p>
				<a href="mywrite.mem" class=mya>내 글 목록</a>
			</p>
			<p>
				<a href="mydonate.mem" class=mya>후원 내역</a>
			</p>
			<!--  style="color:white;"  -->
			<!--   border-bottom: 1px solid black;  -->
			<div style="width:160px; height:30px; background-color: #66b5d0; line-height: 30px;"><p>
			<!--   -->
				<a href="${pageContext.request.contextPath}/member/mypage_out.jsp" class=mya style="color:white;">회원 탈퇴</a>
			<!--   -->
			</p></div>

		</div>
		<div id=leftBar_contents1>
			<h1 style="padding-left: 30px; line-height: 100px; text-align: center;">후원 취소 안내</h1>

		</div>
		<div id=leftBar_contents2>

			<div style="width: 100%; text-align: center;">
				<div
					style="margin: auto; width: 150px; height: 280px; line-height: 280px;">
					<img src="${pageContext.request.contextPath}/resources/images/my_out.png" style="width: 150px;">
				</div>
				<div style="margin: auto; width: 480px; height: 100px;">
					<h1>후원 취소가 완료되었습니다.</h1>
				</div>

				<h4>요청하신 항목에 대해 정상적으로 후원 취소가 완료되었습니다.</h4>
                   <h4>도움이 필요한 가족에게 사랑을 보내 주셨던 후원자님께 진심으로 감사드리며,</h4>
                   <h4>이후 새로운 후원을 원하실 경우 언제든지 함께해 주시기 바랍니다.</h4><br>
                   <h4>감사합니다.</h4>
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