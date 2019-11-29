<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>실종아동 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fixedStyle.css">
<style>
* {
	box-sizing: border-box
}

.missing_list {
	max-width: 1000px;
}

.simple_list {
	border: 1px solid black;
	min-width: 400px;
	max-width: 400px;
	border-radius: 20px;
}
.simple_list>img {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.simple_list>h {
	font-size: 12px;
}

.detail_btn>img{
	width: 40px;
}
.kakao-link-btn>img{
	width: 40px;
}
</style>
</head>
<body>

	<jsp:include page="../resources/jsp/navi.jsp"></jsp:include>
	<jsp:include page="../resources/jsp/quickMenu.jsp"></jsp:include>

	<!-- ----- child list 시작 --------------------------------------------  -->
	<br>
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h4>#실종아동 목록</h4>
				<hr>
			</div>
		</div>
	</div>
	<div class="container missing_list">
		<c:choose>
			<c:when test="${list.size()==0}">
				<div class="row r1">
					<div class="col-12 text-center">작성된 글이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="col-12 col-sm-5 simple_list mb-4 offset-1">
							<img
								src="${pageContext.request.contextPath}/resources/images/dubuzzing.jpg">
							<br>
							<h4>${dto.name}(${dto.get_real_gender()})</h4>
							<h>생년월일 : ${dto.get_formed_birth()}</h>
							<br>
							<h>실종일자 : ${dto.get_formed_missing_date()}</h>
							<br>
							<h>실종지역 : ${dto.get_real_missing_area()}</h>
							<br> <br>
							<div>
								<a class="detail_btn" href="${pageContext.request.contextPath}/childDetail.child?seq=${dto.seq}" 
								onclick="window.open(this.href, '', 'width=1000px, height=600px, left=200px, top=200px'); return false;">
									<img src="${pageContext.request.contextPath}/resources/images/icon_search.png">
								</a>
								<a class="kakao-link-btn" href="javascript:;">
									<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
										alt="${dto.seq}" class="kl_img">
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<br>
	<div class="container pageNavi">
		<div class="row">
			<div class="col-12 text-center">${pageNavi}</div>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<!-- ----- child list 끝 ---------------------------------------------  -->

	<jsp:include page="../resources/jsp/footer.jsp"></jsp:include>

	<script>
		$("#backBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/index.jsp";
		});
		
		//<![CDATA[
		// // 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('a224ed8e8d0df10de91c36a743e14394');

		for (var i = 0; i < $(".kakao-link-btn").length; i++) {
			var btn_seq = $($(".kl_img")[i]).attr("alt");
			console.log(btn_seq);
			// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
			Kakao.Link.createDefaultButton({
				container : $('.kakao-link-btn')[i],
				objectType : 'feed',
				content : {
					title : '카카오 링크 테스트',
					description : '#카카오톡 #카카오API #카카오링크 #공유',
					imageUrl : 'https://t1.kakaocdn.net/kakaocorp/corp_thumbnail/Kakao.png',
					link : {
						mobileWebUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq,
						webUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq
					}
				},
				social : {
					likeCount : 286,
					commentCount : 45,
					sharedCount : 845
				},
				buttons : [ {
					title : '웹으로 보기',
					link : {
						mobileWebUrl : 'https://www.naver.com/',
						webUrl : 'https://www.naver.com/'
					}
				}, {
					title : '앱으로 보기',
					link : {
						mobileWebUrl : 'https://www.google.com/',
						webUrl : 'https://www.google.com/'
					}
				} ]
			});
		}
		//]]>
	</script>
</body>
</html>