<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>보호아동 제보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
* {
	box-sizing: border-box;
}
a{
	color: black;
}
#wrapper {
	margin: auto;
}

#list {
	margin: auto;
	width: 90%;
	min-width:850px;
	text-align: center;
}

.tSeq {
	width: 5%;
	
}

.tArea {
	width: 10%;
}

.tWriter {
	width: 15%;
}

.tTitle {
	width: 43%;
	text-align: center;
}

.tDate {
	width: 20%;
}

.tView {
	width: 7%;
}


#pMenuBtn{
	background-color: #FFCC57;
}
#pMenuBtn>a{
	width:160px;
	height:30px;
	font-size:20px;
	list-style:none;
	color:white;
}
td, th{
	border-bottom:2px solid #c6c6c6;
	padding-left:8px;
}
th{
	border-top:2px solid #FFCC57;
	color:#7b7a79;
	background-color:rgba(253, 233, 188, 0.67);
}
#ul{
	width:200px;
	margin:0px;
	padding:0px;
}
#ul>li{
	width:160px;
	height:30px;
	font-size:20px;
	list-style:none;
	color: #535353;
}
button{
	background-color: #FFCC57;
	width:120px;
	height:40px;
	color:white;
	border:none;
}
#searchBtn,  #searchOption{
	height:30px;
	width:80px;
}
h3{
	width:160px;
	height:100px;
	text-align:center;
}
#title{
	font-size:40px;
	margin:0px;
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
a:hover{
	text-decoration:none;
	color:black;
}


</style>
</head>
<body>
<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<div id="wrapper" style="padding-top:10px;min-width:1200px">
		<div class="row" style="padding-left:30px;">
			<!--           wrapper에서 menu-->
			<div class="col-2 text-center" id="leftMenu" style="min-width:220px;">
				<h3 style="padding-top:10px">자유게시판</h3>
				<ul id="ul" style="text-align:center">
					<li id="mMenuBtn" ><a href="${pageContext.request.contextPath}/missing.bo">실종아동 제보</a></li>
					<p></p>
					<li id="pMenuBtn"><a href="${pageContext.request.contextPath}/protect.bo">보호아동 제보</a></li>
					<p></p>
				</ul>
			</div>
			<!--            wrapper에서 내용-->
			<div class="col-9">
				<div class="row" style="height:190px">
					<div class="col-12" style="border-bottom:3px solid #c6c6c6;padding-right:0px">
						<p id="title">보호아동 제보</p>
						
						<img id="babyImg" src="${pageContext.request.contextPath}/resources/images/%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EC%95%A0%EA%B8%B0%EC%82%AC%EC%A7%84.png">
						<span id="babyText" style="display:inline-block">
						모든 아이들이 웃을 수 있는<br>세상을 응원합니다.
						</span>
					</div>
				</div>
				<div class="row text-right" style="padding-top:20px; padding-right:62px;min-width:700px">
					<div class="col-12">
						<form action="${pageContext.request.contextPath}/protect.bo?board=P" method="post">
							<select id="searchOption" name="choice">
								<option>선택</option>
								<option value="area">지역</option>
								<option value="writer">작성자</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
							</select> <input type="text" id="search" name="contents"><button id="searchBtn">검색</button>
						</form>
					</div>
				</div>
				<div class="row" style="padding-top:10px">
					<div class="col-12">
						<table id="list">
							<tr style="border-top:2px solid #FFCC57">
								<th class="tSeq">번호
								<th class="tArea">지역
								<th class="tWriter">작성자
								<th class="tTitle" style="text-align:center">제목
								<th class="tDate">등록일
								<th class="tView">조회수
							</tr>
							<c:choose>
								<c:when test="${fn:length(list)==0}">
									<tr><td colspan=6 style="text-align:center">작성된 글이 없습니다.
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list }" var="dto">
									<tr>
										<td class="tSeq">${dto.seq }
										<td class="tArea">${dto.s_area }
										<td class="tWriter">${dto.writer }
										<td class="tTitle"><a href="${pageContext.request.contextPath}/detailView.bo?seq=${dto.seq }&currentPage=${currentPage}&board=P">${dto.title }</a>
										<td class="tDate">${dto.formed_date }
										<td class="tView">${dto.view_count }
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</table>
					</div>
				</div>
				<div class="row text-right" style="padding-top:30px; padding-right:62px">
					<div class="col-12">
					<c:choose>
					<c:when test="${loginInfo!=null }">
						<button id="writeBtn">글쓰기</button>
					</c:when>
					</c:choose>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-12">${navi }</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$("#writeBtn").on("click", function(){
		location.href="${pageContext.request.contextPath}/writejsp.bo?currentPage=${currentPage}&board=P";
	})
	$("#searchBtn").on("click", function(){
		var search= $("#search").val();
		$("#searchForm").submit();
	})
</script>
<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
</body>
</html>