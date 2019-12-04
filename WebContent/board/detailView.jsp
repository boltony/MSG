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
	width: 90%;
	margin: auto;
}
button{
	background-color:  #FFCC57;
	color:white;
	font-weight:bold;
	border:none;
}

#view {
	margin: auto;
	width: 80%;
}

h2{
	width:200px;
	font-weight:bold;
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

a{
	color:black;
	font-weight:bold;
	text-decoration:none;
}
.upBtn{
	display:none;
	font-size:10px;
	font-weight:bold;
	border:none;
}
.upCancelBtn{
	display:none;
	font-size:10px;
	font-weight:bold;
	border:none;
}

.coInput{
	height:40px;
	width:800px;
}
#mMenuBtn, #pMenuBtn{
	width:170px;
	height:30px;
	font-size:20px;
}
#ul{
	width:200px;
	margin:0px;
	padding:0px;
}

#ul>li{
	list-style:none;
	font-weight:bold;
}
.upBtns{
	display:inline-block;
}

.commentBtns{
	display:inline-block;
	width:130px;
	height:50px;
	float:right;
}
#commentList{
	width:60%;
	margin-left:10px;
}
.comment{
	width:100%;
}

.coWriter{
	font-weight:bold;
	color:#6d6d6d;
	width:70px;
	display:inline-block;
}
.coDate{
	display:inline-block;
	width:100px;
	font-size:11px;
	color:#7e7e7e;
}
.coInput{
	padding:0px;
	margin-top:5px;
	width:700px;
	padding-left:20px;
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
				<h2 style="padding-top:10px">자유게시판</h2>
				<ul id="ul">
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
				<div class="row" style="padding-top:20px; width:100%;min-width:700px">
					<div class="col-12">
						<table id="view">
							<tr>
								<th style="border-top:2px solid #FFCC57;">제목
								<td style="border-top:2px solid #FFCC57;" class="dto">${dto.title }
							</tr>
							<tr>
								<th>지역
								<td class="dto">${dto.s_area }
							</tr>
							<tr>
								<th>날짜
								<td class="dto">${dto.formed_date }
							</tr>
							<tr>
								<c:choose>
								<c:when test="${loginInfo.manager_check=='Y' }">
									<th>작성자
									<td class="dto"><a href="#" id="blackCheck">${dto.writer }</a>
								</c:when>
								<c:otherwise>
									<th>작성자
									<td class="dto">${dto.writer }
								</c:otherwise>
								</c:choose>
							</tr>
							<tr> 
								<td colspan=2 class="contents" style="border-bottom:2px solid #FFCC57;">${dto.contents }
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="commentList" style = "margin-top:10px;">
						<c:choose>
							<c:when test="${list!=null }">
								<c:forEach items="${list }" var="comment">
									<div class="comment" seq="${comment.seq }">
										<span class="coWriter">${comment.writer}</span>&nbsp;<span class="coDate">${comment.formed_date}</span>
											<c:choose>
												<c:when test="${loginInfo.id==comment.writer}">
												<span class="commentBtns"><button class="coUpdate" seq="${comment.seq }">수정</button>
												<button class="coDelete" seq="${comment.seq }">삭제</button></span>
												</c:when>
												<c:when test="${loginInfo.managet_check=='Y'}">
												<span class="commentBtns"><button class="coUpdate" seq="${comment.seq }">수정</button>
												<button class="coDelete" seq="${comment.seq }">삭제</button></span>
												</c:when>
									
											</c:choose>
										<br>
										<textarea class='coInput' seq="${comment.seq }" readonly=true>${comment.contents}</textarea>
										<div class="upBtns"><a class='upBtn' seq="${comment.seq }">수정완료</a>&nbsp;<a class="upCancelBtn" seq="${comment.seq }">수정취소</a></div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="row text-center">
					<div id="coNavi" class="col-12">${coNavi }</div>
				</div>
				<div class="row text-center" id="newComment" style="padding-top:10px">
					<c:choose>
						<c:when test="${loginInfo!=null}">
							<div class="col-12">
								<input type="text" name="contents" id="commentInput">
							
								<input type="button" id="registBtn" value="등록">
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="row text-right">
					<div id="tableBtns" class="col-12">
						<c:choose>
							<c:when test="${loginInfo.id==dto.writer }">
								<button id="updateBtn">수정</button>
								<button id="deleteBtn">삭제</button>
								<button id="backBtn">목록으로</button>
							</c:when>
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
	
		$(document).ready(function() {
		  	if(JSON.parse("${board =='M'}")){
		  		$("#selectBoard>option[value='M']").attr("selected", true);
		  		$("#title").html("실종아동 제보");
		  		$("#mMenuBtn>a").css('color','white');
		  		$("#mMenuBtn").css('background-color','#FFCC57')
		  		$("#pMenuBtn>a").css('color','black');
		  	}else if(JSON.parse("${board =='P'}")){
		  		$("#selectBoard>option[value='P']").attr("selected", true);
		  		$("#title").html("보호아동 제보");
		  		$("#pMenuBtn>a").css('color','white');
		  		$("#pMenuBtn").css('background-color','#FFCC57')
		  		$("#mMenuBtn>a").css('color','black');
		  	}
		  	
		});
		
		
		$(document).on("click", ".pageNavi", function(){
			console.log(".pageNavi");
			$("#hide").html( $(this).attr("currentNaviPage"));
			$.ajax({
				url : "commetsList.co",
				method : "post",
				data : {
					root : $(this).attr("seq"),
					currentCoPage : $(this).attr("currentNaviPage"),
					root : "${dto.seq}"
				},
				dataType : "json"
			}).done(function(data) {
				var list = JSON.parse(data.list);
				console.log(list[1]);
				if(list!=null){

					$("#coNavi").html("");
					$("#coNavi").html(data.coNavi);
					$("#commentList").html("");	
					$("#hide").html(data.currentCoPage);

					var login = "${loginInfo.id}";
					$.each(list, function(index, value){	
						
						if(login==value.writer){
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span><span class='commentBtns'><button class='coUpdate' seq="+value.seq+">수정</button>&nbsp;<button class='coDelete' seq="+value.seq+">삭제</button></span></div>");
						}else{
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span></div>");
						}
						$(".comment[seq="+value.seq+"]").append("<br><textarea class='coInput' seq="+value.seq+" readonly=true>"+value.contents+"</textarea></div>&nbsp;<div class='upBtns'><a class='upBtn' seq="+value.seq+">수정완료</a>&nbsp;<a class='upCancelBtn' seq="+value.seq+">수정취소</a>");
					})
					
				}
			})
		})
		
		
		$(document).on("click", ".coUpdate", function(){
			var seq = $(this).attr("seq");
			console.log(seq);
			$(".coInput[seq="+seq+"]").attr("readonly", false);
			$(".coInput[seq="+seq+"]").css("border", "1px solid black");
			$(".coInput[seq="+seq+"]").css("height", "40px");
			$(".coInput[seq="+seq+"]").css("width", "700px");
			$(".coInput[seq="+seq+"]").css("resize", "none");
			$(".upBtn[seq="+seq+"]").css("display", "inline-block");
			$(".coWriter[seq="+seq+"]").css("display", "inline-block");
			$(".coDate[seq="+seq+"]").css("display", "inline-block");
			$(".upCancelBtn[seq="+seq+"]").css("display", "inline-block");


		})	
		$(document).on("click", ".upCancelBtn", function(){
			var seq = $(this).attr("seq");
			console.log(seq);
			$(".coInput[seq="+seq+"]").attr("readonly", true);
			$(".coInput[seq="+seq+"]").css("border", "none");
			$(".upBtn[seq="+seq+"]").css("display", "none");
			$(".upCancelBtn[seq="+seq+"]").css("display", "none");
			

		})	
		
		
		$(document).on("click", ".upBtn", function(){
			$.ajax({
				url : "update.co",
				method : "post",
				data : {
					seq : $(this).attr("seq"),
					comments : $(".coInput[seq="+$(this).attr("seq")+"]").val(),
					root : "${dto.seq}",
					currentCoPage : $("#hide").html()
				},
				dataType : "json"
			}).done(function(data){
				var list = JSON.parse(data.list);
				$("#hide").html(1);
				if(list!=null){
					$("#coNavi").html("");
					$("#coNavi").html(data.coNavi);
					$("#commentList").html("");	
					$("#commentInput").val("");

					var login = "${loginInfo.id}";
					$.each(list, function(index, value){	
						
						if(login==value.writer){
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span><span class='commentBtns'><button class='coUpdate' seq="+value.seq+">수정</button>&nbsp;<button class='coDelete' seq="+value.seq+">삭제</button></span></div>");
						}else{
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span></div>");
						}
						$(".comment[seq="+value.seq+"]").append("<br><textarea class='coInput' seq="+value.seq+" readonly=true>"+value.contents+"</textarea></div>&nbsp;<div class='upBtns'><a class='upBtn' seq="+value.seq+">수정완료</a>&nbsp;<a class='upCancelBtn' seq="+value.seq+">수정취소</a>");
					})
				}
			})
		})
        
		
		$(document).on("click", ".coDelete", function(){
			$.ajax({
				url : "delete.co",
				method : "post",
				data : {
					seq : $(this).attr("seq"),
					root : "${dto.seq}",
					currentCoPage : $("#hide").html()
				},
				dataType : "json"
			}).done(function(data){
				var list = JSON.parse(data.list);
				$("#hide").html(1);
				if(list!=null){
					$("#coNavi").html("");
					$("#coNavi").html(data.coNavi);
					$("#commentList").html("");	
					$("#commentInput").val("");

					var login = "${loginInfo.id}";
					$.each(list, function(index, value){	
						
						if(login==value.writer){
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span><span class='commentBtns'><button class='coUpdate' seq="+value.seq+">수정</button>&nbsp;<button class='coDelete' seq="+value.seq+">삭제</button></span></div>");
						}else{
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span></div>");
						}
						$(".comment[seq="+value.seq+"]").append("<br><textarea class='coInput' seq="+value.seq+" readonly=true>"+value.contents+"</textarea></div>&nbsp;<div class='upBtns'><a class='upBtn' seq="+value.seq+">수정완료</a>&nbsp;<a class='upCancelBtn' seq="+value.seq+">수정취소</a>");
					})
				}		
			})
		})
		
		$(document).on("click", "#registBtn", function(){
			$.ajax({
				url : "write.co",
				method : "post",
				data : {
					root : "${dto.seq}",
					comments : $("#commentInput").val(),
					currentCoPage : $("#hide").html()
				},
				dataType : "json"
			}).done(function(data) {
				var list = JSON.parse(data.list);
				$("#hide").html(1);
				if(list!=null){
					$("#coNavi").html("");
					$("#coNavi").html(data.coNavi);
					$("#commentList").html("");	
					$("#commentInput").val("");
					
					var login = "${loginInfo.id}";
					$.each(list, function(index, value){	
					
						if(login==value.writer){
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span><span class='commentBtns'><button class='coUpdate' seq="+value.seq+">수정</button>&nbsp;<button class='coDelete' seq="+value.seq+">삭제</button></span></div>");
						}else{
							$("#commentList").append( "<div class='comment' seq="+value.seq+"><span class='coWriter'>"+value.writer+"</span>&nbsp<span class='coDate'>"+value.formed_date+"</span></div>");
						}
						$(".comment[seq="+value.seq+"]").append("<br><textarea class='coInput' seq="+value.seq+" readonly=true>"+value.contents+"</textarea></div>&nbsp;<div class='upBtns'><a class='upBtn' seq="+value.seq+">수정완료</a>&nbsp;<a class='upCancelBtn' seq="+value.seq+">수정취소</a>");
					})
				}
			})
		})
		
		$("#backBtn").on("click", function() {
			if (JSON.parse("${board == 'M'}")) {
				location.href = "${pageContext.request.contextPath}/missing.bo?currentPage=${currentPage}";
			} else if (JSON.parse("${board == 'P'}")) {
				location.href = "${pageContext.request.contextPath}/protect.bo?currentPage=${currentPage}";
			}
		})
		$("#deleteBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/delete.bo?seq=${dto.seq}&currentPage=${currentPage}&board=${dto.board}";
		})
		$("#updateBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/updatejsp.bo?seq=${dto.seq}&currentPage=${currentPage}&board=${dto.board}";
		})
		
		$("#blackCheck").on("click", function(){
			var settings ="toolbar=0,directories=0,status=no,menubar=0,resizable=no,height=200,width=300";
			window = window.open("blackCheckWindow.bo?id=${dto.writer}","name",settings);
	        
		})
		
		
	</script>
<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
</body>
</html>