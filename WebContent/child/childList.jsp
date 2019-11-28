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
<title>실종 아동 목록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
* {
	box-sizing: border-box
}

.missing_list {
	/*                min-width:900px;*/
	max-width: 900px;
}

.simple_list {
	border: 1px solid black;
	min-width: 420px;
}

.simple_list>img {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
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
						<div class="col-12 col-sm-6 simple_list mb-4">
							<img src="img/조묘진.jpg"> <br>
							<h4>${dto.name}(${dto.gender})</h4>
							<h>생년월일 : ${dto.get_formed_birth()}</h>
							<br>
							<h>실종일자 : ${dto.get_formed_missing_date()}</h>
							<br>
							<h>실종지역 : ${dto.missing_area}</h>
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

	<div class="row">
		<div class="col-12 text-center">${pageNavi}</div>
	</div>

	<script>
		$("#backBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/index.jsp";
		});
	</script>
</body>
</html>