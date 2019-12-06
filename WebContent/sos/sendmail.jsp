<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #send {
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
        <!-- ----- navi 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
        <!-- ----- navi 끝 ------------------------------------------  -->

        <!-- ----- quick menu 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
        <!-- ----- quick menu 끝 ------------------------------------------  -->











        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 시작 ---------------  -->
        <form id="frm" action="${pageContext.request.contextPath}/sendmail.sos" method="get">
        <div style="width: 100%; height: 500px; position: relative; min-width:1200px">
           <div style="min-width:182px;width: 300px; height: 100%;  float: left; padding-left: 30px; line-height: 20px;" class="col-2">
                <div style="height: 100px; width: 100%; padding-top: 30px;"><h3>실종아동 등록</h3></div>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;"><a href="${pageContext.request.contextPath}/child/insertInfo.jsp" class=mya>실종정보등록</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;line-height:30px;;"><a href="${pageContext.request.contextPath}/childList.child" class=mya>실종아동찾기</a></p>
                <p style="text-align:center;font-size:20px;width:160px;height:30px;background-color: #476491;line-height:30px;"><a href="${pageContext.request.contextPath}/sos/em.jsp" class=mya style="color:white;">긴급메일작성</a></p>
            </div>
            <div class="col-9" style="margin:0px;margin-right:0px;height:100%;left:10%;min-width:400px;display:block;">
            <h2 style="text-align: center;">긴급메일작성</h2>
            <select name="missing_area" id="missing_area">
  
   <option value="999" selected="selected">지역선택(필수)</option>
	<option value="1" name="missing_area">서울특별시</option>
	<option value="2" name="missing_area">부산광역시</option>
	<option value="3" name="missing_area">대구광역시</option>
	<option value="4" name="missing_area">인천광역시</option>
	<option value="5" name="missing_area">광주광역시</option>
	<option value="6" name="missing_area">대전광역시</option>
	<option value="7" name="missing_area">울산광역시</option>
	<option value="8" name="missing_area">강원</option>
	<option value="9" name="missing_area">경기</option>
	<option value="10" name="missing_area">경남</option>
	<option value="11" name="missing_area">경북</option>
	<option value="12" name="missing_area">전남</option>
	<option value="13" name="missing_area">전북</option>
	<option value="14" name="missing_area">제주</option>
	<option value="15" name="missing_area">충남</option>
	<option value="16" name="missing_area">충북</option>
	<option value="17" name="missing_area">세종</option>  </select><label id="areack" style="color:red;font-size:15px">지역을먼저 선택해주세요</label>
           <br>
           
            <textarea id=title style= "border:0px;width : 70%; height:25%; background-color: #edfffe; font-size: 20px;resize:none"name="title" placeholder="제목을 입력하세요" maxlength="50"></textarea>        
            <textarea id="content" name="content" style="border:0px;width: 70%;height: 50%;resize:none;background-color:#d9eeff;font-size: 20px;" placeholder="내용을 입력하세요"></textarea>
            
            
            <div style="text-align: center; height: 25%">
        <button type="button" class="btn" id="send">긴급신고</button></div>
        </div>
         </div>
            
        </form>
        
        <!-- ----- 여기는 중간 화면 이런 식으로 참고만 해 주세요 끝 ---------------  -->










        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->
<script>
	$("#title").on("focus",function(){
		<!-- 지역선택  -->
		var area = $("#missing_area option:selected").val();
		console.log(area);
		if(area == "999"){
			$("#areack").css("color","red");
			$("#areack").html("지역을먼저 선택해주세요");
			$("#areack").css("font-size","15px");
		}else{
			$("#areack").css("color","skyblue");
			$("#areack").html("지역선택이 완료되었습니다");
		}
	});
	$("#missing_area").on("click",function(){	<!--  -->
		var area = $("#missing_area option:selected").val();
		if(area != "999"){
			$("#areack").css("color","skyblue");
			$("#areack").html("지역선택이 완료되었습니다");
			
		}else{
			$("#areack").css("color","red");
			$("#areack").html("지역을먼저 선택해주세요");
			$("#areack").css("font-size","15px");
		}
	})
        $("#send").on("click",function(){
        	var area = $("#missing_area option:selected").val();
        	var title = $("#title").val();
        	var content = $("#content").val();
        	
    		if(area != 999 && title != "" && content != ""){
            var send = confirm("긴급메일을 전송하시겠습니까?");
            if(send){
            
                alert("성공적으로 접수하였습니다\n실종자가 하루빨리 가족품에돌아오길 기원합니다");
                $("#frm").submit();
            }else{
            	alert("취소되었습니다");
            	
            }
            
    		}else{
    			alert("모두 입력하세요");
    		}
        })
        
        </script>
    </body>
</html>















