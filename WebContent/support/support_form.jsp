<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청서 작성</title> 
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<style>
.mya {
	color: black;
}

.mya:hover {
	text-decoration: none;
}

.procedure {
	float: left;
	width: 33.3%;
	height: 80px;
	text-align: center;
	line-height: 80px;
	margin: 0px;
	background-color: #66B5D0;
	color: white;
	border-radius: 10px;
	padding-top: 5px;
}

.ul {
	height: 400px;;
	float: left;
	margin: 0px;
	border: 1px solid #f0f7f8;
}

#form {
	border: 1px solid black;
	margin: auto;
	width: 100%;
}

.element {
	width: 30%;
	text-align: center;
	float: left;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #f4f2f2;
	background-color: #eaeef0;
}

.value {
	width: 70%;
	float: left;
	overflow: hidden;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #f4f2f2;
	text-align: center;
}

input[type=text] {
	width: 60%;
	height: 30%;
	text-align: center;
}

.a {
	height: 50px;
	border-bottom: 1px solid #f4f2f2;
	border-radius: 10px;
}

.b {
	float: left;
	height: 100%;
}

#pay {
	width: 200px;
	height: 80px;
	background-color: #66B5D0;
	box-shadow: none;
	border: none;
	font-size: 25px;
	font-family: 'GoyangIlsan';
	color: white;
	border-radius: 8px;
}
</style>
<body>
	<!-- ----- navi 시작 ------------------------------------------  -->
	<c:choose>
	<c:when test="${sessionScope.loginInfo==null}">
		<jsp:forward page="/support/login_toSupport.jsp"/>;
	</c:when>	
	</c:choose>
	
	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<!-- ----- navi 끝 ------------------------------------------  -->

	<!-- ----- quick menu 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	<!-- ----- quick menu 끝 ------------------------------------------  -->




	<!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
	<div style="width: 100%; min-width:1500px; height: 1200px; position: relative;">
		<div
			style="width: 300px; height: 100%; float: left; padding-left: 30px; line-height: 20px;">
			<div style="height: 100px; width: 160px; padding-top: 30px; text-align:center">
				<h3>후원하기</h3>
			</div>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; background-color:#66b5d0; line-height:30px;">
				<a href="${pageContext.request.contextPath}/support/support_page.jsp" class=mya style="color:white;">후원하기</a>
			</p>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; line-height:30px;">
				<a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
			</p>

		</div>
		<div
			style="width: 60%; min-width: 500px; height: 1050px; float: left; position: relative; left: 5%; border-bottom: 1px solid black;">
			<div
				style="width: 100%; border-bottom: 1px solid black; padding-top: 30px">
				<p style="font-size: 40px; line-height:">후원하기</p>
			</div>
			<div
				style="width: 100%; height: 60px; position: relative; top: 50px; overflow: hidden;">
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP1.<br>후원신청
					</h5>
				</div>
				<div class="procedure">
					<h5>
						STEP2.<br>신청서 작성
					</h5>
				</div>
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP3.<br>신청 완료
					</h5>
				</div>
			</div>
			<div style="position: relative; top: 100px; height: 800px;">
				<list>
				<ul class="ul" style="width: 20%; text-align: center;">
					<p style="font-size: 20px;">후원자 정보<br>
						<p style="font-size:7px; color:red;">*후원자 정보는 변경가능합니다.</p>
					</p>
				</ul>
				<ul class="ul"
					style="width: 80%; border-bottom: 1px solid black; overflow: hidden;">

					<form action="" method="post" id=form>

						<div class="element">
							<label style="font-size: 15px;">성함</label>
						</div>
						<div class="value">
							<input type="text" id="rname" value="${loginInfo.name }">
						</div>

						<div class="element">
							<label style="font-size: 15px;">전화번호 </label>
						</div>
						<div class="value">
							<input type="text" id="phone" value="${loginInfo.phone }">
						</div>

						<div class="element">
							<label style="font-size: 15px;">메일 </label>
						</div>
						<div class="value">
							<input type="text" id="email" value="${loginInfo.email} ">
						</div>

						<div class="element">
							<label style="font-size: 15px;">후원금액 </label>
						</div>
						<div class="value">
							<input type="text" id="donation"
								placeholder="최소금액 1000원 (입력 : 10000)">원
						</div>
					</form>

				</ul>
				<ul class="ul"
					style="width: 20%; text-align: center; height: 260px;">
					<p style="font-size: 20px">이용 약관</p>
				</ul>
				<ul class="ul"
					style="width: 80%; border-bottom: 1px solid black; height: 260px; border-top: 1px solid black;">
					<list>
					<ul class="a">
						<div class="b" style="width: 10%;">
							<div
								style="width: 25px; height: 25px; margin: auto; line-height: 60px;">
								<input type="checkbox" class="check" id="check1"
									style="width: 80%; height: 80%;">
							</div>
						</div>
						<div class="b" style="width: 90%; line-height: 50px; color: red;">이용약관에
							모두 동의합니다.</div>

					</ul>
					<ul class="a">
						<div class="b" style="width: 10%;">
							<div
								style="width: 25px; height: 25px; margin: auto; line-height: 60px;">
								<input type="checkbox" class="check" id="check2"
									style="width: 80%; height: 80%;">
							</div>
						</div>
						<div class="b" style="width: 75%; line-height: 50px;">(필수)이용약관에
							동의합니다.</div>
						<div class="b" style="width: 15%;">
							<div
								style="width: 100%; height: 100%; margin: auto; line-height: 40px; text-align: center;">
								<input type="button" id="look1" value="보기"
									style="width: 80%; height: 80%; vertical-align: middle;">
							</div>
						</div>
					</ul>
					<ul class="a">

						<div class="b" style="width: 10%;">
							<div
								style="width: 25px; height: 25px; margin: auto; line-height: 60px;">
								<input type="checkbox" class="check" id="check3"
									style="width: 80%; height: 80%;">
							</div>
						</div>
						<div class="b" style="width: 75%; line-height: 50px;">(필수)개인정보
							수집, 이용에 동의합니다.</div>
						<div class="b" style="width: 15%;">
							<div
								style="width: 100%; height: 100%; margin: auto; line-height: 40px; text-align: center;">
								<input type="button" id="look2" value="보기"
									style="width: 80%; height: 80%; vertical-align: middle;">
							</div>
						</div>
					</ul>
					<ul class="a">
						<div class="b" style="width: 10%;">
							<div
								style="width: 25px; height: 25px; margin: auto; line-height: 60px;">
								<input type="checkbox" class="check" id="check4"
									style="width: 80%; height: 80%;">
							</div>
						</div>
						<div class="b" style="width: 75%; line-height: 50px;">(필수)개인정보
							제3자 제공에 동의합니다.</div>
						<div class="b" style="width: 15%;">
							<div
								style="width: 100%; height: 100%; margin: auto; line-height: 40px; text-align: center;">
								<input type="button" id="look3" value="보기"
									style="width: 80%; height: 80%; vertical-align: middle;">
							</div>
						</div>
					</ul>
					<ul class="a">
						<div class="b" style="width: 10%;">
							<div
								style="width: 25px; height: 25px; margin: auto; line-height: 60px;">
								<input type="checkbox" class="check" id="check5"
									style="width: 80%; height: 80%;">
							</div>
						</div>
						<div class="b" style="width: 75%; line-height: 50px;">(필수)고유식별정보
							처리에 동의합니다.</div>
						<div class="b" style="width: 15%;">
							<div
								style="width: 100%; height: 100%; margin: auto; line-height: 40px; text-align: center;">
								<input type="button" id="look4" value="보기"
									style="width: 80%; height: 80%; vertical-align: middle;">
							</div>
						</div>
					</ul>
					</list>

				</ul>
				</list>
			</div>
			<div
				style="height: 100px; position: relative; text-align: center;">
				<input type="button" value="결제하기" id="pay">
			</div>


		</div>
	</div>
	<!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->










	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

	<script>
		$("#pay")
				.on(
						"click",
						function() {
							if ($("#check2").is(":checked") == false) {
								alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
								return;
							} else if ($("#check3").is(":checked") == false) {
								alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
								return;
							} else if ($("#check4").is(":checked") == false) {
								alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
								return;
							} else if ($("#check5").is(":checked") == false) {
								alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
								return;
							} else if (Number($("#donation").val()) < 1000) {
								alert("최소 후원 금액은 1000원 이상입니다.");
								return;
							} else {
								   $.ajax({
									      url : "${pageContext.request.contextPath}/xssProtect.sup",
									      type: "post",
									      data:{
									         rname : $("#rname").val(),
									         phone : $("#phone").val(),
									         email : $("#email").val()
									      },
									      dataType : "json"
									   }).done(function(data){
									      console.log(data.rname);
									      window.open('${pageContext.request.contextPath}/pay.sup?rname='
									      + data.rname + '&phone='
									      + data.phone + '&email='
									      + data.email
									      + '&donation='
									      + $("#donation").val(), '','width=600px,height=700px,top=200px,left=500px')

									   }).fail(function(a,b,c){
									      console.log(a);
									      console.log(b);
									      console.log(c);
									   });
									}

						})

		$("#check1").on("click", function() {
			if ($("#check1").is(":checked")) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		})
		$("#look1").on("click", function() {
			window.open("terms1.jsp", "", "width=800px; height=800px;");
		})
		$("#look2").on("click", function() {
			window.open("terms2.jsp", "", "width=1000px; height=500px;");
		})
		$("#look3").on("click", function() {
			window.open("terms3.jsp", "", "width=1000px; height=350px;");
		})
		$("#look4").on("click", function() {
			window.open("terms4.jsp", "", "width=1000px; height=350px;");
		})
	</script>
</body>
</html>