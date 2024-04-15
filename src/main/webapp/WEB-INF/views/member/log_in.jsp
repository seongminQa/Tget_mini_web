<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
	 	<div class="d-flex justify-content-center"style="margin-top:10%;">   
         <div class="login-wrapper">
          <div style="text-align : center;">
        <img src ="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="width:200px ; height: 145px;" > 
        <form method="post" action="#" id="login-form">
            <input type="text" name="userName" placeholder="id">
               
            <input type="password" name="userPassword" placeholder="Password">
              
             <label for="remember-check" class="d-flex justify-content-center">
             
             
             	<div class="me-5">
	            	<input type="checkbox" id="remember-check" class="m-1">아이디 저장하기  	         	             	
             	</div>
             	
				<div>
	             	<input type="checkbox" id="remember-check" class="m-1">자동 로그인             	
             	
             	</div>
             </label> 
            
            <input type="submit" value="Login">
            <div class="link">
              <p>	
              <a href="memberId">아이디 찾기</a> | <a href="memberPW">비밀번호 찾기</a> | <a href="memberRegist">회원가입</a> 
              </p>
            </div>
        </form>
        </div>
    </div>
</div>
		
	</body>
</html>