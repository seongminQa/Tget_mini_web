
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
		
		<link rel="stylesheet" href="/Tget_mini_web/resources/css/login.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
/* 		function loginCheck(){
			if (document.loginform.userid.value == ""){
				alert("아이디를 입력해 주세요.");
				document.loginform.userid.focus();
				return false;
			} else if (document.loginform.pwd.value == ""){
				alert("비밀번호를 입력해주세요.");
				document.loginform.pwd.focus();
				return false;
			} else {
				return true;
			}
		}
		 */
		</script>
	</head>
	<body>

	
		<!--  중앙에 가로로 정렬시키기 위해(화면창을 줄이건 늘려도 가운대로 하기위해) 스타일은 너무 위로 치우쳐 있어서 마진탑 10%로 줌 -->
	 	<div class="d-flex justify-content-center"style="margin-top:5%;">  
         <div class="login-wrapper">
         <!-- 가운데 이미지 티겟을 설정하기위해 text-align -->
      <div style="text-align : center;">  
         <!--  이미지 크기를 맟주기 위해 높이와 너비를 줌 -->
       <a class="navbar-brand" href="/Tget_mini_web"> <img src ="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="width:200px ; height: 145px;"></a>   
        <form method="post" action="#" id="login-form">
        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
            <input type="text" name="userName" placeholder="id">
               
            <input type="password" name="userPassword" placeholder="Password">
              <!-- 체크박스를 가운데로 정렬하기 위하여 -->
             <label for="remember-check" class="d-flex justify-content-center">
             
             	<!-- m-5를 준이유는 체크박스의 간격을 띄우기 위해서 -->
             	<div class="me-5">
	            	<input type="checkbox" id="remember-check" class="m-1">아이디 저장하기  	         	             	
             	</div>
             	
				<div>
	             	<input type="checkbox" id="remember-check" class="m-1">자동 로그인             	
             	
             	</div>
             </label> 
            <!-- 버튼을 생성하는 입력요소 form 타입 sumbit은 제출버튼 동작으로 지정하여  value 값을 로그인으로 지정하였습니다.
            사용자가 입력한 데이터를 서버로 제출하기위해서 사용함 (서버 전송버튼)-->
            <!-- 로그인 버튼이지만 클릭을 할경우 입력한 아이디와 비밀번호 정보가 서보로 전송될 수있도록 사용 -->
            <input type="submit" value="Login">
            <div class="link">
              <p>	
              <!-- 링크는 각각 아이디찾기, 비밀번호 찾기, 회원가입 페이지로 이동할수 있도록 구현한 링크이다. -->
              <a href="/Tget_mini_web/member/lost_id">아이디 찾기</a> | 
              <a href="/Tget_mini_web/member/lost_pw">비밀번호 찾기</a> | 
              <a href="/Tget_mini_web/member/sign_up">회원가입</a> 
              </p>
            </div>
        </form>
        </div>
    </div>
</div>

	    <!-- footer 하단고정-->
	    
    <%@include file="/WEB-INF/views/common/footer.jsp"%>	
	    
		
	</body>
</html>