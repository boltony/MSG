<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms of Use</title>
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
	height: 500px;
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
				<h3 class="check">
					<img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px">
					회원 가입
				</h3>
			</div>
			<div>
				<b>일반 회원</b><br> 일반 사용자<br>
				<br> <b>보호자(실종가족 보호자)</b><br> 만 18세 미만 아동 또는 지적장애인,
				자폐성장애인, 정신장애인의 보호자로 국가경찰관서(경찰청 실종아동찾기센터,국번없이 182)에 실종신고한 자<br>
				보호시설에 재원중이거나 퇴소 된 아동의 신상정보를 열람할 수 있습니다.<br> 실종된 아동과 상봉되었을 경우
				보호자는 자동탈퇴 됩니다.<br>
				<br> <b>관공서 및 시설 - 지방자치단체 관계자</b><br> 아동복지시설 및 장애인 보호시설
				관계자<br> 정신병원 등 정신보건시설 및 부랑인시설 관계자<br> 일시보호센터로 지정되지 않은 지역의
				보호시설 및 정신의료기관<br>
				<br> <b>예방교육담당자</b><br> 교육기관에 종사하는 자<br>
				<br> <b>상담기관담당자</b><br>
				<br>
			</div>
			<div class="hx">
				<h3 class="check">
					<img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px">
					실종아동 등 검색
				</h3>
			</div>
			- 경찰청 실종아동찾기센터(국번없이 182)에서 실종신고 받은 데이터중 「실종아동등의 보호 및 지원에 관한 법률(이하
			실종아동법)」에 의거한 대상자 입니다.<br> - 실종신고 당시 18세미만 아동<br> - 「장애인복지법」
			제2조의 장애인 중 정신지체인,발달장애인,정신장애인<br>
			<br>
			<div class="hx">
				<h3 class="check">
					<img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px">
					시설보호 아동 등 검색
				</h3>
			</div>
			<b>1. 신상카드 열람</b><br> - 실종아동등의 발견 및 확인을 위한 목적으로 시설에서 보호중이거나 퇴소한
			실종아동등의 성명,사진,발견일자 및 발견정황 등을 열람할 수 있습니다.<br> - 「실종아동등의 보호 및 지원에
			관한 법률 제 4조(실종아동등 관련 정보의 보호조치 및 공개.열람) 에 의거하고 있으며 실종아동의 개인정보를 보호하고자 그
			열람대상자는 제한하고 있으며 아래와 같은 회원만 열람 가능합니다.<br>
			<br> <b>2. 열람대상자</b><br> - 실종아동등 보호자 및 친족<br> - 전국
			시,군,구 시설 담당 공무원<br> - 전국 보호시설 및 정신의료기관 담당자.<br>
			<br>

			<div class="hx">
				<h3 class="check">
					<img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px">
					신상카드 제출
				</h3>
			</div>
			- 관공서,보호시설의 장 또는 정신의료기관의 장이 신상카드 제출 대상자를 보호하고 있을 경우 제출하는 서식이며 제출 대상자는
			아래와 같습니다.<br> - 제출대상자 : 보호자가 확인되지 아니한(무연고) 아동 등<br>
			<br>


			<table>
				<tr>
					<th scope="col">시설구분</th>
					<th class="lpt" scope="col">보호자가 확인되지 아니한(무연고)아동 등의 정의 및 범위</th>
				</tr>
				<tr>
					<th scope="row">아동복지 시설 및<br> 장애인복지 시설
					</th>
					<td>가족관계등록부(구 호적)가 없는 14세미만 아동 및 장애인<br> 연고자를 알 수 없어 새로
						성과 본을 창설(호적취득)한 14세미만 아동<br> - 단독으로 새로 성과 본을 창설한 아동 및 장애인<br>
						- 시설장 등을 보호자로 새로 성과 본을 창설한 아동 및 장애인<br> - 다만, 후견인 및 가정법원의 판결에
						의해 입양된 14세 미만 아동중 친권포기각서가 있는 경우는 연고자로 인정<br> 가족관계등록부(호적)은 있지만
						시설입소후 호적상의 보호자가 시설종사자 등과 직접면담 등 단 한번의 방문도 없는 아동 및 장애인<br> -
						다만, 가족 연락두절 및 기피, 부양회피의 경우는 가족이 있다는 것이 확인된 것이므로 연고자로 관리<br> <span
						class="green">※ 호적상의 보호자 : 부모, (외)조부모, 삼촌, 이모, 고모</span><br>
						일시아동보호시설 등 타 시설에서 전원시 구체적인 보호자 정보가 없는 아동 및 장애인

					</td>
				</tr>
				<tr>
					<th scope="row">정신병원 등<br> 정신보건 시설 및<br> 부랑인 시설
					</th>
					<td>행려환자로서 관리번호 부여받은 실종아동 등 (정신보건시설) 시ㆍ군ㆍ구청장 또는 시ㆍ도지사가 보호자인
						실종아동 등 시설입소 또는 병원입원후 새롭게 성과 본을 창설(호적취득)한 실종아동 등 시설입소 또는 병원입원후 호적상의
						보호자가 시설종사자 등과 직접면담 등 단 한번의 방문도 없는 실종아동 등 - 다만, 가족 연락두절 및 기피, 부양회피의
						경우는 가족이 있다는 것이 확인된 것이므로 연고자로 관리<br> <span class="green">※
							호적상의 보호자 : 부모, (외)조부모, 삼촌, 이모, 고모</span>
					</td>
				</tr>
			</table>

			<br>
			<br>

			<div class="hx">
				<h3 class="check">
					<img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px">
					실종예방교육
				</h3>
			</div>
			<p>
				아동과 학부모, 교육시설 담당자를 위한 공간으로 실종아동의 발생을 사전에 예방하기 위하여 온라인,오프라인으로 교육을 진행할
				수 있는 공간입니다.<br> - 아동들의 교육을 위하여 다양한 컨테츠를 신청하고 활용할 수 있습니다.
			</p>
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