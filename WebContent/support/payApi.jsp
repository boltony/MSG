<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.8.min.js"
	type="application/javascript"></script>
</head>
<body>
	<script>
		BootPay.request({
			price : '${donation}', //실제 결제되는 가격
			application_id : "5dd11c974f74b4002fc15ac8",
			name : 'My page 내역에서 확인 가능', //결제창에서 보여질 이름
			pg : 'nicepay',
			method : '', //결제수단, 입력하지 않으z면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부

			user_info : {
				username : '${rname}',
				email : '${email}',
				addr : '${loginInfo.address1}',
				phone : '${phone}'
			},
			order_id : '고유order_id_123456', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params : {
				callback1 : '그대로 콜백받을 변수 1',
				callback2 : '그대로 콜백받을 변수 2',
				customvar1234 : '변수명도 마음대로'
			}

		}).error(function(data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			alert(data.msg);
			window.close();
			location.href = "${pageContext.request.contextPath}/support/support_page.jsp";

		}).cancel(function(data) {
			var rs = confirm("결제를 취소하시겠습니까?")
			if(rs){
			window.close();
			}
		}).done(function(data) {
			$.ajax({
				url : "paySuccess.sup",
				type : "post",
				data : {
					id : '${loginInfo.id}',
					name : '${rname}',
					phone : '${phone}',
					email : '${email}',
					card_name : data.card_name,
					method_name : data.method_name,
					pg : data.pg,
					price : data.price,
					purchased_at : data.purchased_at,
					receipt_id : data.receipt_id
				}
			}).done(function(data){
				window.close();
				opener.location.href="${pageContext.request.contextPath}/support/support_completion.jsp";

			})
		});
	</script>
</body>
</html>