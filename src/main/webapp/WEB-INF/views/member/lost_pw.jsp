
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
		
		
		/* ----------------------유효성 검사------------------------- */
		function IDCheck(){
			// ssn이 빈문자면 아무것도 출력하지 않는다.
			if($("#mid").val() === ""){
				$("#idfpw").removeClass("text-danger").html("");
			}else{
				// 빈문자가 아니면 유효성 검사 실행
				var mssnPattern = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
				   var mssnResult = mssnPattern.test($("#mid").val());
				   if(mssnResult) {
					   $("#idfpw").removeClass("text-danger").html("올바른아이디양식입니다.");
				   } else {   
				      $("#idfpw").addClass("text-danger").html("아이디가  맞지 않습니다.");
				      
				   }
			}
			
			
		}
		function ssnPwCheck(){
			// ssn이 빈문자면 아무것도 출력하지 않는다.
			if($("#mssn").val() === ""){
				$("#ssnPw").removeClass("text-danger").html("");
			}else{
				// 빈문자가 아니면 유효성 검사 실행
				var mssnPattern = /^\d{13}$/;
				   var mssnResult = mssnPattern.test($("#mssn").val());
				   if(mssnResult) {
					   $("#ssnPw").removeClass("text-danger").html("주민등록번호가 양식에 맞습니다.");
				   } else {   
				      $("#ssnPw").addClass("text-danger").html("주민등록번호가 양식에 맞지 않습니다.");
				      
				   }
			}
			
			
		}
		
	
		
		</script>
	</head>
	<body>
		<!-- 헤더 -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	
		<!--  중앙에 가로로 정렬시키기 위해(화면창을 줄이건 늘려도 가운대로 하기위해) 스타일은 너무 위로 치우쳐 있어서 마진탑 10%로 줌 -->
	 	<div class="d-flex justify-content-center">  
         <div class="login-wrapper">
         <!-- 가운데 이미지 티겟을 설정하기위해 text-align -->
      <div style="text-align : center;">  
         <!--  이미지 크기를 맟주기 위해 높이와 너비를 줌 -->
       <a class="navbar-brand" href="/Tget_mini_web"> <h1 class="mb-5"><b>Find password</b></h1></a>  
       
       
        <form method="post" action="${pageContext.request.contextPath}/member/findPw" id="login-form">
        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
            <input oninput="IDCheck()"  type="text" name="mid" placeholder="ID" id="mid">
            <span id="idfpw"></span>
            
           	<input  type="text" name="mname" placeholder="name" id="mname">
            
             <input oninput="ssnPwCheck()" type="text" name="mssn" placeholder="(-)없는 전체 주민번호" id="mssn"> 
             <span id="ssnPw"></span>
               
      <!--       <input type="password" name="userPassword" placeholder="new password"> -->
              

       		
            <input type="submit" value="비밀번호 찾기"  style="background-color:  #D95B96; color:white;">
            <div class="link">
            
           <!--   <button type="button" onclick="pwModify()"class="btn btn-outline-dark btn-sm">
					  상세    </button>  -->
              <p>	
              <!-- 링크는 각각 아이디찾기, 비밀번호 찾기, 회원가입 페이지로 이동할수 있도록 구현한 링크이다. -->
              <a href="/Tget_mini_web/member/login">로그인</a> | 
              <a href="/Tget_mini_web/member/lost_id">아이디 찾기</a> | 
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