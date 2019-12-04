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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
* {
	box-sizing: border-box
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

.search_box {
	width: 400px;
	margin: auto
}

.missing_list {
	min-width: 950px;
	max-width: 950px;
}

.simple_list {
	border: 1px solid black;
	border-radius: 10px;
	min-width: 400px;
}
.simple_list>img {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.simple_info {
	font-size: 12px;
}

.detail_btn:hover {
	text-decoration:none;
}
.detail_btn>img {
	width: 40px;
}
.kakao-link-btn:hover {
	text-decoration:none;
}
.kakao-link-btn>img {
	width: 40px;
}
</style>
</head>
<body>

	<jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
	<jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
	
	
	<div class="leftContainer">
	<div id=leftBar>
		<div id=leftBarTitle>
			<h3>마이 페이지</h3>
		</div>
		<p><a href="${pageContext.request.contextPath}/child/insertInfo.jsp" class=mya>실종정보등록</a></p>
		<p><a href="${pageContext.request.contextPath}/childList.child" class=mya style="color: orangered;">실종아동찾기</a></p>
		<p><a href="${pageContext.request.contextPath}/sos/em.jsp" class=mya>긴급메일작성</a></p>
	</div>
	<br>
	
	<!-- ----- child list 시작 --------------------------------------------  -->
	<div id="leftBar_contents1">
		<h3 style="padding-left: 30px;">실종아동 목록</h3>
	</div>
	
	
	<!-- ----- child 검색 시작 ----------------------------------------------  -->
	<div class="search_box">
		<form action="childList.child" method="get" class="frm">
			이름 입력
			<input type="text" id="s_name" name="s_name">
			<br>
			성별 구분
			<input type="radio" name="gender" value="A" checked>전체
			<input type="radio" name="gender" value="M">남자
			<input type="radio" name="gender" value="W">여자
			<br>
			대상 구분
			<input type="radio" name="target" value="A" checked>전체
			<input type="radio" name="target" value="010">아동
			<input type="radio" name="target" value="060">정신장애인
			<input type="radio" name="target" value="070">치매노인
			<br>
			실종 지역
			<select name="s_area">
				<option value=0>전체</option>
				<option value=1>서울</option>
				<option value=2>부산</option>
				<option value=3>대구</option>
				<option value=4>인천</option>
				<option value=5>광주</option>
				<option value=6>대전</option>
				<option value=7>울산</option>
				<option value=8>강원</option>
				<option value=9>경기</option>
				<option value=10>경남</option>
				<option value=11>경북</option>
				<option value=12>전남</option>
				<option value=13>전북</option>
				<option value=14>제주</option>
				<option value=15>충남</option>
				<option value=16>충북</option>
				<option value=17>세종</option>
			</select>
			상세지역
			<input type="text" id="s_area_detail" name="s_area_detail">
			<br>
			신체 특징
			<input type="text" id="s_feature" name="s_feature">
			<br><br>
			<input type="submit" value="실종 대상 검색">
			<input type="reset" value="검색 초기화">
		</form>
	</div>
	<br>
	<!-- ----- child 검색 끝 -----------------------------------------------  -->
	
	
	<div class="container missing_list">
		<c:choose>
			<c:when test="${list.size()==0}">
				<div class="row">
					<div class="col-12 text-center">검색 조건에 맞는 글이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="col-5 simple_list mb-5 ml-5">
							<c:set var="rep_file" value="rep_file${dto.seq}"></c:set>
							<img class="missing_img" src="${requestScope[rep_file]}">							
							<br>
							<h5>${dto.name}(${dto.get_real_gender()})</h5>
							<div class="simple_info">
								생년월일 : ${dto.get_formed_birth()}
								<br>
								실종일자 : ${dto.get_formed_missing_date()}
								<br>
								실종지역 : ${dto.get_real_missing_area()}
							</div>
							<br> <br>
							<div>
								<a class="detail_btn" href="#" 
								onclick="window.open('${pageContext.request.contextPath}/childDetail.child?seq=${dto.seq}', '', 'width=1000px, height=700px, left=200px, top=100px, status=no'); return false;">
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


	</div>
	

	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>

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
						mobileWebUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq,
						webUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq
					}
				}, {
					title : '앱으로 보기',
					link : {
						mobileWebUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq,
						webUrl : 'http://192.168.60.54:8080/MSG/childDetail.child?seq='+btn_seq
					}
				} ]
			});
		}
		//]]>
	</script>
</body>
</html>