<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js">
        </script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
   integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
   crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Gothic|Nanum+Myeongjo|Noto+Sans+KR:400,700,900|Noto+Serif+KR&display=swap')
	;
/*          font-family: 'Noto Sans KR', sans-serif;
            font-family: 'Nanum Myeongjo', serif;
            font-family: 'Gothic A1', sans-serif;
            font-family: 'Noto Serif KR', serif;
            font-family: 'Nanum Gothic', sans-serif;  */
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SunBatang-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/SunBatang-Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/*       ---------------------------------------     */
.navbar {
	height: 125px;
}

.nav-link {
	background-color: white;
}

#upnavi {
	position: relative;
	margin: 3px;
	float: right;
	color: #717171;
}

.mainSmallMenu {
	text-decoration: none;
	text-decoration-line: none;
	color: #717171;
}

.mainSmallMenu:hover {
	text-decoration-line: none;
	color: #35add1;
}

.btn-outline-success {
	background-color: #47acac;
	border: none;
	color: #fafafa;
}

.btn-outline-success:hover {
	background-color: #2d9191;
	border: none;
	color: #fafafa;
}

.btn-outline-success1 {
	background-color: #bf5f5f;
	border: none;
	color: #fafafa;
}

.btn-outline-success, .btn-outline-success1 {
	margin: 5px;
	width: 90px;
	height: 35px;
}

.btn-outline-success1:hover {
	background-color: #9d3737;
	border: none;
	color: #fafafa;
}

#navbarNavDropdown{
	padding-left: 5px;
	background-color: white;
	z-index: 1;
}

/*      --------------------------------------------------      */
* {
	margin: 0;
	padding: 0;
	/*                font-family: 'Noto Sans KR', sans-serif; */
	font-family: 'GoyangIlsan';
}

.d1, .checkmate {
	background-size: cover;
	height: 100vh;
	background-attachment: fixed;
}

.a1 {
	background-image: url(${pageContext.request.contextPath}/resources/images/s1.jpg);
	min-width: 1000px
}

.a2 {
	background-image: url(${pageContext.request.contextPath}/resources/images/s2.jpg);
}

.a3 {
	background-image: url(${pageContext.request.contextPath}/resources/images/s3.jpg);
}

#nav1 {
	height: 20vw;
	max-height: 300px;
	min-height: 250px;
	min-width: 1000px;
	background-color: #57abb5;
}

#nav-container1 {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #6faabf;
	list-style-type: none;
	font-size: 20px;
}

.nav-item1 {
	padding: 10px;
	cursor: pointer;
	text-align: center;
	max-height: 100%;
	min-width: 150px;
	text-shadow: 2px 2px 2px #9b9b9b;
	margin: auto;
	float: left;
	width: 18%;
	max-width: 300px;
	max-height: 300px;
	/*                border-right: 1px solid white;*/
	font-size: 16px;
}

.nav-item1 a {
	text-align: center;
	text-decoration: none;
	color: white;
}

.nav-item1 a.current {
	color: black;
}

.nav-item1
 
a
:hover
:not
 
(
.current
 
){
}
.nav-item1:last-child {
	border-right: none;
}

.nav-item1:hover {
	background-color: #79b5cb;
	transition-duration: 0.4s;
}

.navNo:hover {
	background-color: #6faabf;
	cursor: auto;
}

#title_1 {
	height: 10vw;
	line-height: 10vw;
	min-height: 120px;
	max-height: 120px;
	margin: auto;
	/*                background-color: #3198a5;*/
	min-width: 1200px;
	background-color: #6faabf;
	color: white;
	font-weight: 400;
	text-align: center;
	text-shadow: 2px 2px 2px #646464;

	/*                text-shadow: 2px 2px 2px #646464;*/
}

#toNews, #toNews:hover {
	text-decoration: none;
	color: wheat;
}

/*  -----------------------------------------------------------------------          */
img {
	width: 10vw;
}

.row {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 20vw;
	max-height: 200px;
	min-height: 160px;
	min-width: 800px;
	margin: 0;
	padding: 0;
	background-color: #37a9b7;
	list-style-type: none;
	font-size: 20px;
	text-align: center;
}

