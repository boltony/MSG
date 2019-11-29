<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종아동 상세정보</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<p>${dto.seq}</p>
	<p>${dto.target}</p>
	<p>${dto.name} (${dto.get_real_gender()})</p>
	<p>${dto.birth_date}</p>
	<p>${dto.missing_date}</p>
	<p>${dto.missing_area}</p>
	<p>${dto.missing_area_detail}</p>
	<p>${dto.height}</p>
	<p>${dto.weight}</p>
	<p>${dto.hair}</p>
	<p>${dto.blood_type}</p>
	<p>${dto.feature}</p>
	<p>${dto.top}</p>
	<p>${dto.top_kind}</p>
	<p>${dto.bottoms}</p>
	<p>${dto.bottoms_kind}</p>
	<p>${dto.shoes}</p>
	<p>${dto.shoes_size}</p>
	<p>${dto.reporter}</p>
	<p>${dto.reporter_id}</p>
	<p>${dto.re_birth_date}</p>
	<p>${dto.re_relation}</p>
	<p>${dto.re_contact1}</p>
	<p>${dto.re_contact2}</p>
	<p>${dto.agreeYN}</p>
	
	
	<div class="container">
		<div class="box1">
			<div class="img_box">
				사진(캐러셀)
			</div>
			<div class="info_box1">
				<br><br><br>
				<label for="">제보자</label>
				: ooo (부모)
				<br>
				<label for="">실종아동</label>
				<br>
				<label for="">이름</label>
				: ooo (남)
				<br>
				<label for="">생년월일</label>
				: oooooo
				<br>
				<label for="">실종날짜</label>
				: oooooo
				<br>
				<label for="">실종지역</label>
				: _________
				<br>
			</div>
			<div class="info_box2">
				<br><br><br>
				<label for="">키</label>
				: ___cm
				<br>
				<label for="">몸무게</label>
				: ___kg
				<br>
				<label for="">머리 스타일</label>
				: 짧은 생머리
				<br>
				<label for="">혈액형</label>
				: B(RH+)
				<br>
				<label for="">상의 (종류)</label>
				: 반팔 (티셔츠)
				<br>
				<label for="">하의 (종류)</label>
				: 긴바지 (청바지)
				<br>
				<label for="">신발 (사이즈)</label>
				: 운동화 (230)
				<br>
			</div>
		</div>
		<div class="box2">
			<div class="area_detail_box">
				실종지역 상세정보
			</div>
			<div class="feature_detail_box">
				특징
			</div>
		</div>
	</div>
</body>
</html>