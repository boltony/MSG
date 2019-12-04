<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="container0">
	<div class="menu0">

		<c:choose>
			<c:when test="${sessionScope.loginInfo==null}">
				<a href="${pageContext.request.contextPath}/member/login.jsp"> <img class="quick_menu_img"
					src="${pageContext.request.contextPath}/resources/images/login-64.png" alt="">
					<p>로그인</p>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/logout.mem"><img class="quick_menu_img"
					src="${pageContext.request.contextPath}/resources/images/login-64.png" alt="">
					<p>로그아웃</p> </a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="menu0">
		<a href=""> <img class="quick_menu_img"
			src="${pageContext.request.contextPath}/resources/images/active-search-64.png" alt="">
			<p>실종아동찾기</p>
		</a>
	</div>
	<div class="menu0">
		<img class="quick_menu_img" src="${pageContext.request.contextPath}/resources/images/reviewer-64.png"
			alt="">
		<p>실종아동등록</p>
	</div>
	<div class="menu0"><a href="${pageContext.request.contextPath}/support/support_page.jsp">
		<img class="quick_menu_img"
			src="${pageContext.request.contextPath}/resources/images/banknotes-64%20(1).png" alt="">
		<p>후원하기</p></a>
	</div>
	<div class="menu0">
		<img class="quick_menu_img" src="${pageContext.request.contextPath}/resources/images/text-file-4-64.png"
			alt="">
		<p>실종아동등록</p>
	</div>
	<div class="menu0">
		<img class="quick_menu_img" src="${pageContext.request.contextPath}/resources/images/chat-4-64%20(1).png"
			alt="">
		<p>문의하기</p>
	</div>
</div>