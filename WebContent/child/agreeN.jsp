<%@ page import="msg.child.ChildDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manage Missing List</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <style>
            .mya{
                color: black;
            }
            .mya:hover{
                text-decoration: none;
                
            }
             #td{
            border: 0px solid;
            width: 800px;
            height: auto;
            border-collapse: collapse;
            
       }
        th, td { padding: 10px; }
      tr:not(.hide):nth-child(3n+2) { background-color: #F3F3F3; }
        #sendinfo{
            float: right;
            width: 19%;
            height: 85px;
            background-color: darksalmon;
            border: 0px;
            font-size: 15px;
            border-radius: 10px;
        }
        #sendinfo:hover{
            color: cornsilk;
            cursor: pointer;
        }
       
        #con{
           float:left;
            width: 80%;
            margin: 0px;
            height: 85px;
            background-color: antiquewhite;
            border: 0px;
            padding: 0px;
            line-height: 80px;
        }
        .hide{
       background-color : #f6fff2;
         transition: all 1s linear;
         margin-left : 10px;
         max-width:188px
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




<div style="width: 100%; height: 600px; position: relative; min-width:1400px;">
            <div style="min-width:182px;width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;" class="col-2">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/viewAll.man" class=mya>회원관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="requestlist.child" class=mya style="color:white;">실종아동관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/list.mem" class=mya>긴급신고관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/Ylist.mem" class=mya>일괄전송</a></p>

            </div>



<div class=col-9 style="margin:auto; text-align:center; width:900px; ">
<h1>실종아동 신청서 관리</h1>
<br>
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
        <c:choose>

<c:when test = "${list.size() == 0}">
없음
</c:when>
<c:otherwise>

<table id="td" border=1 align=center>
<tr style="background-color:#959e97">
<th>등록번호
<th>이름
<th>생년월일
<th>실종일
<th>신고자
<th>관리
</tr>
<c:forEach items = "${list}" var="dto">
<tr></tr>
<tr><td name="seq">${dto.seq}</td>
<td name="name">${dto.name}</td>
<td name="birth">${dto.get_formed_birth()}</td>
<td name="missingdate">${dto.get_formed_missing_date()}</td>
<td name="reporter">${dto.reporter}</td>
<td>
<input type="button" value="승인하기" id="accept${dto.seq}">
<input type="button" value="삭제" id="del${dto.seq}">
</td>
</tr>

   <script>
   $("#del${dto.seq}").on("click",function(){
        location.href = "${pageContext.request.contextPath}/reportdel.child?seq=${dto.seq}"
     });


   $('#accept${dto.seq}').on("click",function(){
      location.href="${pageContext.request.contextPath}/reportaccept.child?seq=${dto.seq}"
   })
   

  </script>
</c:forEach>

</table>
<div class="container pageNavi">
      <div class="row">
         <div class="col-12 text-center">${pageNavi}</div>
      </div>
   </div>


</c:otherwise>
</c:choose>
</div>
</div>
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->








        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->
    </body>
</html>
