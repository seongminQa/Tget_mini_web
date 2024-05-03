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
		<style>
			.card-header {
				font-size: 20px;
				font-weight: bold;
				color: white;
				background-color: #D95B96;
			}
			ul {
				list-style: none;
			}
			a {
				text-decoration: none;
				color: #D95B96;
			}
			a:hover {
			  color : red;
			}
		</style>
</head>
<body>

	<div class="container d-flex flex-column "><!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-lg-2">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>				
				</div>
				
				<div class="col-lg-10">
					<!-- 유저 1 -->
					<div class="card">
						<div class="card-header">회원 관리</div>
						<div class="card-body">
							<table class="table table-hover text-center">
								<thead>
									<tr style="font-size: 18px;">
										<th>회원 번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>Email</th>
										<th>권한</th>
										<th>등급</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>-</td>
										<td>znznfltm</td>
										<td>김성민</td>
										<td>znznfltm@gmail.com</td>
										<td>manager</td>
										<td>-</td>
									</tr>
									<tr>
										<td>1</td>
										<td>SSooMin</td>
										<td>홍수민</td>
										<td>sooM@gmail.com</td>
										<td>user</td>
										<td>vvip</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Meonghwan</td>
										<td>김명환</td>
										<td>Meonghwan@gmail.com</td>
										<td>user</td>
										<td>vip</td>
									</tr>
									<tr>
										<td>3</td>
										<td>JeawonLick</td>
										<td>릭재원</td>
										<td>JeawonLick@gmail.com</td>
										<td>user</td>
										<td>Very Important Person</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 등록/수정/삭제 버튼 -->
					<div class="d-flex justify-content-end m-3">
						<button type="button" class="btn btn-outline-secondary me-2"
							data-bs-toggle="modal" data-bs-target="#">
							조회
						</button>
						<button type="button" class="btn btn-outline-secondary me-2"
							data-bs-toggle="modal" data-bs-target="#signupModal">
							등록
						</button>
						<button type="button" class="btn btn-outline-secondary me-2"
							 data-bs-toggle="modal" data-bs-target="#modifyModal">
							수정
						</button>
						<button type="button" class="btn btn-outline-secondary me-2">
							삭제
						</button>
					</div>
					<!-- 페이지네이션 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination d-flex justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
				
			</div>
		</div> 
	</div>
	
	<!-- 등록 버튼 -->
	<!-- 관리자, 매니저, 회원 선택지 Modal -->
	<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">어떤 회원을 등록하시겠습니까?</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <button type="button" class="btn btn-dark me-2"
	        	data-bs-toggle="modal" data-bs-target="#adminSignupModal">
	        	관리자
	        </button>
	        <button type="button" class="btn btn-info me-2"
	        	data-bs-toggle="modal" data-bs-target="#managerSignupModal">
	        	매니저
	        </button>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">생성</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Admin 등록 Modal -->
	<div class="modal" id="adminSignupModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header d-flex justify-content-center">
	        <h4 class="modal-title">관리자 등록</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">
	      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<form method="post" action="#">
				<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
			   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			   <div class="form-group mb-2">
			       <label for="mid">아이디</label>
			       <input type="text" class="form-control" id="mid" name="mid">
			   </div>
			   <div class="form-group mb-2">
			       <label for="mname">이름</label>
			       <input type="text" class="form-control" id="mname" name="mname">
			   </div>
			   <div class="form-group mb-2">
			      <label for="mpassword">비밀번호</label>
			      <input type="password" class="form-control" id="mpassword" name="mpassword">
			   </div>
			   <div class="form-group mb-2">
			      <label for="memail">이메일</label>
			      <input type="email" class="form-control" id="memail" name="memail">
			   </div>
			   
	           <!-- <div class="form-group">
	              <label for="mrole">Member Role</label>
	              <select class="form-control" id="mrole" name="mrole">
	                 <option value="ROLE_ADMIN">Admin</option>
	                 <option value="ROLE_MANAGER">Manager</option>
	                 <option value="ROLE_USER" selected>User</option>
	              </select>
	           </div> -->
			   
			   <button type="submit" class="btn btn-info btn-sm mt-2">등록</button>
			</form>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
	      </div>
		  
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- Manager 등록 Modal -->
	<div class="modal" id="managerSignupModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header d-flex justify-content-center">
	        <h4 class="modal-title">매니저 등록</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<form method="post" action="#">
				<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
			   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			   <div class="form-group mb-2">
			       <label for="mid">아이디</label>
			       <input type="text" class="form-control" id="mid" name="mid">
			   </div>
			   <div class="form-group mb-2">
			       <label for="mname">이름</label>
			       <input type="text" class="form-control" id="mname" name="mname">
			   </div>
			   <div class="form-group mb-2">
			      <label for="mpassword">비밀번호</label>
			      <input type="password" class="form-control" id="mpassword" name="mpassword">
			   </div>
			   <div class="form-group mb-2">
			      <label for="memail">이메일</label>
			      <input type="email" class="form-control" id="memail" name="memail">
			   </div>

			   <button type="submit" class="btn btn-info btn-sm mt-2">등록</button>
			</form>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
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