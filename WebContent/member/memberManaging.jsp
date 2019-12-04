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
        </style>
    </head>
    <body>

        <!-- ----- navi 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
        <!-- ----- navi 끝 ------------------------------------------  -->

        <!-- ----- quick menu 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
        <!-- ----- quick menu 끝 ------------------------------------------  -->


        <!-- ----- 관리자페이지 - 회원관리 시작 ---------------  -->
        <div style="width: 100%; height: 500px; position: relative; min-width:1500px;">
            <div style="width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3>관리자 페이지</h3></div>
                <p><a href="${pageContext.request.contextPath}/viewAll.man" class=mya>회원관리</a></p>
                <p><a href="${pageContext.request.contextPath}/list.mem" class=mya>긴급신고관리</a></p>
                <p><a href="#" class=mya>실종아동관리</a></p>
            </div>
            
            
            <div style="width:70%; height: 80%; float: left; min-width: 1200px;">
            <h3>회원목록</h3>
           <table border=1 style='min-width:1163px'>
           <tr>
           <th>No</th>
           <th>아이디</th>
           <th>이름</th>
           <th>전화번호</th>
           <th>이메일</th>
           <th>우편번호</th>
           <th>주소1</th>
           <th>주소2</th>
           <th>긴급메일 수신</th>
           <th>관리자 여부</th>
           <th>블랙리스트</th>
           <th>버튼</th>
           </tr>
            <c:forEach items="${list}" var="dto">
		<tr>
		<td>${dto.seq }</td> 
		<td>${dto.id }</td> 
		<td>${dto.name}</td>
		<td>${dto.phone }</td>
		<td>${dto.email }</td>
		<td>${dto.zipcode }</td>
		<td>${dto.address1 }</td>
		<td>${dto.address2 }</td>
		<td>${dto.email_receive }</td>
		<td>${dto.manager_check }</td> 
		<td>${dto.black }</td>
		<td>
		<c:choose>
		<c:when test="${dto.black=='N'}">
		<button onclick="location.href='${pageContext.request.contextPath}/blackIn.man?id=${dto.id}'">블랙리스트 추가</button>
		<br>
		</c:when>
		<c:otherwise>
		<button onclick="location.href='${pageContext.request.contextPath}/blackOut.man?id=${dto.id}'">블랙리스트 제거</button>
		<br>
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