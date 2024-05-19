<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
  <script>
  $(document).ready(function() { 

	    // Top 버튼 특정 스크롤높이에서만 보이기 / 숨기기
	    $(window).scroll(function(){
	    	if($(this).scrollTop() > 100){
	        	$('#top-btn').fadeIn();
	        }else{
	        	$('#top-btn').fadeOut();
	        }
	    });
	    
	    // Top 버튼 클릭시 페이지 상단으로 이동
	   	$('#top-btn').click(function(){
	    	$('html, body').animate({scrollTop : 0}, 500);
	        return false;
	    });
	    
	 });
  
  </script>
<link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">


<header class="container mb-3">
   <div class="row align-items-center">
      <div class="col d-flex justify-content-start">
         <a class="navbar-brand" href="/Tget_mini_web"><img
            src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg"
            style="height: 100px;" /></a>
      </div>
      <div class="col d-flex justify-content-end">
         <ul class="nav ustify-content-center">
            <sec:authorize access="isAnonymous()">
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/member/login"
                  style="color: black;">  <span
                     style="font-size: small; display: block;">로그인</span>
               </a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
               <div style="margin-top: 5px">
                  <h5 class="text-black me-2">
                     <sec:authentication property="principal.username" />
                     님 환영합니다
                  </h5>
               </div>
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/logout"
                  style="color: black;">  <span
                     style="font-size: small; display: block;">로그아웃</span>
               </a></li>
            </sec:authorize>
            
            <sec:authorize access="isAnonymous()">
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath}/member/sign_up"
               style="color: black;"> <span
                  style="font-size: small; display: block;">회원 가입</span>
            </a></li>
            </sec:authorize>
            
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath}/member/memberInfoModify"
               style="color: black;">  <span
                  style="font-size: small; display: block;">마이페이지</span>
            </a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath}/product/cart"
               style="color: black;">  <span
                  style="font-size: small; display: block;">장바구니</span>
            </a></li>
         </ul>
      </div>
   </div>
   <nav class="container">
      <div class="row d-flex align-items-start">
         <div class="row justify-content-between">
            <div class="col-8 mt-2" style="width: 100%;">
               <ul class="nav">
                  <li class="nav-item"><a class="menu nav-link"
                     href="${pageContext.request.contextPath}/product" style="color: grey;">연극 / 뮤지컬</a></li>
                  
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <li class="nav-item"><a class="menu nav-link"
                        href="${pageContext.request.contextPath}/admin" style="color: grey;">관리자</a></li>
                  </sec:authorize>
               </ul>
            </div>
            <div>
               <div class="col-4 mt-2">
                  <div class="row d-flex mb-3"
                     style="border: 1px solid #D95B96; border-radius: 50px; height: 45px;">
                     <input class="col-10" type="text" placeholder="검색어를 입력해주세요."
                        style="border: none; outline: none; background-color: transparent;" />
                     <button class="col-1" type="button"
                        style="border: none; background-color: transparent;">
                        <img
                           src="/Tget_mini_web/resources/image/project_image/search.svg"
                           style="height: 30px;" />
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </nav>
</header>
<div class="container-fluid" style="border: 3px solid #D95B96;"></div>
<button id="top-btn"> ▲ <br/> TOP </button >