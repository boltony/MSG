<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Info</title>
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
	height: 1000px;
	min-width: 1100px;
	position: relative;
}

#leftBar {
	width: 300px;
	height: 100%;
	float: left;
	padding-left: 30px;
	line-height: 20px;
	text-align: center;
}

#leftBar p, #leftBarTitle{
 width:160px; text-align: center;
}

#leftBarTitle {
	height: 100px;
	width: 100%;
	padding-top: 30px;
}

#leftBar_contents1 {
	width: 70%;
	min-width: 800px;
	float: left;
}

#leftBar_contents1 h1 {
}

#leftBar_contents2 {
	width: 70%;
	height: 70%;
	float: left;
	height: 550px;
	line-height: 50px;
}

#pwRe1 {
	width: 130px;
	background-color: white;
	border-radius: 8px;
	background-color: #bf5f5f;
	color: #f8f8f8;
	border: none;
}

#pwRe1:hover {
	background-color: #367c89;
	transition-duration: 0.4s;
}

#pwRe2 {
	width: 100px;
	background-color: white;
	border-radius: 8px;
	background-color: #399fb2;
	color: #f8f8f8;
	border: none;
}

#pwRe2:hover {
	background-color: #367c89;
	transition-duration: 0.4s;
}

.my_icons_container {
	position: relative;
	width: 600px;
	height: 100px;
	padding-top: 20px;
	margin: auto;
	text-align: center;
}

.my_icons {
	float: left;
	text-align: center;
	width: 80px;
	height: 90px;
	margin-left: 15px;
	margin-right: 15px;
	color: #433e3d;
	font-size: 14px;
}

tr {
	height: 40px;
}

.td_fir {
	width: 160px;
	background-color: #e6e6e6;
	padding-left: 15px;
	border-bottom: 2px solid white;
}

.td_sec {
	padding-left: 15px;
	min-width: 500px;
}

#trEmail {
	height: 100px;
}

#modifyBtn {
	width: 120px; height: 40px;
	background-color: #66b5d0;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
}

#zipcode_btn {
	font-size: 15px;
	width: 100px;
	height: 30px;
	background-color: #6f6262;
	color: white;
	border: none;
	border-radius: 5px;
}

