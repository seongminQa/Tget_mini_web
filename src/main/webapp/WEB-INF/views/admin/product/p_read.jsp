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
									<c:forEach var="product" items="${productList}">
										<tr>
											<td>${product.pno}</td>
											<td>${product.ptitle}</td>
											<td>${product.paddress}</td>
											<td>${product.pdatestart} ~ 2024.06.19</td>
											<td>${product.pprice}</td>
										</tr>
									</c:forEach>
									
							         <tr>
							            <td colspan="5" class="text-center">
							               <div>
							                  <a class="btn btn-outline-primary btn-sm" href="boardList?pageNo=1">처음</a>
							                  <c:if test="${pager.groupNo>1}">
							                     <a class="btn btn-outline-info btn-sm" href="boardList?pageNo=${pager.startPageNo-1}">이전</a>
							                  </c:if>
							                  
							                  <!-- 번호가 들어가는 부분 -->
							                  <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							                     <c:if test="${pager.pageNo != i}">
							                        <a class="btn btn-outline-success btn-sm" href="boardList?pageNo=${i}">${i}</a>
							                     </c:if>
							                     <c:if test="${pager.pageNo == i}">
							                        <a class="btn btn-danger btn-sm" href="boardList?pageNo=${i}">${i}</a>
							                     </c:if>
							                  </c:forEach>
							                  
							                  <c:if test="${pager.groupNo<pager.totalGroupNo}">
							                     <a class="btn btn-outline-info btn-sm" href="boardList?pageNo=${pager.endPageNo+1}">다음</a>
							                  </c:if>
							                  <a class="btn btn-outline-primary btn-sm" href="boardList?pageNo=${pager.totalPageNo}">맨끝</a>
							               </div>
							            </td>
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