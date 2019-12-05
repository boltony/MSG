<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
* {
	box-sizing: border-box;
}

#wrapper {
	margin: auto;
}
#updateBtn, #deleteBtn, #backBtn{
	background-color: #FFCC57;
	width:120px;
	height:40px;
	color:white;
	border:none;
}

#view {
	margin: auto;
	width: 80%;
}
td, th{
	border-bottom:2px solid #e0e0e0;
	padding-left:8px;
}
th{
	color:#7b7a79;
	width: 20%;
	text-align: left;
	background-color:rgba(253, 233, 188, 0.67);
}

.dto {
	width: 80%;
	text-align: left;
}
.contents {
	height: 400px;
}

#commentInput {
	width: 800px;
}

#registBtn {
	background-color:  #FFCC57;
	color:white;
	font-weight:bold;
	border:none;
	width: 50px;
	padding-top:1px;
	height:30px;
}

#tr {
	text-align: right;
	padding: 0px;
	margin: 0px;
}

#tl {
	text-align: left;
	padding: 0px;
	margin: 0px;
}
textarea[readonly=true]{
	resize:none;
	border:none;
}

a:not(.poline){
	color:black;
	font-weight:bold;
	text-decoration:none;
}

#tableBtns{
	padding-top:10px;
}

#leftMenu{
	margin-left:40px;
}
.imgP{
	width:60%;
	margin:0px;
	padding:0px;
}
img{
	max-width:100%;
	height:auto;
}
#title{
	font-size:40px;
	margin:0px;
	display:inline-block;
}
h1{
	display:inline-block;
}
#babyText{
	padding-top:20px;
	float:right;
	text-align:right;
	color:#ff9e1b;
	font-weight:bold;
	font-size:20px;
}
#babyImg{
	width:180px;
	height:190px;
	padding:0px;
	margin:0px;
	float:right;
}


</style>
</head>
<body>
<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<div id="wrapper" style="padding-top:10px;min-width:1200px">
		<div class="row">
			<!--           wrapper에서 menu-->
			<div class="col-2 text-center" id="leftMenu" style="min-width:220px;">
			</div>
			<!--            wrapper에서 내용-->
			<div class="col-9">
				<div class="row" style="height:190px">
					<div class="col-12" style="border-bottom:3px solid #c6c6c6;padding-right:0px">
						<p id="title">공지사항</p>
						
						<img id="babyImg" src="${pageContext.request.contextPath}/resources/images/%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EC%95%A0%EA%B8%B0%EC%82%AC%EC%A7%84.png">
						<span id="babyText" style="display:inline-block">
						모든 아이들이 웃을 수 있는<br>세상을 응원합니다.
						</span>
					</div>
				</div>
				<div class="row" style="padding-top:20px; width:100%;min-width:700px">
					<div class="col-12">
						<table id="view">
							<tr>
								<th style="border-top:2px solid #FFCC57;">제목
								<td style="border-top:2px solid #FFCC57;" class="dto">${dto.title }
							</tr>
							<tr> 
								<td colspan=2 class="contents" style="border-bottom:2px solid #FFCC57;">${dto.contents }
							</tr>
						</table>
					</div>
				</div>
				<div class="row text-right" style="padding-top:30px; padding-right:62px">
					<div id="tableBtns" class="col-12">
						<c:choose>
							<c:when test="${loginInfo.manager_check=='Y' }">
								<button id="updateBtn">수정</button>
								<button id="deleteBtn">삭제</button>
								<button id="backBtn">목록으로</button>
							</c:when>
							<c:otherwise>
								<button id="backBtn">목록으로</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	


		$("#backBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/notice.no?currentPage=${currentPage}";
		})
		$("#deleteBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/delete.no?seq=${dto.seq}&currentPage=${currentPage}";
		})
		$("#updateBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/updatejsp.no?seq=${dto.seq}&currentPage=${currentPage}";
		})
		
		
	</script>
<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
</body>
</html>