<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
			<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/policy.jsp','policy',
				'width=850,height=630,location=no,status=no,scrollbars=no'); return false;">개인 정보 취급 방침</a><br> 
			<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/terms.jsp','policy',
			'width=850,height=630,location=no,status=no,scrollbars=no'); return false;">이용 안내</a><br> 
			<a href="#" class=poline onclick="window.open('${pageContext.request.contextPath}/member/emailCollect.jsp',
			'policy','width=850,height=430,location=no,status=no,scrollbars=no'); return false;">이메일 무단 수집 거부</a><br>
		</div>
	</div>

	<div id=policyTitle2>Copyright © 2019 KH Missing children Go home ㅣ Created by MSG All Right Reserved</div>
</div>