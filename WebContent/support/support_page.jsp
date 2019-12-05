<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원신청</title> 
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
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
            .mya{
                color: black;
            }
            .mya:hover{
                text-decoration: none;
            }
            #donation_btn{
                width: 200px; 
                height: 80px; 
                background-color: #66B5D0; 
                box-shadow: none;
                border: none;
                font-size: 25px; 
                font-family: 'GoyangIlsan'; 
                color: white;
                border-radius: 8px;
            }
            .procedure{
                float: left;
                width: 33.3%;
                height: 80px;
                text-align: center;
                line-height: 80px;
                margin: 0px;
                background-color: #66B5D0;
                color: white;
                border-radius: 10px;
                padding-top: 5px;
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





        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
	<div style="width: 100%; min-width:1500px; height: 1200px; position: relative;">
		<div
			style="width: 300px; height: 100%; float: left; padding-left: 30px; line-height: 20px;"
			class="col-2">
			<div style="height: 100px; width: 160px; text-align:center; padding-top: 30px;">
				<h3>후원하기</h3>
			</div>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; background-color:#66b5d0; line-height:30px;">
				<a href="${pageContext.request.contextPath}/support/support_page.jsp" class=mya style="color:white;">후원하기</a>
			</p>
			<p style="font-size: 20px; width:160px; height:30px; text-align: center; line-height:30px;">
				<a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
			</p>

		</div>
		<div
			style="width: 60%; float: left; position: relative; left: 5%; border-bottom: 1px solid black;">
			<div
				style="width: 100%; border-bottom: 1px solid black; padding-top: 25px">
				<p style="font-size:40px">후원하기</p>
			</div>
			<div
				style="width: 100%; height: 60px; position: relative; top: 50px; overflow: hidden;">
				<div class="procedure">
					<h5>
						STEP1.<br>후원신청
					</h5>
				</div>
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP2.<br>신청서 작성
					</h5>
				</div>
				<div class="procedure" style="background-color: #cdd0d1;">
					<h5>
						STEP3.<br>신청 완료
					</h5>
				</div>
			</div>
			<div
				style="margin: auto; text-align: center; position: relative; top: 80px; height: 300px;">
				<img src="${pageContext.request.contextPath}/resources/images/z9.jpg" style=>
			</div>
			<div
				style="margin: auto; padding-top: 25px; width: 80%; position: relative; top: 20px;">
				<h2 style="text-align: center; position:">사랑을 나누면 기쁨은 두배가 됩니다</h2>
				<br>
				<h5>
					오갈곳없는 아이들의 힘이 되어주세요.<br> 현재 보육원은 한 아이당 한 달에 8만 5천 원에서 14만 5천
					원이 들어가는 상황에 후원금이 안 들어온다면 아이들을 유치원에 보내는 데 어려움이 있다고합니다. <br> <br>
					복지라 하면 무료, 공짜라는 인식이 강한데 절대 그렇지 않습니다.<br> 복지 또한 자원이 있어야 굴러가는
					것이기 때문에 현실적으로 복지기관이나 아동시설, 보육원 등 어려움이 많습니다.<br> <br> 시설에서
					떠난 대부분의 친구들은 자립이라는 큰 산을 넘어야합니다.<br> 주변의 도움이 있어도 모든것을 판단하고
					책임져야하는 아이들의 삶의무게는 산에서 더 큰산으로 이어지게 됩니다.<br> <br> 여러분의 벗된
					사랑은 이 친구들에게 혹한의 추위를 덜어주는 따스한 햇볕으로, 폭염의 더위를 식혀주는 시원한 바람으로 다가설 것입니다.
					<br> <br> 벗된사랑을 전해주시는 모든 분들께 감사드리며 보람된 결단에 박수를 보냅니다.<br>
					<br> 여러분의 벗된 사랑은 아이들의 적성계발과 취업을 위한 학원비, 대학등록금, 학습교재비, 자립을위한
					적립금 등에 쓰여지게 되며, 아이들에게 가장 벗된 이들인 시설 종사자의 인건비와 삶의공간인 시설 운영비에 쓰여지게
					됩니다.
				</h5>
				<br>

			</div>
			<div style="margin: auto; text-align: center; padding-top: 20px; height: 130px;"
				class="col-9">
				<button id=donation_btn>후원신청</button>
			</div>
		</div>
	</div>
	<!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->





        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->

   <script>
        $("#donation_btn").on("click", function(){
            location.href = "${pageContext.request.contextPath}/support/support_form.jsp"
        })
    </script>

</body>
</html>