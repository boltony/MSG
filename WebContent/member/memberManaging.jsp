<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <title>Manager Page</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <style>
            .mya{
                color: black;
            }
            .mya:hover{
                text-decoration: none;
            }
            .black_btn{
            	width:128px;
            	height:100%;
            	text-align:center;
            	background-color:#66b5d0;
            	border: none;
            	margin:auto;
            	font-size:14px;
            	color: white;
            }
            #member_tb th{
            background-color: #c9e3f2;
            }
            #member_tb{
            margin:auto;
            }
        </style>
    </head>
    <body>
    	<c:choose>
			<c:when test="${sessionScope.loginInfo==null}">
				<jsp:forward page="/member/login_my.jsp"/>;
			</c:when>	
		</c:choose>
		
		<c:choose>
			<c:when test="${sessionScope.loginInfo.manager_check!='Y'}">
				<jsp:forward page="/error.jsp"/>;
			</c:when>	
		</c:choose>

        <!-- ----- navi 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
        <!-- ----- navi 끝 ------------------------------------------  -->

        <!-- ----- quick menu 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
        <!-- ----- quick menu 끝 ------------------------------------------  -->


        <!-- ----- 관리자페이지 - 회원관리 시작 ---------------  -->
        <div style="width: 100%; height: 500px; position: relative; min-width:1500px;">
                <div style="min-width:182px;width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;" class="col-2">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/viewAll.man" class=mya style="color:white;">회원관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="requestlist.child" class=mya>실종아동관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/list.mem" class=mya>긴급신고관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/Ylist.mem" class=mya>일괄전송</a></p>

            </div>

            
            
            <div style="width:70%; height: 80%; float: left; min-width: 1200px;">
            <div style="border-bottom: 1px solid black;">
            <h1>회원목록</h1>
            </div>
           <table border=1 style='min-width:1163px; margin-top:30px;' id="member_tb">
           <tr style="text-align:center;">
           <th style="width:30px; text-align:center;">No</th>
           <th style="width:100px;">아이디</th>
           <th style="width:100px;">이름</th>
           <th style="width:100px;">전화번호</th>
           <th style="width:180px;">이메일</th>
           <th style="width:70px;">우편번호</th>
           <th style="width:230px;">주소1</th>
           <th style="width:75px;">주소2</th>
           <th>긴급메일</th>
           <th>관리자</th>
           <th>블랙</th>
           <th style="width:128px;"> 블랙리스트 버튼</th>
           </tr>
            <c:forEach items="${list}" var="dto">
		<tr>
		<td style="text-align:center">${dto.seq }</td> 
		<td style="padding-left:5px;"> ${dto.id }</td> 
		<td style="padding-left:5px;"> ${dto.name}</td>
		<td style="padding-left:5px;"> ${dto.phone }</td>
		<td style="padding-left:5px;"> ${dto.email }</td>
		<td style="text-align:center;"> ${dto.zipcode }</td>
		<td style="padding-left:5px;"> ${dto.address1 }</td>
		<td style="padding-left:5px;"> ${dto.address2 }</td>
		<td style="text-align:center"> ${dto.email_receive }</td>
		<td style="text-align:center"> ${dto.manager_check }</td> 
		<td style="text-align:center"> ${dto.black }</td>
		<td>
		<c:choose>
		<c:when test="${dto.black=='N'}">
		<button class="black_btn" onclick="location.href='${pageContext.request.contextPath}/blackIn.man?id=${dto.id}'">블랙리스트 추가</button>
		
		</c:when>
		<c:otherwise>
		<button class="black_btn" onclick="location.href='${pageContext.request.contextPath}/blackOut.man?id=${dto.id}'">블랙리스트 제거</button>
		
		</c:otherwise>
		</c:choose>
		</td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<!-- 페이지 네비게이터 시작 -->
	
	<table style="margin:auto; min-width:1200px;">
		<tr align=center>
			<td>${navi}</td>
		</tr>
	</table>
	
	<!-- 페이지 네비게이터 끝 -->
            </div>
        </div>     
        <!-- ----- 관리자페이지 - 회원관리 끝 ---------------  -->


        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->

    </body>
</html>