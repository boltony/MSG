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
	*{
		box-sizing:border-box
	}

	.container>div{
		border-bottom:1px solid black;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-12 text-center">
				<h4>#자유게시판</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1 text-center d-none d-sm-block"></div>
			<div class="col-sm-6 text-center d-none d-sm-block">Name</div>
			<div class="col-sm-2 text-center d-none d-sm-block">Gender</div>
			<div class="col-sm-2 text-center d-none d-sm-block">Birth</div>
			<div class="col-sm-1 text-center d-none d-sm-block">Missing Date</div>
		</div>

		<c:choose>
			<c:when test="${list.size()==0}">
				<div class="row">
					<div class="col-12 text-center">작성된 글이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto" varStatus="status">
					<div class="row">
						<div class="col-2 col-sm-1 text-center">${dto.seq}</div>
						<div class="col-10 col-sm-6">
							<a
								href="${pageContext.request.contextPath}/childDetail.child?seq=${dto.seq}">${dto.name}</a>
						</div>
						<div class="col-2 col-sm-2">${dto.gender}</div>
						<div class="col-4 col-sm-2">${dto.birth_date}</div>
						<div class="col-4 col-sm-1 text-center">${dto.missing_date}</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<div class="row">
			<div class="col-12 text-center">${pageNavi}</div>
		</div>
		<div class="row">
			<div class="col-12 text-right">
				<button type="button" id="backBtn" name="backBtn">돌아가기</button>
			</div>
		</div>
	</div>
	
	<script>
		$("#backBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/index.jsp";
		});
	</script>
</body>
</html>