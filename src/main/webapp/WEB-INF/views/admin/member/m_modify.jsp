<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Insert title here</title>

    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href=""/>

    <!-- 사용자 정의 자바스크립트 -->
    <script></script>

    <!-- 내부 css 적용 (테스트용) -->
    <style>
	
    </style>
  </head>
	<body>
	
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원 정보 수정</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      
				<form method="post" action="#">
					<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
				   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				   <div class="form-group mb-2">
				       <label for="mid">Member ID</label>
				       <input type="text" class="form-control" id="mid" name="mid">
				   </div>
				   <div class="form-group mb-2">
				       <label for="mname">Member Name</label>
				       <input type="text" class="form-control" id="mname" name="mname">
				   </div>
				   <div class="form-group mb-2">
				      <label for="mpassword">Member Password</label>
				      <input type="password" class="form-control" id="mpassword" name="mpassword">
				   </div>
				   <div class="form-group mb-2">
				      <label for="memail">Member email</label>
				      <input type="email" class="form-control" id="memail" name="memail">
				   </div>
				   
		           <div class="form-group">
		              <label for="mrole">Member Role</label>
		              <select class="form-control" id="mrole" name="mrole">
		                 <option value="ROLE_ADMIN">Admin</option>
		                 <option value="ROLE_MANAGER">Manager</option>
		                 <option value="ROLE_USER" selected>User</option>
		              </select>
		           </div>
				   
				   <button type="submit" class="btn btn-info btn-sm mt-2">회원가입</button>
				</form>
							
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>

	</body>
</html>