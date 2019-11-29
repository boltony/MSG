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
</body>
</html>