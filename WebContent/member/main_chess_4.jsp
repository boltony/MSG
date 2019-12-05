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
	height: 450px;
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
	width: 120px;
	height: 40px;
	background-color: #66b5d0;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
}

table {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin: 10px;
	padding: 10px;
}

tr {
	
}

td {
	width: 700px;
	line-height: 25px;
	text-align: center;
}
</style>
</head>
<body>
	<div class=policyContainer>
		<div class="termsNote">
			<div class="hx">
				<h3 class="check">
					<img
						src="${pageContext.request.contextPath}/resources/images/termsCheck.png"
						style="width: 20px; position: relative; top: 5px;"> 실종 신고
				</h3>
			</div>
			실종 아동 발생 시 무엇보다 중요한 것은 <b>빠른 조치</b>입니다.<br>
			<br>

			<table>
				<tr>
					<td style="height: 130px;"><img
						src="${pageContext.request.contextPath}/resources/images/tel.png"
						style="width: 100px;">
					<td><img
						src="${pageContext.request.contextPath}/resources/images/mes.png"
						style="width: 100px;">
                        
					<td><img
						src="${pageContext.request.contextPath}/resources/images/police.png"
						style="width: 100px;">
                    
				</tr>
                    <tr>
                        <td style="height: 50px;"><h3>전화 신고</h3>
                        
					<td style="height: 50px;"><h3>문자 상담</h3>
                        
					<td style="height: 50px;"><h3>방문 신고</h3>
                    
				</tr>
                    <tr>
                        <td style="height: 80px;">실종 아동 등 신고<br>
                        <span style="color: #d90000"><b>국번없이 112</b></span>
                        
					<td style="height: 80px;">내용 및 사진을 입력 후 전송<br>
                        <span style="color: #d90000"><b>#0182</b></span>
                        
					<td style="height: 80px;"><span style="color: #d90000"><b>경찰서 지구대 / 파출소</b></span>에서 신고
                    
				</tr>
                </table>
          
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
    
    
    </script></body>
</html>