
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
		
		
		function pwModify() {
	        const pwModal = new bootstrap.Modal("#pwModifyModal");
	        pwModal.show();		
	}
	


		
		
		
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
       <a class="navbar-brand" href="/Tget_mini_web"> <h1 class="mb-5"><b>Find password</b></h1></a>  
       
       
        <form method="post" action="#" id="login-form">
        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
            <input type="text" name="userName" placeholder="ID">
             <input type="text" name="userName" placeholder="email"> 
               
      <!--       <input type="password" name="userPassword" placeholder="new password"> -->
              

       
            <input type="submit" value="비밀번호 찾기">
            <div class="link">
            <button type="button" onclick="pwModify()"class="btn btn-outline-dark btn-sm">
					      	상세
					      </button>
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
	   
	   <!-- modal(pw) -->
			<div class="modal" tabindex="-1" id="pwModifyModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- modal header -->
						<div class="modal-header">
							<h5 class="modal-title">비밀번호  변경</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<!-- modal body -->
						<div class="modal-body">
							<form class="p-3" method="post">
								<div class="div_form row">
									<label for="pw" class="col-3"><strong>새 비밀번호</strong></label> <input
										class="col-7 mb-5" type="password" id="pw" name="pw"
										placeholder="8~12자 영문, 숫자" />
								
									<div class="col-2">
										<button type="button"
											style="border: none; background-color: transparent">
											<img src="/Tget_mini_web/resources/image/project_image/eye.svg"
												style="width: 30px" />
										</button>
									</div>
								</div>
								<div class="div_form row">
									<label for="pwcheck" class="col-3"><strong>새 비밀번호
											확인</strong></label> <input class="col-7 mb-5" type="password" id="pwcheck"
										name="pwcheck" placeholder="8~12자 영문, 숫자" />
									<div class="col-2">
										<button type="button"
											style="border: none; background-color: transparent">
											<img src="/Tget_mini_web/resources/image/project_image/eye.svg"
												style="width: 30px" />
										</button>
									</div>
								</div>
							</form>
						</div>
						<!-- modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn"
								style="background-color: #d95b96; color: white" onclick="location='/Tget_mini_web'" >수정 완료</button>
						</div>
					</div>
				</div>
			</div>		
		<!--ㅡmodal  -->
		
	</body>
</html>