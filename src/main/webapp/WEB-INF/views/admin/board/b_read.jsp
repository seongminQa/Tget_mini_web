<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<!-- #################################### -->
					<div class="card">
						<div class="card-header d-flex">
							<div class="col text-start ms-2">
								글 관리
							</div>
							<div class="col text-end me-3">
								공지
							</div>
						</div>
						<div class="card-body">
							<table class="table table-hover text-center">
								<thead>
									<tr style="font-size: 18px;">
										<th>글 번호</th>
										<th>글 제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>분류(공지, Q&A)</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>#1</td>
										<td>티켓 예매  안내 관련</td>
										<td>Manager</td>
										<td>2024.04.23</td>
										<td>공지</td>
										<td>134</td>
									</tr>
									<tr>
										<td>#2</td>
										<td>회원 등급 변경 안내</td>
										<td>Manager</td>
										<td>2024.04.24</td>
										<td>공지</td>
										<td>220</td>
									</tr>
									<tr>
										<td>1</td>
										<td>비밀번호 변경 질문</td>
										<td>User</td>
										<td>2024.04.24</td>
										<td>Q&A</td>
										<td>1</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- #################################### -->
					<!-- 등록/수정/삭제 버튼 -->
					<div class="row d-flex justify-content-between m-3">
						<div class="col text-start">						
							<button type="button" class="btn btn-outline-primary me-2">전체</button>
							<button type="button" class="btn btn-outline-info me-2">공지</button>
							<button type="button" class="btn btn-outline-info me-2">Q&A</button>
						</div>
						<div class="col text-end">
							<button type="button" class="btn btn-outline-secondary me-2">등록</button>
							<button type="button" class="btn btn-outline-secondary me-2">수정</button>
							<button type="button" class="btn btn-outline-secondary me-2">삭제</button>
						</div>
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