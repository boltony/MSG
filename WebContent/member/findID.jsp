<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find my ID</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
        #id_find_form{
            margin: auto;
            margin-top: 60px;
            margin-bottom: 100px;
        } 
        #id_find_detail{
            text-align: center;
            margin: auto;
            background-color: gainsboro;
            margin-bottom: 80px;
            margin-top: 100px;
            padding-bottom: 60px;
            padding-top: 60px;
        }
        #id_find_form span{
            width: 150px;
            text-align: right;
            display: inline-block;
        }
        #id_find_container{
            margin-right: auto;
            width: 600px;
            margin: auto;
        }
        #id_find_detail img{
            width: 60px;
            margin-bottom: 20px;
        }
        #id_find_detail p{
            font-weight: bold;
            font-size: 25px;
        }
        .find_btns_container{
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .id_find_btns{
            border: none;
            border-radius: 10px;
            background-color: rgba(250, 195, 47, 0.62);
            width: 70px;
            font-size: 16px;
        }
        #id_find_form input[type=text]{
            width: 250px;
            margin: 10px;
            border: 1px solid #9f9b9b;
        }
        #id_find_list{
        	width: 500px;
        	margin: auto;
        	text-align: center;
        	background-color: #f5eec9;
        	padding-top: 10px;
        	padding-bottom: 10px;
        	border-radius: 10px;
        	margin-bottom: 100px;
        }
        #id_find_list p{
        	font-weight: bold;
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



        <!-- ----- 아이디 찾기 시작 ---------------  -->
            <div>    
        <div id="id_find_detail">
           <img src="${pageContext.request.contextPath}/resources/images/search.png" alt="">
            <p>아이디 찾기</p>
            <span>가입하신 정보로 아이디 찾기가 가능합니다.
            아래의 폼에 맞춰 성명, 전화번호, 이메일을 입력해 주세요.</span>
        </div>  
    
        <div id="id_find_container">
            <form action="${pageContext.request.contextPath}/findID.mem" method="post" id="id_find_form" onsubmit="return infoCheck()">
            <span>성명</span>
            <input type="text" name="id_find_name" id="id_find_name">
            <br>
            <span>전화번호</span>
            <input type="text" name="id_find_phone" id="id_find_phone" placeholder=" '-'없이 작성">
            <br>
            <span>이메일</span>
            <input type="text" name="id_find_email" id="id_find_email" placeholder=" '@'포함 작성">
            <br>
            <div class="find_btns_container">
            <button type="submit" class="id_find_btns" id="id_find_btn">찾기</button>
            <button type="button" class="id_find_btns" id="id_reset_btn">취소</button>
            </div>
            </form>
         </div>
		
    <c:choose>
         	<c:when test="${ids!=null}">
         	<div id="id_find_list">
         	<p>회원님의 정보로 검색된 아이디는 다음과 같습니다.</p>
         		<c:forEach items="${ids}" var="ids">
         			${ids} <br>
         		</c:forEach>
         		<br>
         		<a href="${pageContext.request.contextPath}/member/login.jsp"> 위 아이디로 로그인하기</a> ㅣ 
         		<a href="${pageContext.request.contextPath}/member/findPW.jsp"> 비밀번호 찾기</a>
         	</div>	
         	</c:when>
    </c:choose>

        </div>
        
        <script>
        function infoCheck(){
        	var name = $("#id_find_name").val();
        	var phone = $("#id_find_phone").val();
        	var email = $("#id_find_email").val();
        	        	
        	if(name==""){
        		alert("이름을 입력하세요.");
        		return false;
        	}
        	if(phone==""){
        		alert("전화번호를 입력하세요.");
        		return false;
        	}
        	if(email==""){
        		alert("이메일을 입력하세요.");
        		return false;
        	}
        }
                
        $("#id_reset_btn").on("click",function(){
        	location.href = "${pageContext.request.contextPath}/member/login.jsp";
        })
        </script>
        
        <!-- ----- 아이디 찾기 끝 ---------------  -->



        <!-- ----- footer 시작 ------------------------------------------  -->
       <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>