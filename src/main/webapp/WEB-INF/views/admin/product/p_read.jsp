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
					<!-- #################################### -->
					<div class="card">
						<div class="card-header">상품 관리</div>
						<div class="card-body">
							<table class="table table-hover text-center">
								<thead>
									<tr style="font-size: 18px;">
										<th>연극 번호</th>
										<th>제목</th>
										<th>장소</th>
										<th>공연기간</th>
										<th>가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>내일은 내일에게</td>
										<td>혜화</td>
										<td>2024.04.23 ~ 2024.06.19</td>
										<td>16000원</td>
									</tr>
									<tr>
										<td>2</td>
										<td>옥탑방 고양이</td>
										<td>디큐브 링크아트센터</td>
										<td>2024.04.23 ~ 2024.06.19</td>
										<td>18000원</td>
									</tr>
									<tr>
										<td>3</td>
										<td>쉬어매드니스</td>
										<td>아트팩토리</td>
										<td>2024.04.23 ~ 2024.06.19</td>
										<td>16000원</td>
									</tr>
									<tr>
										<td>4</td>
										<td>오마이갓</td>
										<td>르 스페이스</td>
										<td>2024.04.23 ~ 2024.06.19</td>
										<td>19000원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- #################################### -->
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