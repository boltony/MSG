<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 목록</title>
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
   color: black;
   font-size: 20px;
}

.mya:hover {
   text-decoration: none;
}

#leftBar {
   width: 300px;
   height: 100%;
   float: left;
   padding-left: 30px;
   line-height: 20px;
   <!-- -->
   text-align: center;
   <!-- -->
}

<!-- -->
#leftBar p, #leftBarTitle{
 width:160px; text-align: center;
}

#leftBar_contents1 {
   float: left;
   width: 70%;
   height: 100px;
}

#leftBar_contents2 {
   float: left;
   width: 70%;
   height: 70%;
   height: 550px;
   line-height: 50px;
}

.my_icons_container {
   position: relative;
   width: 600px;
   height: 100px;
   padding-top: 20px;
   margin: auto;
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
   height: 100%;
}

.dn_td1, .dn_td4 {
   width: 15%;
   min-width: 100px;
}

.dn_td2 {
   width: 50%;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}

#dn_td2_a {
   color: black;
   text-decoration: none;
}

.dn_td3 {
   width: 15%;
   min-width: 165px;
}

.dn_bt {
   border: none;
   border-radius: 5px;
   background-color: #66b5d0;
   width: 120px; height: 40px;
   vertical-align: middle;
}

.donationTop {
   height: 40px;
   line-height: 40px;
   width: 100%;
   min-width: 1000px;
}

.donationTop>div {
   background-color: #66b5d0;
   color: white;
}

.donationTb {
   height: 40px;
   line-height: 40px;
   width: 100%;
   min-width: 1000px;
}

a {
   color: white;
}

a:hover {
   text-decoration: none;
}
</style>
</head>
<body>
   <!-- ----- navi 시작 ------------------------------------------  -->
   <c:choose>
      <c:when test="${sessionScope.loginInfo==null}">
         <jsp:forward page="/member/login_my.jsp" />;
   </c:when>
   </c:choose>


   <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
   <!-- ----- navi 끝 ------------------------------------------  -->

   <!-- ----- quick menu 시작 ------------------------------------------  -->
   <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
   <!-- ----- quick menu 끝 ------------------------------------------  -->


   <div
      style="width: 100%; height: 800px; position: relative; min-width: 1100px;">
      <div
         style="width: 300px; height: 100%; float: left; padding-left: 30px; line-height: 20px;" id=leftBar>
         <div style="height: 100px; width: 100%; padding-top: 30px;"id=leftBarTitle>
            <h3 style="text-align: center; width: 160px;">마이 페이지</h3>
         </div>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp" class=mya>나의 정보</a>
         </p>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp" class=mya>정보 수정하기</a>
         </p>
         <p><div style="width:160px; height:30px; background-color: #66b5d0; line-height: 30px; text-align: center;">
            <a href="${pageContext.request.contextPath}/mywrite.mem" class=mya style="color:white;">내 글 목록</a>
         </div></p>
         <p>
            <a href="${pageContext.request.contextPath}/mydonate.mem" class=mya>후원 내역</a>
         </p>
         <p>
            <a href="${pageContext.request.contextPath}/member/mypage_out.jsp" class=mya>회원 탈퇴</a>
         </p>

      </div>

      <div id=leftBar_contents1>
         <h1>내 작성글 목록</h1>
         <p style=" border-bottom: 1px solid black;">
            <span><b>${sessionScope.loginInfo.name}</b></span>님께서 작성하신 글 목록입니다.
         </p>
      </div>

      <div id=leftBar_contents2>
         <div class=my_icons_container>
            <a href="${pageContext.request.contextPath}/member/mypage_pw_info.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_info.png" style="width: 50px;"><br>내
                  정보
               </div></a> <a href="${pageContext.request.contextPath}/member/mypage_pw_modify.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_modify.png" style="width: 50px;"><br>정보
                  수정
               </div></a> <a href="mywrite.mem"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_write.png" style="width: 50px;"><br>내가
                  쓴 글
               </div></a> <a href="mydonate.mem"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_heart.png" style="width: 50px;"><br>내
                  후원 내역
               </div></a> <a href="${pageContext.request.contextPath}/member/mypage_out.jsp"><div class=my_icons>
                  <img src="${pageContext.request.contextPath}/resources/images/my_delete.png" style="width: 50px;"><br>회원
                  탈퇴
               </div></a>
         </div>
         <div style="width: 100%; height: 100px;"></div>
         <div class=donationTop>
            <div class="dn_td dn_td1"></div>
            <div class="dn_td dn_td2">제목</div>
            <div class="dn_td dn_td3">작성일</div>
            <div class="dn_td dn_td4">조회수</div>
         </div>
         <c:choose>
            <c:when test="${list.size()==0}">
               <div
                  style="width: 100%; height: 200px; line-height: 200px; text-align: center;">작성된
                  글이 없습니다.</div>

            </c:when>

            <c:otherwise>
               <c:forEach var="dto" items="${pageList}">
                  <div class=donationTb>
                     <div class="dn_td dn_td1">${dto.seq}</div>
                     <a href="detailView.bo?seq=${dto.seq }&board=${dto.board}&currentPage=1" id="dn_td2_a"><div class="dn_td dn_td2">${dto.title}</div></a>
                     <div class="dn_td dn_td3">${dto.write_date}</div>
                     <div class="dn_td dn_td4">${dto.view_count}</div>
                  </div>
               </c:forEach>

            </c:otherwise>
         </c:choose>
         <div class=donationTop style="width: 95%; text-align: center;">
            <div style="color: white;">
               <b> ${navi} </b>
            </div>
         </div>

      </div>


   </div>



   <!-- ----- footer 시작 ------------------------------------------  -->
   <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
   <!-- ----- footer 끝 ------------------------------------------  -->

</body>
</html>