<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종아동 상세정보</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
*{
	box-sizing:border-box;
}
.container{
	border:1px solid black;
	width:900px;
	height:600px;
	border-radius:20px;
	margin:auto;
}
        
.box1{
	border-bottom:1px solid black;
	height:300px;
}
.box1>div{
	float:left;
}
.img_box{
	border-right:1px solid black;
	width:300px;
	height:300px;
	text-align:center;
}
.img_box>img{
	width:280px;
	margin:10px;
}
.info_box1{
	border-right:1px solid black;
	width:290px;
	height:300px;
}
.info_box2{
	width:290px;
	height:300px;
}
label{
	display:inline-block;
	width:100px;
	text-align:right;
}
        
.box2{
	height:200px;
}
.area_detail_box{
	border-bottom:1px solid black;
	height:150px;
}	
</style>
</head>
<body>
	<div class="container">
		<div class="box1">
			<div class="img_box">
				<img src="${pageContext.request.contextPath}/resources/images/dubuzzing.jpg">
			</div>
			<div class="info_box1">
				<br><br><br>
				<label for="">제보자</label>
				: ${dto.reporter} (${dto.get_real_relation()})
				<br><br>
				<label for="">${dto.get_real_target()}</label>
				<br>
				<label for="">이름</label>
				: ${dto.name} (${dto.get_real_gender()})
				<br>
				<label for="">생년월일</label>
				: ${dto.get_formed_birth()}
				<br>
				<label for="">실종날짜</label>
				: ${dto.get_formed_missing_date()}
				<br>
				<label for="">실종지역</label>
				: ${dto.get_real_missing_area()}
				<br>
			</div>
			<div class="info_box2">
				<br><br><br>
				<label for="">키</label>
				: ${dto.height}cm
				<br>
				<label for="">몸무게</label>
				: ${dto.weight}kg
				<br>
				<label for="">머리 스타일</label>
				: ${dto.get_real_hair()}
				<br>
				<label for="">혈액형</label>
				: ${dto.get_real_blood()}
				<br>
				<label for="">상의 (종류)</label>
				: ${dto.get_real_top()} (${dto.get_real_top_kind()})
				<br>
				<label for="">하의 (종류)</label>
				: ${dto.get_real_bottoms()} (${dto.get_real_bottoms_kind()})
				<br>
				<label for="">신발 (사이즈)</label>
				: ${dto.get_real_shoes()} (${dto.shoes_size})
				<br>
			</div>
		</div>
		<div class="box2">
			<div class="area_detail_box">
				실종지역 상세정보 : ${dto.missing_area_detail}
			</div>
			<div class="feature_detail_box">
				특징 : ${dto.feature}
			</div>
		</div>
	</div>
</body>
</html>