.row1 {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 20vw;
	max-height: 200px;
	min-height: 160px;
	min-width: 800px;
	margin: 0;
	padding: 0;
	background-color: #4f64ba;
	list-style-type: none;
	font-size: 20px;
	text-align: center;
}

.col {
	
}

.inner {
	background-color: #4f64ba;
	min-height: 00px;
}

#titleLogo {
	width: 200px;
	margin-top: -50px;
}

a {
	text-decoration: none;
	color: white
}

h1, h2 {
	color: white;
	margin: auto;
}

.col {
	width: 20%;
}

img {
	width: 140px;
}

.chess {
	float: left;
	width: 33.3%;
	height: 100%;
	background-size: cover;
}

.chessboard {
	height: 400px;
}

h3 {
	font-family: 'Noto Sans KR', sans-serif;
	color: #00ade0;
	
}

h4, p {
	font-family: 'Noto Sans KR', sans-serif;
	padding-top: 135px;
	color: white;
}

.chess_sheet {
	text-align: center;
	height: 100%;
	background-color: #00000060;
}
.chess_sheet>h3{
text-shadow: 1px 1px 1px #b5b5b5;
}
.chess_sheet>h4{
text-shadow: 1px 1px 1px #b5b5b5;
}

.chess_sheet_over {
	text-align: center;
	height: 100%;
	background-color: #00000090;
}

.chess>a {
	text-decoration: none;
}

.checkmate {
	transition: width 2s;
	height: 100%;
	min-width: 1200px;
}

.chess_sheet_over {
	display: none;
}

.chess:hover .chess_sheet_over {
	display: block;
}

.chess:hover .chess_sheet {
	display: none;
	transition: width 2s;
}

.chess_sheet_over, .chess_sheet {
	
}

button[id^=login] {
	width: 250px;
	height: 40px;
	background-color: white;
	color: black;
	border-radius: 5px;
	border: none;
}

/*        ------------------------ 하단 --------------------------    */
.policyContainer {
	background-color: #b1b1b1;
	min-width: 1200px;
}

#policyTitle1 {
	min-width: 1200px;
	color: #747474;
	height: 350px;
	/*                background-color: #363333;*/
	background-color: white;
}

#policyTitle2 {
	color: #4e4e4e;
	text-align: center;
	width: 100%;
	height: 100px;
	line-height: 100px;
	min-width: 1200px;
}

#policy1 {
	margin-top: 100px;
	margin-left: 100px;
	float: left;
}

#policy2 {
	margin: 100px;
	width: 300px;
	float: right;
	line-height: 30px;
}

.poline {
	color: #747474;
	text-shadow: 0px 0px 1px #b5b5b5;
}

