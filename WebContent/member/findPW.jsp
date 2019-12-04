<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find my PW</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
        #pw_find_form{
            margin: auto;
            margin-top: 60px;
            margin-bottom: 100px;
        } 
        #pw_find_detail{
            text-align: center;
            margin: auto;
            background-color: gainsboro;
            margin-bottom: 80px;
            margin-top: 100px;
            padding-bottom: 60px;
            padding-top: 60px;
        }
        #pw_find_form span{
            width: 150px;
            text-align: right;
            display: inline-block;
        }
     
        #pw_find_container{
            margin-right: auto;
            width: 600px;
            margin: auto;
        }
        #pw_find_detail img{
            width: 60px;
            margin-bottom: 20px;
        }
        #pw_find_detail p{
            font-weight: bold;
            font-size: 25px;
        }
        .find_btns_container{
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .pw_find_btns{
            border: none;
            border-radius: 10px;
            background-color: rgba(250, 195, 47, 0.62);
            width: 70px;
            font-size: 16px;
        }
        #pw_find_form input[type=text]{
            width: 250px;
            margin: 10px;
            border: 1px solid #9f9b9b;
        }
        #pw_find_hint{
        	border: 1px solid #9f9b9b;
        	display: inline-block;
        	width: 250px;
        	height: 28px;
        	margin: 10px;
        }
        #pw_find_list{
        	width: 500px;
        	margin: auto;
        	text-align: center;
        	background-color: #f5eec9;
        	padding-top: 10px;
        	padding-bottom: 10px;
        	border-radius: 10px;
        	margin-bottom: 100px;
        }
        #pw_find_list p{
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



        <!-- ----- 비번 찾기 시작 ---------------  -->
            <div>    
        <div id="pw_find_detail">
           <img src="${pageContext.request.contextPath}/resources/images/search.png" alt="">
            <p>비밀번호 찾기</p>
            <span>가입하신 이메일로 임시 비밀번호를 발급해드립니다.
            아래의 폼에 맞춰 아이디, 이메일, 비밀번호 찾기 답을 입력해 주세요.</span>
        </div>  
    
        <div id="pw_find_container">
          
            <form action="${pageContext.request.contextPath}/findPW.mail" method="post" id="pw_find_form" onsubmit="return infoCheck()">
            <span>아이디</span>
            <input type="text" name="pw_find_id" id="pw_find_id">
            <br>
            <span>이메일</span>
            <input type="text" name="pw_find_email" id="pw_find_email" placeholder=" '@'포함 작성">
            <br>
            <span>비밀번호 찾기 질문</span>
            <select name="pw_find_hint" id="pw_find_hint" size=1>
                <option value="hint1">기억에 남는 추억의 장소는?</option>
                <option value="hint2">자신의 인생 좌우명은?</option>
                <option value="hint3">자신의 보물 1호는?</option>
                <option value="hint4">가장 기억에 남는 선생님 성함은?</option>
                <option value="hint5">타인이 모르는 자신만의 신체 비밀이 있다면?</option>
                <option value="hint6">추억하고 싶은 날짜가 있다면?</option>
                <option value="hint7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                <option value="hint8">유년시절 가장 생각나는 친구 이름은?</option>
                <option value="hint9">인상 깊게 읽은 책 이름은?</option>
                <option value="hint10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
                <option value="hint11">자신이 두번째로 존경하는 인물은?</option>
                <option value="hint12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                <option value="hint13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
                <option value="hint14">다시 태어나면 되고 싶은 것은?</option>
                <option value="hint15">내가 좋아하는 캐릭터는?</option>
            </select>
            <br>
            <span>비밀번호 찾기 답</span>
            <input type="text" name="pw_find_answer" id="pw_find_answer" placeholder=" 가입시 기입한 답변을 입력해주세요.">
            <br>
            <div class="find_btns_container">
            <button type="submit" class="pw_find_btns" id="pw_find_btn">찾기</button>
            <button type="button" class="pw_find_btns" id="pw_reset_btn">취소</button>
            </div>
            </form>
         </div>
        </div>
        
        <script>
        function infoCheck(){
        	var pw_find_id = $("#pw_find_id").val();
        	var pw_find_email = $("#pw_find_email").val();
        	var pw_find_answer = $("#pw_find_answer").val();
        	var pw_find_hint = $("#pw_find_hint option:selected").val();
        	        	
        	console.log(pw_find_hint);
        	
        	if(pw_find_id==""){
        		alert("아이디를 입력하세요.");
        		return false;
        	}
        	if(pw_find_email==""){
        		alert("이메일을 입력하세요.");
        		return false;
        	}
        	if(pw_find_answer==""){
        		alert("비밀번호 찾기 답을 입력하세요.");
        		return false;
        	}
        }
                
        $("#pw_reset_btn").on("click",function(){
        	location.href = "${pageContext.request.contextPath}/member/login.jsp";
        })
        </script>
        
        <!-- ----- 비번 찾기 끝 ---------------  -->



        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>        
        <!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>