input[type='password'], input[type='text'] {
	width: 350px;
	height: 30px;
}
</style>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.loginInfo==null}">
			<jsp:forward page="/member/login_my.jsp"/>;
		</c:when>	
	</c:choose>
	
	<!-- ----- navi 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<!-- ----- navi 끝 ------------------------------------------  -->

	<!-- ----- quick menu 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<!-- ----- quick menu 끝 ------------------------------------------  -->


	<div class=leftContainer>
		<div id=leftBar>
			<div id=leftBarTitle>
				<h3 style="text-align: center; width: 160px;">마이 페이지</h3>
			</div>
			<p><div style="width:160px; height:30px; background-color: #66b5d0; line-height: 30px;">
				<a href="${pageContext.request.contextPath}/member/mypage_Info.jsp" class=mya style="color:white;">나의 정보</a>
			</div></p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_modify.jsp" class=mya>정보 수정하기</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/mywrite.mem" class=mya>내 글 목록</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_out.jsp" class=mya>회원 탈퇴</a>
			</p>

		</div>
		<div id=leftBar_contents1>
			<h1 style="padding-left: 30px;">내 정보</h1>
			<p style="padding-left: 30px; border-bottom: 1px solid black;"><b>${loginInfo.name}</b>님의 소중한 개인 정보입니다.</p>

		</div>
		<div id=leftBar_contents2>
			<div class=my_icons_container>
				<a href="${pageContext.request.contextPath}/member/mypage_Info.jsp"><div class=my_icons>
						<img src="${pageContext.request.contextPath}/resources/images/my_info.png" style="width: 50px;"><br>내
						정보
					</div></a> <a href="${pageContext.request.contextPath}/member/mypage_modify.jsp"><div class=my_icons>
						<img src="${pageContext.request.contextPath}/resources/images/my_modify.png" style="width: 50px;"><br>정보
						수정
					</div></a> <a href="${pageContext.request.contextPath}/mywrite.mem"><div class=my_icons>
						<img src="${pageContext.request.contextPath}/resources/images/my_write.png" style="width: 50px;"><br>내가
						쓴 글
					</div></a> <a href="${pageContext.request.contextPath}/mydonate.mem"><div class=my_icons>
						<img src="${pageContext.request.contextPath}/resources/images/my_heart.png" style="width: 50px;"><br>내
						후원 내역
					</div></a> <a href="${pageContext.request.contextPath}/member/mypage_out.jsp"><div class=my_icons>
						<img src="${pageContext.request.contextPath}/resources/images/my_delete.png" style="width: 50px;"><br>회원
						탈퇴
					</div></a>
			</div>
			<div style="width: 100%; height: 100px;"></div>
			<div style="width: 600px; height: 60%;margin:auto;">

				<div
					style="width: 800px; margin-top: 30px; margin-left: -30px;">
					<form action="${pageContext.request.contextPath}/signup.mem" method="post" id="signup_form">
						<table class=modifyTb>
							<tr>
								<td class=td_fir>아이디
								<td class=td_sec><span><b>${sessionScope.loginInfo.id}</b></span>
							</tr>

							<tr>
								<td class=td_fir>비밀번호 확인 질문
								<td class=td_sec><select name="pw_find_hint"
									id="pw_find_hint" disabled>
										<option value="hint1">기억에 남는 추억의 장소는?</option>
										<option value="hint2">자신의 인생 좌우명은?</option>
										<option value="hint3">자신의 보물 1호는?</option>
										<option value="hint4">가장 기억에 남는 선생님 성함은?</option>
										<option value="hint5">타인이 모르는 자신만의 신체 비밀이 있다면?</option>
										<option value="hint6">추억하고 싶은 날짜가 있다면?</option>
										<option value="hint7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value="hint8">유년시절 가장 생각나는 친구 이름은?</option>
										<option value="hint9">인상 깊게 읽은 책 이름은?</option>
										<option value="hint10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
										<option value="hint11">자신이 두번째로 존경하는 인물은?</option>
										<option value="hint12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
										<option value="hint13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option value="hint14">다시 태어나면 되고 싶은 것은?</option>
										<option value="hint15">내가 좋아하는 캐릭터는?</option>
								</select>
							</tr>
							<tr>
								<td class=td_fir>비밀번호 확인 답변
								<td class=td_sec>${sessionScope.loginInfo.pw_find_answer}
							</tr>
							<tr>
								<td class=td_fir>이름
								<td class=td_sec>${sessionScope.loginInfo.name}
							</tr>
							<tr>
								<td class=td_fir>전화번호
								<td class=td_sec>${sessionScope.loginInfo.phone}
							</tr>
							<tr>
								<td class=td_fir>이메일
								<td class=td_sec>${sessionScope.loginInfo.email}
							</tr>
							<tr>
								<td class=td_fir>우편번호
								<td class=td_sec>${sessionScope.loginInfo.zipcode}
							</tr>
							<tr>
								<td class=td_fir>기본주소
								<td class=td_sec>${sessionScope.loginInfo.address1}
							</tr>
							<tr>
								<td class=td_fir>나머지주소
								<td class=td_sec>${sessionScope.loginInfo.address2}
							</tr>
							<tr id=trEmail>
								<td class=td_fir>이메일 수신여부 <c:choose>
										<c:when test="${sessionScope.loginInfo.email_receive=='Y'}">
											<td class=td_sec><label><input type="radio"
													name="email_receive" value="Y" checked> 수신함</label> <label><input
													type="radio" name="email_receive" value="N" disabled>
													수신하지 않음</label>
												<h5 style="font-size: 11px; color: gray;">본 항목에 '수신함'
													체크시 실종아동 긴급신고 메일이 발송됩니다.</h5>
										</c:when>
										<c:otherwise>
											<td class=td_sec><label><input type="radio"
													name="email_receive" value="Y" disabled> 수신함</label> <label><input
													type="radio" name="email_receive" value="N" checked>
													수신하지 않음</label>
												<h5 style="font-size: 11px; color: gray;">본 항목에 '수신함'
													체크시 실종아동 긴급신고 메일이 발송됩니다.</h5>
										</c:otherwise>
									</c:choose>
							</tr>
						</table>

						<div
							style="width: 100px; position: relative; left: 20%; margin: 40px; height: 100%;">
							<input type=button value="수정하기" id=modifyBtn
								style="height: 100%;">
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>

	<script>
		$("#select_id").on("change", function() {
			$(this).val("").prop("selected", true);
		})

		$("#modifyBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/member/mypage_modify.jsp";
		})

		$("#pw_find_hint>option[value=${sessionScope.loginInfo.pw_find_hint}]")
				.attr("selected", true);
	</script>




	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>