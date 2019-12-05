<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
	width: 1200px;
	height: 750px;
	min-width: 1100px;
	position: relative;
	text-align: center;
	margin: auto;
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
		<div id=leftBar_contents1>
			<h1 style="line-height: 100px; text-align: center; color:white;">에러 페이지</h1>

		</div>
		<div id=leftBar_contents2>

			<div style="width: 100%; text-align: center;">
				<div
					style="margin: auto; width: 150px; height: 280px; line-height: 280px;">
					<img src="${pageContext.request.contextPath}/resources/images/error.png" style="width: 150px;">
				</div>
				<div style="margin: auto; width: 480px; height: 100px;">
					<h1>ERROR</h1>
				</div>

				<h4>유효하지 않은 페이지입니다. 관리자에게 문의하여 주시기 바랍니다.</h4>
                   <h4>info@msg.missingchildren</h4>
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