.poline:hover {
	text-decoration: none;
	color: #fdb813;
	text-shadow: 0px 0px 1px #b5b5b5;
}
</style>
</head>
<body>
	<c:choose>
	<c:when test="${loginInfo==null}">
	<div id=upnavi>
            <a href="${pageContext.request.contextPath}/member/login.jsp" class=mainSmallMenu>로그인</a> |
            <a href="${pageContext.request.contextPath}/member/signup.jsp" class=mainSmallMenu>회원가입</a> |
            <a href="${pageContext.request.contextPath}/member/login_my.jsp" class=mainSmallMenu>마이페이지</a>   
        </div>
	</c:when>
	<c:when test="${loginInfo!=null and loginInfo.manager_check=='Y'}">
	<div id=upnavi>
           ${loginInfo.name} 님 환영합니다! |
           <a href="${pageContext.request.contextPath}/viewAll.man" class=mainSmallMenu>관리자 페이지</a> |
           <a href="${pageContext.request.contextPath}/logout.mem" class=mainSmallMenu>로그아웃</a>
        </div>     
	</c:when>
	<c:when test="${loginInfo!=null and loginInfo.manager_check=='N'}">
	<div id=upnavi>
           ${loginInfo.name} 님 환영합니다! |
           <a href="${pageContext.request.contextPath}/member/mypage.jsp" class=mainSmallMenu>마이페이지</a> |
           <a href="${pageContext.request.contextPath}/logout.mem" class=mainSmallMenu>로그아웃</a>　
        </div>     
	</c:when>
	</c:choose>

	<nav class="navbar navbar-expand-lg navbar-light navbar-custom" style="width: 100%">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main.jsp">
      		<img src="${pageContext.request.contextPath}/resources/images/logo_n.png"
        	 style="width: 250px; margin-top: -40px;">
		</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
         aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
         <ul class="navbar-nav">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/notice.no">공지사항 <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/child/insertInfo.jsp">실종아동등록</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/childList.child">실종아동찾기</a></li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">자유게시판</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/missing.bo">실종 아동 제보하기</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/protect.bo">보호 아동 제보하기</a>
               </div>
			</li>

            <button class="btn btn-outline-success1" type="button">긴급신고</button>
            <button class="btn btn-outline-success" type="button">후원하기</button>
         </ul>
      </div>
	</nav>


   <div class="d1 a1">
      <div
         style="position: relative; top: 450px; left: 50px; font-size: 50px; width: 900px; text-shadow: 2px 2px 1px #646464;">
         <b>실종 아동이 가족의 품으로 돌아갈 수 있도록<br>관심과 힘을 보내 주세요
         </b> <br> <span style="color: white; font-size: 30px;">당신의 <span
            style="color: #3853c3;"><b>공유</b></span>가 희망이 됩니다
         </span>
      </div>
   </div>


   <div id=title_1>
      <h1
         style="font-family: 'Noto Sans KR', sans-serif; font-weight: 600; height: 100px; line-height: 120px;">여러분의
         관심은 실종된 아이와 가족을 찾을 수 있는 유일한 희망입니다</h1>
   </div>
   <nav id=nav1>
      <ul id="nav-container1">
         <li class="nav-item1"><a href="${pageContext.request.contextPath}/member/signup.jsp">
         <img src="${pageContext.request.contextPath}/resources/images/house.svg" style="max-width: 150px"><br>
               <h2>함께하기</h2></a></li>
         <li class="nav-item1"><a href="${pageContext.request.contextPath}/childList.child">
         <img src="${pageContext.request.contextPath}/resources/images/photo.svg"><br>
               <h2>아동찾기</h2></a></li>
         <li class="nav-item1 navNo" style="width: 200px"><img
            src="${pageContext.request.contextPath}/resources/images/logo_blue.png" style="width: 200px"
            id=titlelogo></li>
         <li class="nav-item1"><a href="${pageContext.request.contextPath}/missing.bo">
         <img src="${pageContext.request.contextPath}/resources/images/danger_sign.svg"><br>
               <h2>제보하기</h2></a></li>
         <li class="nav-item1"><a href="${pageContext.request.contextPath}/support/support_page.jsp">
         <img src="${pageContext.request.contextPath}/resources/images/heart.svg"><br>
               <h2>후원하기</h2></a></li>
      </ul>
   </nav>


   <div class="d1 a2">
      <div
         style="position: relative; top: 450px; left: 650px; font-size: 50px; width: 1200px; text-align: right; color: #e3e3e3; text-shadow: 2px 2px 2px #646464;">
         <b>"직접 발품 팔 수밖에..." 애타는 장기 실종자 가족 <a href="#" id=toNews
            onclick="window.open('https://hugs.fnnews.com/article/201912020929455305','news','width=1200,height=900,location=no,status=no,scrollbars=no'); return false;">
               <img src="${pageContext.request.contextPath}/resources/images/pointer.png" style="width: 50px;"><span
               style="font-size: 15px;">기사 보기</span>
         </a></b> <br>
         <span style="color: white; font-size: 20px;"> 매년 <span
            style="color: #ded612;"><b>5월 25일</b></span>은 실종 아동 모두가 무사히 돌아오기를
            기원하는 세계 실종 아동의 날로 지정되어 있습니다.
         </span>
      </div>
   </div>

   <div class=checkmate>
		<div class=chessboard>
			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z1.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_1.jsp','chess1','width=850,height=550,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>세계 실종 아동의 날</h4>
						<h3>International Missing Children’s Day</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>
							세계 실종 아동의 날을 기념하여, 매년 실종 아동에 대한 일반인들의 인식 확대와<br>
							지속적인 관심을 고취하기 위한 날입니다.
						</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>

			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z5.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_2.jsp','chess2','width=850,height=500,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>
							실종 아동 예방 수칙
						</h4>
						<h3>내 자녀를 위험으로부터 보호해 주세요</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>아이들의 실종 예방을 위한 대처 방법입니다.</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>

			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z6.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_3.jsp','chess3','width=850,height=450,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>안전 Dream의 지문 등 사전등록제</h4>
						<h3>실종 예방을 위해 미리 등록해 주세요</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>
							실종을 방지하고, 발생 시 신속한 발견을 위해<br>
							사전에 등록하는 제도를 운영합니다.
						</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>
		</div>

		<div class=chessboard>
			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z2.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_4.jsp','chess4','width=850,height=600,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>실종 신고</h4>
						<h3>빠른 신고가 가장 중요합니다</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>실종 아동 발생 시 무엇보다 중요한 것은 <b>빠른 조치</b>입니다.</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>

			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z3.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_5.jsp','chess5','width=850,height=700,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>아이들에게 꼭 알려 주세요</h4>
						<h3>가장 중요한 것은 예방입니다</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>부모님과 아이들이 함께 알아야 할 수칙들</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>

			<div class=chess
				style="background-image: url(${pageContext.request.contextPath}/resources/images/z8.jpg)">
				<!-- 한 개의 큰 틀 -->
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/main_chess_6.jsp','chess6','width=850,height=450,location=no,status=no,scrollbars=no'); return false;">
					<div class=chess_sheet>
						<!-- 호버 전 -->
						<h4>실종 아동 현황</h4>
						<h3>우리나라의 실종 아동 현황입니다</h3>
					</div>
					<div class=chess_sheet_over>
						<!-- 호버 후 -->
						<p>
							우리나라에서는 2007년부터 실종아동의 날을 제정하고 매년 행사를 열어<br>
							아동 실종문제에 대한 사회적 관심을 집중시키고자 노력하고 있습니다.
						</p>
						<p style="color: #37a9b7;">더 보기 ></p>
					</div>
				</a>
			</div>
		</div>
	</div>

   <!--
