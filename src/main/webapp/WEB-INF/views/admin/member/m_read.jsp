<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
										<th>아이디</th>
										<th>이름</th>
										<th>Email</th>
										<th>전화번호</th>
										<th>권한</th>
										<th>등급</th>
										<th>-</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="member" items="${memberList}">
										<tr>
											<td>${member.mid}</td>
											<td>${member.mname}</td>
											<td>${member.memail}</td>
											<td>${member.mphone}</td>
											<td>${member.mrole}</td>
											<td>${member.mgrade}</td>
											<td>
												<button type="button" class="btn btn-outline-secondary"
							 						data-bs-toggle="modal" data-bs-target="#memberModify${member.mid}">
													수정
												</button>
												
												<!-- 회원 수정 및 삭제 Modal -->
												<div class="modal fade" id="memberModify${member.mid}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-lg">
												    <div class="modal-content">
												
												      <!-- Modal Header -->
												      <div class="modal-header text-center">
												        <h4 class="modal-title">정보 수정 및 삭제 페이지</h4>
												        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
												      </div>
												
												      <!-- Modal body -->
												      <div class="modal-body">
												      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
														<form method="post" action="memberModify">
															<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
														   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
														   <div class="container">
														   
															   <div class="form-group d-flex align-items-center mb-2">
															       <label for="mid" style="width:30%">회원 아이디 : </label>
															       <input type="text" class="form-control" id="mid" name="mid" style="width:50%"
															       		value="${member.mid}" readOnly>
															   </div>
															   <div class="form-group d-flex align-items-center mb-2">
															       <label for="mname" style="width:30%">회원 이름 : </label>
															       <input type="text" class="form-control" id="mname" name="mname" style="width:50%"
															       		value="${member.mname}" readOnly>
															   </div>
															   <div class="form-group d-flex align-items-center mb-2">
															      <label for="memail" style="width:30%">e-mail : </label>
															      <input type="email" class="form-control" id="memail" name="memail" style="width:50%"
															      		value="${member.memail}">
															   </div>
															   
															   <div class="form-group d-flex align-items-center mb-2">
															      <label for="mphone" style="width:30%">전화번호 : </label>
															      <input type="text" class="form-control" id="mphone" name="mphone" style="width:50%"
															      		value="${member.mphone}">
															   </div>
															   
													           <div class="form-group d-flex align-items-center mb-2">
													              <label for="mgrade" style="width:30%">회원 등급 : </label>
													              <select class="form-control" id="mgrade" name="mgrade" style="width:50%">
													                 <option value="GRADE_1" selected>일반</option>
													                 <option value="GRADE_2">골드</option>
													                 <option value="GRADE_3">플래티넘</option>
													              </select>
													           </div>
															</div>
															<button type="submit" class="btn btn-outline-secondary mt-2">수정</button>
														    <a href="memberDelete?mid=${member.mid}" class="btn btn-outline-danger mt-2">삭제</a>
															<!-- <button type="submit" class="btn btn-outline-danger mt-2" data-bs-dismiss="modal">삭제</button> -->
														    <%-- <a href="memberModify?mid=${member.mid}" class="btn btn-outline-secondary mt-2">수정</a> --%>
														</form>
														<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
												      </div>
												
												    </div>
												  </div>
												</div>

											</td>
										</tr>
									</c:forEach>
								
									<tr>
										<td colspan="7" class="text-center">
										
							               <div>
							                  <a class="btn btn-outline-primary btn-sm" href="memberReader?pageNo=1">처음</a>
							                  <c:if test="${pager.groupNo>1}">
							                     <a class="btn btn-outline-info btn-sm" href="memberReader?pageNo=${pager.startPageNo-1}">이전</a>
							                  </c:if>
							                  
							                  <!-- 번호가 들어가는 부분 -->
							                  <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							                     <c:if test="${pager.pageNo != i}">
							                        <a class="btn btn-outline-success btn-sm" href="memberReader?pageNo=${i}">${i}</a>
							                     </c:if>
							                     <c:if test="${pager.pageNo == i}">
							                        <a class="btn btn-danger btn-sm" href="memberReader?pageNo=${i}">${i}</a>
							                     </c:if>
							                  </c:forEach>
							                  
							                  <c:if test="${pager.groupNo<pager.totalGroupNo}">
							                     <a class="btn btn-outline-info btn-sm" href="memberReader?pageNo=${pager.endPageNo+1}">다음</a>
							                  </c:if>
							                  <a class="btn btn-outline-primary btn-sm" href="memberReader?pageNo=${pager.totalPageNo}">맨끝</a>
							               </div>

										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 등록/수정/삭제 버튼 -->
					<!-- 대기** -->
					<!-- <div class="d-flex justify-content-end m-3">
						<button type="button" class="btn btn-outline-secondary me-2"
							data-bs-toggle="modal" data-bs-target="#signupModal">
							매니저 등록
						</button>
					</div>
 -->
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