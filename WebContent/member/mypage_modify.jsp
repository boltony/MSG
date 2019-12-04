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
}

.mya:hover {
	text-decoration: none;
}

.leftContainer {
	width: 100%;
	height: 1300px;
	min-width: 1100px;
	position: relative;
}

#leftBar {
	width: 300px;
	height: 100%;
	float: left;
	padding-left: 30px;
	line-height: 20px;
}

#leftBarTitle {
	height: 100px;
	width: 100%;
	padding-top: 30px;
}

#leftBar_contents1 {
	/*background-color: #7ac9d8; */
	width: 70%;
	height: 100px;
	min-width: 800px;
	float: left;
}

#leftBar_contents1 h3 {
	line-height: 50px;
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
	width: 100px;
	height: 30px;
	background-color: #2a9cb1;
	color: white;
	border: none;
	border-radius: 5px;
}

#zipcode_btn {
	font-size: 15px;
	width: 100px;
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
	<!-- ----- navi 시작 ------------------------------------------  -->
	<c:choose>
	<c:when test="${sessionScope.loginInfo==null}">
		<jsp:forward page="/member/login_my.jsp"/>;
	</c:when>	
	</c:choose>
	
	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<!-- ----- navi 끝 ------------------------------------------  -->

	<!-- ----- quick menu 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<!-- ----- quick menu 끝 ------------------------------------------  -->


	<div class=leftContainer>
		<div id=leftBar>
			<div id=leftBarTitle>
				<h3>마이 페이지</h3>
			</div>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_Info.jsp" class=mya>나의 정보</a>
			</p>
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
			<h3 style="padding-left: 30px;">정보 수정</h3>
			<p style="padding-left: 30px;">정보를 수정할 경우에는 <u>비밀번호를 꼭 다시</u> 한 번 입력해 주세요.</p>

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
			<div style="width: 70%; height: 60%; float: left;">

				<div
					style="width: 800px; margin-top: 30px; margin-left: 150px;">
					<form action="${pageContext.request.contextPath}/infoModify.mem" method="post" id="frm">
						<table class=modifyTb>
							<tr>
								<td class=td_fir>아이디
								<td class=td_sec><span><b>${sessionScope.loginInfo.id}</b></span>
							</tr>

							<tr>
								<td class=td_fir>비밀번호
								<td class=td_sec><input type="password" id="pw" name="pw"
									placeholder=" 9~20자 이내 영문, 숫자, 특문(!,@,#,$,%,^,&,*)"><br>
									<span class="alert2" id="alert_pw_form"></span>
							</tr>

							<tr>
								<td class=td_fir>비밀번호 확인
								<td class=td_sec><input type="password" id="pw_check"
									name="pw_check" placeholder=" 비밀번호 한번 더 입력"><br> <span
									class="alert1" id="alert_pw"></span>
							</tr>



							<tr>
								<td class=td_fir>비밀번호 확인 질문
								<td class=td_sec><select name="pw_find_hint"
									id="pw_find_hint">
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
								<td class=td_sec><input type="text" id="pw_find_answer"
									name="pw_find_answer"
									value="${sessionScope.loginInfo.pw_find_answer}">
							</tr>
							<tr>
								<td class=td_fir>이름
								<td class=td_sec>${sessionScope.loginInfo.name}
							</tr>
							<tr>
								<td class=td_fir>전화번호
								<td class=td_sec><input type="text" id="phone" name="phone"
									value="${sessionScope.loginInfo.phone}"><br>
									<p class="alert2" id="alert_phone_form"></p>
							</tr>
							<tr>
								<td class=td_fir>이메일
								<td class=td_sec><input type="text" id="email" name="email"
									value="${sessionScope.loginInfo.email}"><br>
									<p class="alert2" id="alert_email_form"></p>
							</tr>
							<tr>
								<td class=td_fir>우편번호
								<td class=td_sec><input type="text" id="zipcode"
									name="zipcode" value="${sessionScope.loginInfo.zipcode}">
									<input type="button" id="zipcode_btn" value="우편번호 찾기"
									onclick="sample4_execDaumPostcode()">
							</tr>
							<tr>
								<td class=td_fir>기본주소
								<td class=td_sec><input type="text" id="address1"
									name="address1" value="${sessionScope.loginInfo.address1}">
							</tr>
							<tr>
								<td class=td_fir>나머지주소
								<td class=td_sec><input type="text" id="address2"
									name="address2" value="${sessionScope.loginInfo.address2}">
							</tr>
							<tr id=trEmail>
								<td class=td_fir>이메일 수신여부 <c:choose>
										<c:when test="${sessionScope.loginInfo.email_receive=='Y'}">
											<td class=td_sec><label><input type="radio"
													name="email_receive" value="Y" checked> 수신함</label> <label><input
													type="radio" name="email_receive" value="N"> 수신하지
													않음</label>
												<h5 style="font-size: 11px; color: gray;">본 항목에 '수신함'
													체크시 실종아동 긴급신고 메일이 발송됩니다.</h5>
										</c:when>
										<c:otherwise>
											<td class=td_sec><label><input type="radio"
													name="email_receive" value="Y"> 수신함</label> <label><input
													type="radio" name="email_receive" value="N" checked>
													수신하지 않음</label>
												<h5 style="font-size: 11px; color: gray;">본 항목에 '수신함'
													체크시 실종아동 긴급신고 메일이 발송됩니다.</h5>
										</c:otherwise>
									</c:choose>
							</tr>
						</table>
						<div
							style="width: 100px; position: relative; left: 20%; margin: 40px;">
							<input type=button value="수정완료" id=modifyBtn
								style="height: 100%;">
						</div>
					</form>



				</div>


			</div>
		</div>
	</div>

	<script>
		$("#modifyBtn").on("click", function() {
			$("#frm").submit();
		})

		$("#pw_find_hint>option[value=${sessionScope.loginInfo.pw_find_hint}]")
				.attr("selected", true);
	</script>



	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

	<script>
		// 우편번호 찾기 실행 함수
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress;
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById('address').value = roadAddr;
				}
			}).open();
		}

		// 비밀번호 정규식 검사
		$("#pw")
				.on(
						"blur",
						function() {
							var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{9,20}$/;
							var data = $("#pw").val();
							var result = regex.exec(data);

							if (result != null) {
								$("#alert_pw_form").html("올바른 비밀번호 형식입니다.")
										.css("color", "blue");
							} else {
								$("#alert_pw_form").html("잘못된 비밀번호 형식입니다.")
										.css("color", "red");
								$("#pw").focus();
								return false;
							}
						})

		// 이름 정규식 검사
		$("#name").on(
				"blur",
				function() {
					var regex = /^[가-힣]+$/;
					var data = $("#name").val();
					var result = regex.exec(data);

					if (result != null) {
						$("#alert_name_form").html("올바른 이름 형식입니다.").css(
								"color", "blue");
					} else {
						$("#alert_name_form").html("잘못된 이름 형식입니다.").css(
								"color", "red");
						$("#name").focus();
						return false;
					}
				})
		// 전화번호 정규식 검사
		$("#phone").on(
				"blur",
				function() {
					var regex = /^010[0-9]{3,4}[0-9]{4}$/;
					var data = $("#phone").val();
					var result = regex.exec(data);

					if (result != null) {
						$("#alert_phone_form").html("올바른 전화번호 형식입니다.").css(
								"color", "blue");
					} else {
						$("#alert_phone_form").html("잘못된 전화번호 형식입니다.").css(
								"color", "red");
						$("#phone").focus();
						return false;
					}
				})
		// 이메일 정규식 검사
		$("#email").on(
				"blur",
				function() {
					var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
					var data = $("#email").val();
					var result = regex.exec(data);

					if (result != null) {
						$("#alert_email_form").html("올바른 이메일 형식입니다.").css(
								"color", "blue");
					} else {
						$("#alert_email_form").html("잘못된 이메일 형식입니다.").css(
								"color", "red");
						$("#email").focus();
						return false;
					}
				})
		// 비밀번호-비밀번호체크 일치 여부
		$("#pw_check").on("input", function() {
			if ($("#pw").val() == $("#pw_check").val()) {
				$("#alert_pw").html("비밀번호가 일치합니다.").css("color", "blue");
			} else {
				$("#alert_pw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
			}
		})

		// 각 칸이 비어있으면 alert 창 띄우고 return 시키기!
		$("#modifyBtn")
				.on(
						"click",
						function() {
							if ($("#pw").val() == ""
									|| $("#pw_check").val() == ""
									|| $("#phone").val() == ""
									|| $("#email").val() == ""
									|| $("#zipcode").val() == ""
									|| $("#address1").val() == ""
									|| $("#address2").val() == ""
									|| $(":radio[name='email_receive']:checked").length < 1) {
								alert("모든 항목은 필수 입력 사항입니다.");
								return;
							}
							// 동의 구하는 radio 버튼이 동의가 아니면 return false하기!

							if ($("#pw").val() != $("#pw_check").val()) {
								alert("비밀번호 확인이 일치하지 않습니다.");
								return;
							}

							$("#frm").submit();
						})
	</script>

</body>
</html>