<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>　</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GoyangIlsan';
}

.termsNote {
	padding: 15px;
	width: 800px;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
	border: 1px solid #aaaaaa;
	background-color: #f0f0f0;
}

#termsClose {
	padding-top: 30px;
	width: 800px;
	height: 50px;
	text-align: center;
}

#closeBtn {
	width: 100px;
	height: 40px;
	background-color: #7ac9d8;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 15px;
}

table {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin: 10px;
	padding: 10px;
}

th {
	width: 200px;
	height: 50px;
}

td {
	width: 700px;
	padding: 10px;
}
</style>
</head>
<body>
	<div class=policyContainer>
		<div class="termsNote">
			<div class="hx">
				<h2 class="check">아이들에게 꼭 알려 주어야 할 것들</h2>
				<br>
			</div>
			<div class="hx">
				<h3 class="check">
					<img
						src="${pageContext.request.contextPath}/resources/images/termsCheck.png"
						style="width: 20px; position: relative; top: 5px;"> 기억시키기
				</h3>
			</div>
			아이가 평소에 잘 알고 있더라도 당황할 경우 이와 같은 정보들을 잊기 쉬워요.<br> 아이 자신의 이름, 부모님
			성함, 자신의 나이, 집 주소, 집 번호, 부모님 핸드폰 번호 등을 기억할 수 있게 함께 연습해 주세요.<br>
			<br> <span style="color: #ea0000;"><b>어떠한 상황에서라도
					자연스럽게 위의 정보들을 말할 수 있도록 평소에 알려 주시는 것이 좋습니다.</b></span><br>
			<br>

			<div class="hx">
				<h3 class="check">
					<img
						src="${pageContext.request.contextPath}/resources/images/termsCheck.png"
						style="width: 20px; position: relative; top: 5px;"> 파악하기
				</h3>
			</div>
			목적지와 동행인 알리기<br>
			<br> <span style="color: #ea0000;"><b>외출할 일이 있다면 부모님께
					어디에 누구와 가는지 알리는 것이 좋습니다.</b></span><br>
			<br>
			<br>

			<div class="hx">
				<h3 class="check">
					<img
						src="${pageContext.request.contextPath}/resources/images/termsCheck.png"
						style="width: 20px; position: relative; top: 5px;"> 낯선 사람
					주의시키기
				</h3>
			</div>
			구체적인 예를 들어 설명해 주세요. 낯선 사람을 무조건 경계하라는 것이 아니라 길을 물어보며 차에 태우려고 한다든지, 강아지를
			함께 찾아 달라며 아이에게 도움을 요청하는 등의 행동은 거부할 수 있게 해야 합니다.<br>
			<br> <span style="color: #ea0000;"><b>어른은 아이에게 도움을
					요청하지 않는다는 사실을 부모님도 미리 알고, 아이에게 알려 주어야 할 필요가 있습니다.</b></span><br>
			<br>

		</div>
		<div id=termsClose>
			<input type="button" value="닫기" id=closeBtn>
		</div>
	</div>

	<script>
    $(function(){
    	$("#closeBtn").on("click",function(){
    		window.close();
    	})
    })
    
    
    </script>

</body>
</html>