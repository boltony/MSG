<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${loginInfo==null}">
	<div id=upnavi>
            <a href="${pageContext.request.contextPath}/member/login.jsp" class=mainSmallMenu>로그인</a> |
            <a href="${pageContext.request.contextPath}/member/signup.jsp" class=mainSmallMenu>회원가입</a> |
            <a href="${pageContext.request.contextPath}/member/login_my.jsp" class=mainSmallMenu>마이페이지</a>   
        </div>
	</c:when>
	<c:when test="${loginInfo!=null and loginInfo.manager_check=='Y'}">
	<div id=upnavi>
           <a href="${pageContext.request.contextPath}/viewAll.man" class=mainSmallMenu>관리자 페이지</a> |
           <a href="${pageContext.request.contextPath}/member/mypage.jsp" class=mainSmallMenu>마이페이지</a> |
           <a href="${pageContext.request.contextPath}/logout.mem" class=mainSmallMenu>로그아웃</a>
        </div>     
	</c:when>
	<c:when test="${loginInfo!=null and loginInfo.manager_check=='N'}">
	<div id=upnavi>
           ${loginInfo.name} 님 환영합니다! |
           <a href="${pageContext.request.contextPath}/member/mypage.jsp" class=mainSmallMenu>마이페이지</a> |
           <a href="${pageContext.request.contextPath}/logout.mem" class=mainSmallMenu>로그아웃</a>
        </div>     
	</c:when>
	</c:choose>

	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; width: 100%">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/main.jsp"><img src="${pageContext.request.contextPath}/resources/images/logo_n.png"
         style="width: 250px; margin-top:0px;"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
         aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
         <ul class="navbar-nav" style="font-size:20px;">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/notice.no">공지사항 <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/child/insertInfo.jsp">실종아동등록</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/childList.child">실종아동찾기</a></li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">자유게시판</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/missing.bo">실종 아동 제보하기</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/protect.bo">보호 아동 제보하기</a>
               </div>
			</li>			
			<li class="nav-item">			
            <button class="btn btn-outline-success1" type="button">긴급신고</button>
            <button class="btn btn-outline-success" type="button">후원하기</button>
			</li>
         </ul>
      </div>
	</nav>
	<div class="usee"></div>


<script>
$(".btn-outline-success1").on("click",function(){
	location.href="${pageContext.request.contextPath}/sos/em.jsp";
});

$(".btn-outline-success").on("click",function(){
	location.href="${pageContext.request.contextPath}/support/support_page.jsp";
});
</script>
