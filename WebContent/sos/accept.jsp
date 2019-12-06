<%@ page import="msg.member.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>My Page</title>
         
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
		tr:nth-child(odd) { background-color: #F3F3F3; }
        #sendinfo{
        	
            float: left;
            width: 18%;
            height: 85px;
            background-color: #66b5d0;
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
            background-color: #edfffe;
            border: 0px;
            padding: 0px;
            line-height: 80px;
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




<div style="width: 100%; height: 600px; position: relative; min-width:1400px ">
                 <div style="min-width:182px;width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;" class="col-2">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3 style="margin-left:20px;">관리자 메뉴</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/viewAll.man" class=mya>회원관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="requestlist.child" class=mya>실종아동관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/list.mem" class=mya>긴급신고관리</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;background-color: #476491;"><a href="${pageContext.request.contextPath}/Ylist.mem" class=mya style="color:white;">일괄전송</a></p>

            </div>



<div class=col-9 style="margin:auto; text-align:center; width:900px;">
<h1>긴급메일 일괄전송</h1>
<br>
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
        <c:choose>

<c:when test = "${list.size() == null }">
없음
</c:when>
<c:otherwise>
<form action="${pageContext.request.contextPath}/all.sos" method="get" id="frm">
<table id="td" border=1 align=center>
<tr>
<th>아이디
<th>메일주소
</tr>
<c:forEach items = "${list}" var="dto">
<tr><td name="id">${dto.id}</td><td name="email">${dto.email} </td></tr>
<input type="hidden" name = "id1" value = ${dto.id}>
<input type="hidden" name = "email1" value = ${dto.email}>
</c:forEach>

</table>
 <div style="width: 100%; height: auto;min-width:100%;">
  
    <textarea id=con name="content" style="padding-top:10px;max-width:640px;resize: none;line-height:1.2em"
    >${con}</textarea>
<input type="submit" id="sendinfo" value="일괄전송" >
    </div>
</form>

</c:otherwise>
</c:choose>
</div>
<script>
$("#sendinfo").on("click",function(){
	$("#frm").submit();
})

</script>
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->



<script>



        $("#gosend").on("click",function(){
            location.href = "${pageContext.request.contextPath}/sos/sendmail.jsp";
        })
        </script>



</div>


        <!-- ----- footer 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->
    </body>
</html>