<div style="background-color: #5c5c5c; height: 100px;">

</div>
-->


   <!-- 하단 -->
	<div class=policyContainer>
		<div id=policyTitle1>
			<div id=policy1>
				<img src="${pageContext.request.contextPath}/resources/images/logo_n.png"
					style="width: 200px; margin-left: -25px;"><br><br>
					+82 10 0000 0000<br>
					info@msg.missingchildren<br>
					Daeil-building 3F, 120 Namdaemun-ro Jung-gu Seoul Republic of Korea<br>
			</div>
			<div id=policy2>
				<a href="${pageContext.request.contextPath}/main.jsp" class=poline>Home</a><br> 
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/policy.jsp','policy1',
				'width=850,height=630,location=no,status=no,scrollbars=no'); return false;">개인 정보 취급 방침</a><br>
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/terms.jsp','policy2',
				'width=850,height=630,location=no,status=no,scrollbars=no'); return false;">이용 안내</a><br>
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/emailCollect.jsp','policy3',
				'width=850,height=430,location=no,status=no,scrollbars=no'); return false;">이메일 무단 수집 거부</a><br>
				<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/inquiry.jsp','policy4',
				'width=850,height=430,location=no,status=no,scrollbars=no'); return false;">문의하기</a><br>
			</div>
		</div>

		<div id=policyTitle2>Copyright © 2019 KH Missing children Go home ㅣ Created by MSG All Right Reserved</div>
	</div>
   
   <!--  -------------- script 시작 -------------------  -->
   <script>
	$(".btn-outline-success1").on("click",function(){
		location.href="${pageContext.request.contextPath}/sos/em.jsp";
	});
   
	$(".btn-outline-success").on("click",function(){
		location.href="${pageContext.request.contextPath}/support/support_page.jsp";
	});
   </script>
   <!--  -------------- script 끝 -------------------  -->

</body>
</html>