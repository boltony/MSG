<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
* {
	box-sizing: border-box;
}

#wrapper {
	width: 90%;
	margin: auto;
}

button {
	background-color: #FFCC57;
	color: white;
	font-weight: bold;
	border: none;
}

#list {
	margin: auto;
	width: 90%;
	text-align: center;
}

}
#ul{
	width: 500px;
	margin: 0px;
	padding: 0px;
}

#ul>li{
	font-size: 15px;
	list-style: none;
	font-weight: bold;
}

h2 {
	width: 200px;
	font-weight: bold;
}

a:not (#mMenuBtn, #pMenuBtn ){
	color: black;
}

#mMenuBtn, #pMenuBtn {
	width: 170px;
	height: 30px;
	font-size: 20px;
}

#leftMenu {
	margin-left: 40px;
}

#title {
	width: 300px;
	height: 30px;
}

.imgP {
	width: 80%;
}
#header{
	height:25px;
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
#hide{
	display:none;
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
				<h2 style="padding-top:10px">자유게시판</h2>
				<ul >
					<li id="mMenuBtn" ><a href="${pageContext.request.contextPath}/missing.bo">실종아동 제보</a></li>
					<li id="pMenuBtn"><a href="${pageContext.request.contextPath}/protect.bo">보호아동 제보</a></li>
				</ul>
			</div>
			<!--            wrapper에서 내용-->
			<div class="col-9">
				<div class="row" style="height:190px">
					<div class="col-12" style="border-bottom:3px solid #c6c6c6;padding-right:0px">
						<h1 style="font-weight: bold;">실종아동 제보</h1>
						
						<img id="babyImg" src="${pageContext.request.contextPath}/resources/images/%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EC%95%A0%EA%B8%B0%EC%82%AC%EC%A7%84.png">
						<span id="babyText" style="display:inline-block">
						모든 아이들이 웃을 수 있는<br>세상을 응원합니다.
						</span>
					</div>
				</div>
				<div class="row"
					style="padding-top: 20px; padding-right: 62px; min-width: 700px">
					<div class="col-12">
						<form id="contents"
							action="${pageContext.request.contextPath}/write.bo?currentPage=${currentPage}&root=${root}"
							method="post">
							<ul id="ul">
								<li style="padding-top: 10px; color: #535353;">게시판 <select
									id="selectBoard" name="board">
										<option value="M">실종아동 제보</option>
										<option value="P">보호아동 제보</option>
								</select> <select id="selectBox" name="area">
										<option value="1">서울</option>
										<option value="2">경기</option>
										<option value="3">인천</option>
										<option value="4">부산</option>
										<option value="5">대전</option>
										<option value="6">대구</option>
										<option value="7">울산</option>
										<option value="8">광주</option>
										<option value="9">강원</option>
										<option value="10">충북</option>
										<option value="11">충남</option>
										<option value="12">경북</option>
										<option value="13">경남</option>
										<option value="14">전북</option>
										<option value="15">전남</option>
										<option value="16">제주</option>
										<option value="17">세종</option>
								</select>
								<li style="padding-top: 10px; color: #535353;">&nbsp;&nbsp;&nbsp;제목 <input type="text" id="header" name="title">
							</ul>
							<textarea id="summernote" name="summernote">${dto.contents }</textarea>
						</form>
					</div>
				</div>
				<div class="row text-right" style="padding-top: 10px">
					<div class="col-12">
						<button id="registBtn">글쓰기</button>
						<button id="backBtn">목록으로</button>
					</div>
				</div>
			</div>
		</div>
		<div id="hide"></div>
	</div>

	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				disableResizeEditor : true,
				height : 500,
				callbacks : {
					onImageUpload : function(files) {

						// 사진을 보내기 위해 새로운 객체 생성
						// html의 form을 흉내낸 객체
						var data = new FormData();
						data.append("img", files[0]); // (key, value)의 형태로 append 해야 함
						//data.append("root", "${root}");
						$.ajax({
							url : "imgSend.bo?root=${root}",
							enctype : "multipart/form-data",
							type : "post",
							data : data,
							contentType : false, // 
							processData : false, // 
							cache : false, // 
							dataType : "json"
						}).done(function(resp) { //
							console.log("통신 성공!");
							console.log(resp.url);
							$("#hide").html(1);
							var p = $("<p class='imgP'></p>");
							var img = $("<img>")
							$(img).attr("src", resp.url);
							p.append(img);
							$(".note-editable").append(p);

						}).fail(function() {
							console.log("통신 실패!");
						});
					}
				}
			});

			if (JSON.parse("${board =='M'}")) {
				$("#selectBoard>option[value='M']").attr("selected", true);
				$("#title").html("실종아동 제보");
				$("#mMenuBtn>a").css('color', 'white');
				$("#mMenuBtn").css('background-color', '#FFCC57')
				$("#pMenuBtn>a").css('color', 'black');
			} else if (JSON.parse("${board =='P'}")) {
				$("#selectBoard>option[value='P']").attr("selected", true);
				$("#title").html("보호아동 제보");
				$("#pMenuBtn>a").css('color', 'white');
				$("#pMenuBtn").css('background-color', '#FFCC57')
				$("#mMenuBtn>a").css('color', 'black');
			}
		});

		$("#registBtn").on("click", function() {

			$("#summernote").val($(".note-editable").html());

			var header = $("#header").val();
			console.log(header);
			if (header == "") {
				alert("제목을 입력하세요.");
				return;
			}

			var summernote = $("#summernote").val();
			if (summernote == "<p><br></p>") {
				alert("내용을 입력하세요.");
				return;
			}

			console.log($("#summernote").val());
			$("#contents").submit();
		})
		
		$(window).bind("beforeunload", function (e){
			if($("#hide").html()=='1'){
				console.log("ajax시작");
				$.ajax({
					url:"imgDelete.bo",
					method:"post",
					data:{
						root:"${root}"
					},
					dataType:"json"
				}).done(function(data){
					console.log(data.result);
					console.log("이미지 삭제 성공");
				})
			}

		});


		$("#backBtn").on("click", function() {

			console.log("root는 ${root}");
			console.log($("#hide").html());

			if($("#hide").html()=='1'){
				console.log("ajax시작");
				$.ajax({
					url:"imgDelete.bo",
					method:"post",
					data:{
						root:"${root}"
					}
				}).done(function(){
					console.log("이미지 삭제 성공");
					if (JSON.parse("${board == 'M'}")) {
						location.href = "${pageContext.request.contextPath}/missing.bo?currentPage=${currentPage}";
					} else if (JSON.parse("${board == 'P'}")) {
						location.href = "${pageContext.request.contextPath}/protect.bo?currentPage=${currentPage}";
					}
				}).fail(function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
					console.log("실패");
				})
			}
			
		})
		
		
	</script>
<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
</body>
</html>