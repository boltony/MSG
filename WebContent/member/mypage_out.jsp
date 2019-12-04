<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
	height: 500px;
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
	background-color: #7ac9d8;
	width: 70%;
	height: 100px;
	min-width: 800px;
	float: left;
}

#leftBar_contents1 h3 {
	line-height: 100px;
}

#leftBar_contents2 {
	width: 70%;
	height: 70%;
	float: left;
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
</style>
</head>
<body>
	<!-- ----- navi 시작 ------------------------------------------  -->
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
				<a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp" class=mya>나의 정보</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya>정보 수정하기</a>
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
			<h3 style="padding-left: 30px;">회원 탈퇴 안내</h3>

		</div>
		<form action="${pageContext.request.contextPath}/memOut.mem" method="post" name="frm" id=frm>
			<div id=leftBar_contents2>
				<p style="padding-left: 30px; height: 50px; line-height: 50px;">
					${sessionScope.loginInfo.name}님께서 사용하고 계신 아이디 <span><b>${sessionScope.loginInfo.id}</b></span>는 탈퇴할 경우 계정 복구가 불가하오니 신중하게 선택하시기
					바랍니다.
				</p>
				<div
					style="background-color: white; width: 50%; height: 100px; margin: auto; line-height: 40px; padding-top: 50px">
					아이디　 <span><b>${sessionScope.loginInfo.id}</b></span><br> 비밀번호 <input type="password"
						name=outcheck1 id=outcheck1 style="height: 25px;" required><br>
					<br>
					<br>
					<p style="font-size: 15px;">
						<label><input type="checkbox" name=outcheck2 id="checkB"
							required> 안내 사항을 확인하였으며, 이에 동의합니다.</label>
					</p>
					<div style="padding-left: 20px;">
						<button id=pwRe1>회원 탈퇴</button>
						<button id=pwRe2>취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
        $("#pwRe1").on("click",function(){
        	var outcheck1 = $("#outcheck1").val();
        	if(outcheck1==""){
        		alert("비밀번호를 입력해 주세요.");
        	}else if($("#checkB").is(":checked")){
        		$("#frm").submit();
        	}else{
        		alert("탈퇴 동의에 체크해 주셔야 진행이 완료됩니다.");
        	}
        	
        });
        $("#pwRe2").on("click",function(){
        	location.href="${pageContext.request.contextPath}/member/mypage.jsp";
        });
        </script>




	<!-- ----- footer 시작 ------------------------------------------  -->
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	<!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>