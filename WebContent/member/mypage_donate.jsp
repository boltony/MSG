<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Donation</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">

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
.mya {
font-size: 20px;
   color: black;
}

.mya:hover {
   text-decoration: none;
}

.leftContainer {
   width: 100%;
   height: 1000px;
   min-width: 1100px;
   position: relative;
}

#leftBar {
   width: 300px;
   height: 100%;
   float: left;
   padding-left: 30px;
   line-height: 20px;
   text-align: center;
}

#leftBar p, #leftBarTitle{
 width:160px; text-align: center;
}

#leftBarTitle {
   height: 100px;
   width: 100%;
   padding-top: 30px;
}

#leftBar_contents1 {
   float: left;
   width: 70%;
   border-bottom: 1px solid black;
}

#leftBar_contents2 {
   float: left;
   width: 70%;
   height: 70%;
}
.my_icons_container {
   position: relative;
   width: 600px;
   height: 100px;
   padding-top: 20px;
   margin: auto;
   line-height:50px;
   text-align: center;
}

.my_icons {
   float: left;
   text-align: center;
   width: 80px;
   height: 90px;
   margin-left: 15px;
   margin-right: 15px;
   color: #433e3d;
   font-size: 14px;
}

.dn_td {
   float: left;
   text-align: center;
   width: 16.5%;
   height: 100%;
}

.dn_bt {
   border: none;
   border-radius: 8px;
   background-color: #b5dae6;
   width: 100px;
   height: 30px;
   vertical-align: middle;
}

.donationTop {
   height: 40px;
   line-height: 40px;
   margin-bottom: 10px;
   min-width: 1100px;
}

.donationTop>div {
   background-color: #66b5d0;
   color: white;
}

.donationTb {
   height: 40px;
   min-width: 1100px;
}
a{
   color:white;
}
a:hover{
   text-decoration: none;
}
</style>

</head>
<body>
   <!-- ----- navi 시작 ------------------------------------------  -->
   <c:choose>
   <c:when test="${sessionScope.loginInfo==null}">
      <jsp:forward page="/MSG/member/login_my.jsp"/>;
   </c:when>   
   </c:choose>
   
   <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
   <!-- ----- navi 끝 ------------------------------------------  -->

   <!-- ----- quick menu 시작 ------------------------------------------  -->
   <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
   <!-- ----- quick menu 끝 ------------------------------------------  -->


   <div class=leftContainer>
      <div id=leftBar>
         <div id=leftBarTitle>
            <h3 style="text-align: center; width: 160px;">마이 페이지</h3>
         </div>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp" class=mya>나의 정보</a>
         </p>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya>정보 수정하기</a>
         </p>   
         <p>
            <a href="${pageContext.request.contextPath}/mywrite.mem" class=mya>내 글 목록</a>
         </p>
         <p><div style="width:160px; height:30px; background-color: #66b5d0; line-height: 30px;">
            <a href="${pageContext.request.contextPath}/mydonate.mem" class=mya style="color:white;">후원 내역</a>
         </div></p>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_out.jsp"class=mya>회원 탈퇴</a>
         </p>

      </div>
      <div id=leftBar_contents1>
         <h1>내 후원 내역</h1>
         <p></p>
         <p></p>
         <p></p>
      </div>

      <div id=leftBar_contents2>
      <div class=my_icons_container>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_info.png" style="width: 50px;"><br>내
                  정보
               </div></a> <a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_modify.png" style="width: 50px;"><br>정보
                  수정
               </div></a> <a href="${pageContext.request.contextPath}/mywrite.mem"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_write.png" style="width: 50px;"><br>내가
                  쓴 글
               </div></a> <a href="${pageContext.request.contextPath}/mydonate.mem"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_heart.png" style="width: 50px;"><br>내
                  후원 내역
               </div></a> 
               <a href="${pageContext.request.contextPath}/member/mypage_out.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_delete.png" style="width: 50px;"><br>회원
                  탈퇴
               </div></a>
         </div>
         <div style="width: 100%; height: 100px;"></div>
         <div class=donationTop>
            <div class=dn_td style="min-width: 160px;">기부일자</div>
            <div class=dn_td>기부자명</div>
            <div class=dn_td>결제방법</div>
            <div class=dn_td>기부금액</div>
            <div class=dn_td style="min-width: 180px;">영수증 번호</div>
            <div class=dn_td>환불요청</div>
         </div>

         <c:choose>
            <c:when test="${list.size()==0}">
               <div
                  style="width: 100%; height: 200px; line-height: 200px; text-align: center;">기부 내역이 없습니다.</div>

            </c:when>

            <c:otherwise>
               <c:forEach var="dto" items="${pageList}">
                  <div class=donationTb>
                     <div class=dn_td style="min-width: 160px;">${dto.support_date}</div>
                     
                     <div class=dn_td>${dto.name}</div>
                     <div class=dn_td>${dto.card_name}</div>
                     <div class=dn_td>${dto.donation}</div>
                     <div class=dn_td style="min-width: 180px;" id="k${dto.seq}">${dto.receipt_id}</div>
                     <div class=dn_td>
                  <c:choose>
                  <c:when test="${dto.formedDate=='true'}">
                     <input type=button class=dn_bt value="취소요청" id=cancelPay${dto.seq}>
                     
                     <script>
   $("#cancelPay${dto.seq}").on("click",function(){

      console.log( $("#k${dto.seq}").html());
      
      var result = confirm("정말 취소하시겠습니까?")
      var seq = $("k#${dto.seq}").html();
      if(result){
      location.href="${pageContext.request.contextPath}/pay_delete.sup?receipt_id=${dto.receipt_id}";
      }
   });
   </script>
                  </c:when>
                  <c:otherwise>
                     
                  </c:otherwise>
               </c:choose>

                     </div>
                  </div>
               </c:forEach>

            </c:otherwise>
         </c:choose>
         <div class=donationTop style="width: 100%; text-align: center;">
            <div style="color:white; width:99%;"><b> ${navi} </b></div>
         </div>
         
         
         <c:choose>
         <c:when test="${list.size()==0}">
               <div style="height: 100px; text-align: right;">
                    <h4 style="line-height: 100px; padding-right:100px;">후원 금액이 존재하지 않습니다.</h4> 
               </div>

            </c:when>
            <c:otherwise>
            
            <div style="height: 100px; text-align: right;">
                    <h4 style="line-height: 100px; padding-right:100px;">총 후원 금액　<b>${totalDonation}</b> 원</h4> 
               </div>
            </c:otherwise>
         
         </c:choose>

      </div>
   </div>
   
   <script>
   $("#cancelPay").on("click",function(){
      var result = confirm("정말 취소하시겠습니까?")
      if(result){
         location.href="${pageContext.request.contextPath}/support/pay_delete.sup?receipt_id='${dto.receipt_id}'";
      }
   });
   </script>



   <!-- ----- footer 시작 ------------------------------------------  -->
   <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
   <!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>