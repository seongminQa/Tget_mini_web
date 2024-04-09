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
			
		</script>
	</head>
	<body>
		
		<div class="d-flex justify-content-center">   
         <div class="login-wrapper">
        <img src ="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="width:200px ; height: 145px;" >
        <form method="post" action="서버의url" id="login-form">
            <input type="text" name="userName" placeholder="id">
            <input type="password" name="userPassword" placeholder="Password">
             <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
              	<input type="checkbox" id="remember-check">자동 로그인
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
		
	</body>
</html>