<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    #gosend {
    		margin-top : 40px;
			background-color:  #66b5d0;
			height: 40px;
			width: 120px;
			border: none;
			color: white;
			text-align: center;
			text-decoration: none;
			font-size: 16px;
			display: inline-block;
			cursor: pointer;
			transition: all 0.35s;
            border-radius: 8px;
           
		}
        

        </style>
    </head>
    <body>
    	<c:choose>
   <c:when test="${sessionScope.loginInfo==null}">
      <jsp:forward page="/member/login.jsp"/>;
   </c:when>   
   </c:choose>
    
        <!-- ----- navi 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
        <!-- ----- navi 끝 ------------------------------------------  -->

        <!-- ----- quick menu 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
        <!-- ----- quick menu 끝 ------------------------------------------  -->



        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
        <div style="width: 100%; height: 500px; position: relative; min-width:1000px; ">
            <div style="min-width:182px;width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;" class="col-2">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3>실종아동 등록</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/child/insertInfo.jsp" class=mya>실종정보등록</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;;"><a href="${pageContext.request.contextPath}/childList.child" class=mya>실종아동찾기</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;background-color: #476491;line-height:30px;"><a href="${pageContext.request.contextPath}/sos/em.jsp" class=mya style="color:white;">긴급메일작성</a></p>
            </div>
            
            <div style="width: 70%; height: 30%; float: left; text-align: center;" class="col-9"> <label style="font-size:40px;text-align:center;">긴급신고 메일작성</label><hr>실종아동 발생시 무엇보다 중요한것은 빠른 초기조치입니다.<br>
       만약, 실종신고를 하지 않으셨다면 <br>
       긴급신고 서비스를 이용하신후에라도, 실종신고를 필히 해주시기바랍니다.<br>
            </div>
            <div style="background-color: white; width: 70%; height: 10%; float: left;">
            
           
            </div>
            <br>
             <div style="width: 550px; text-align: center; margin: auto;">
        <div style="text-align: center;   float: left;"><img src="${pageContext.request.contextPath}/resources/images/emecall.png" style="height: 200px; width: 180px;"><br>
        <h3>실종아동등 신고</h3><label style="color: orangered">국번없이<br>112</label></div><div style="float: left; width: 50px;"><p></p></div>
        <div style="text-align: center; float:right; "><img src="${pageContext.request.contextPath}/resources/images/pol.png" style="height: 200px; width: 180px;"><br>
        <h3>방문신고</h3><label style="color: orangered">경찰서 지구대/파출소에서<br>직접신고접수</label></div>
        
    </div>
       
        </div>
        <div style="margin: auto;text-align: center;">
<button id="gosend"><span>긴급신고</span></button></div>
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->



<script>
        $("#gosend").on("click",function(){
        	location.href = "${pageContext.request.contextPath}/sos/sendmail.jsp";
        	console.log();
        })
        </script>






        <!-- ----- footer 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->

    </body>
</html>