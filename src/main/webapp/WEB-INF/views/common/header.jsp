<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<header class="container mb-3" style="border-bottom: 5px solid #D95B96">

    <div class="row align-items-center">

      <div class="col d-flex justify-content-start">
        <a class="navbar-brand" href="/Tget_mini_web"><img src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="height: 100px;" /></a>
      </div>

      <div class="col d-flex justify-content-end">

        <ul class="nav ustify-content-center">
        <sec:authorize access="isAnonymous()">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/member/login" style="color: black;">
              <img src="/Tget_mini_web/resources/image/project_image/login.svg" style="height: 20px; width: 15px;" />
              <span style="font-size: small; display: block;">로그인</span>
            </a>
          </li>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
       		<%-- <div style="margin-top:15px">
          	<h4 class="text-black me-2">
   				<sec:authentication property="principal.username"/>님 환영합니다
   			</h4>
        	</div>    --%>			
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/logout" style="color: black;">
              <img src="/Tget_mini_web/resources/image/project_image/login.svg" style="height: 20px; width: 15px;" />
              <span style="font-size: small; display: block;">로그아웃</span>
            </a>
          </li>
        </sec:authorize>        	
        
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/member/sign_up" style="color: black;">
              <img src="/Tget_mini_web/resources/image/project_image/sign-up.svg" style="height: 20px; width: 15px;" />
              <span style="font-size: small; display: block;">회원 가입</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/member/memberInfoModify" style="color: black;">
              <img src="/Tget_mini_web/resources/image/project_image/user.svg" style="height: 20px; width: 15px;" />
              <span style="font-size: small; display: block;">마이페이지</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/shopping/cart" style="color: black;">
              <img src="/Tget_mini_web/resources/image/project_image/cart.svg" style="height: 20px; width: 15px;" />
              <span style="font-size: small; display: block;">장바구니</span>
            </a>
          </li>
        </ul>
				
      </div>
    </div>
    

    
 

  </header>