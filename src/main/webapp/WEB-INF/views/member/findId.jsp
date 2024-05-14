
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 





<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<link rel="stylesheet" href="/Tget_mini_web/resources/css/lostid.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
	
          
		
		
		</script>
	</head>
	<body>
	<!-- 헤더 -->
	 <%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	
		<!--  중앙에 가로로 정렬시키기 위해(화면창을 줄이건 늘려도 가운대로 하기위해) 스타일은 너무 위로 치우쳐 있어서 마진탑 10%로 줌 -->
	 	<div class="d-flex justify-content-center"style="margin-top:5%;">  
         <div class="login-wrapper">
         <!-- 가운데 이미지 티겟을 설정하기위해 text-align -->
      <div style="text-align : center;">  
         <!--  이미지 크기를 맟주기 위해 높이와 너비를 줌 -->
       <a class="navbar-brand" href="/Tget_mini_web">
       
      <h1 class="mb-5"><b>Find ID</b></h1> 
      
      
       </a>   
        <form method="post" action="${pageContext.request.contextPath}/member/findId" id="login-form" novalidate>
        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
    				<div><h3 class="mb-5">아이디 : ${mid}</h3></div>
    <!--         <input class="" type="text" name="mname" placeholder="name" id="mname">        
            <input class="" type="text" name="#mssn" placeholder="ex)00xxxx" id="#mssn">
            <input class="" type="text" name="mphone" placeholder="phone number" id="mphone"> -->
       			<!--아이디찾기  기능 -->
     <%--   			<div class="result-box">
					<c:choose>
						<c:when test="${empty findId}">
						<p class="inquiry">조회결과가 없습니다.</p>
						</c:when>
				        <c:otherwise>
				            <p>${findId.mid}</p>
				        </c:otherwise>
					</c:choose>
				</div> --%>
       <!--아이디 찾기  -->
       <%-- method="post" action="${pageContext.request.contextPath}/member/findId" --%>
            <input type="submit" value="완료"  style="background-color:  #D95B96; color:white;">
            <div class="link">
              <p>	
              <!-- 링크는 각각 아이디찾기, 비밀번호 찾기, 회원가입 페이지로 이동할수 있도록 구현한 링크이다. -->
              <a href="/Tget_mini_web/member/login">로그인</a> | 
              <a href="/Tget_mini_web/member/lost_pw">비밀번호 찾기</a> | 
              <a href="/Tget_mini_web/member/sign_up">회원가입</a> 
              </p>
            </div>
        </form>
            
        </div>
    </div>
</div>

	    <!-- footer 하단고정-->
	     <div class="fixed-bottom"> 
    <%@include file="/WEB-INF/views/common/footer.jsp"%>	
	    </div>
	    
	    
	


		
	</body>
</html>