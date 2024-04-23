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
			.card {
				/* border: none; */
			}
		</style>
</head>
<body>

	<div class="container d-flex flex-column "><!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-md-3">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>				
				</div>
				
				<div class="col-md-9">
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
						<button type="button" class="btn btn-outline-secondary me-2">등록</button>
						<button type="button" class="btn btn-outline-secondary me-2">수정</button>
						<button type="button" class="btn btn-outline-secondary me-2">삭제</button>
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

</body>
</html>