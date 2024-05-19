<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 </title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
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
	color: red;
}
</style>

</head>
<body>

	<div class="container d-flex flex-column ">
		<!-- viewport height -->
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
							<div class="col text-start ms-2">글 관리</div>
							<div class="col text-end me-3">공지</div>
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
									<c:forEach var="board" items="${boardList}">
										<tr>
											<td>${board.bno}</td>
											<td><a href="../board/detailBoard?bno=${board.bno}">${board.btitle}</a></td>
											<td>${board.mid}</td>
											<td><fmt:formatDate value="${board.bdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>게시글</td>
											<td>${board.bhitcount}</td>
										</tr>
									</c:forEach>


								</tbody>
								<tr>
									<td colspan="10" class="text-center">
										<div>
											<a class="btn btn-outline-primary btn-sm"
												href="?pageNo=1#board-list">처음</a>
											<c:if test="${pagerDto.groupNo>1}">
												<a class="btn btn-outline-info btn-sm"
													href="?pageNo=${pagerDto.startPageNo-1}#board-list">이전</a>
											</c:if>

											<c:forEach var="i" begin="${pagerDto.startPageNo}"
												end="${pagerDto.endPageNo}">
												<c:if test="${pagerDto.pageNo != i}">
													<a class="btn btn-outline-success btn-sm"
														href="?pageNo=${i}#board-list">${i}</a>
												</c:if>
												<c:if test="${pagerDto.pageNo == i}">
													<a class="btn btn-danger btn-sm"
														href="?pageNo=${i}#board-list">${i}</a>
												</c:if>
											</c:forEach>

											<c:if test="${pagerDto.groupNo<pagerDto.totalGroupNo}">
												<a class="btn btn-outline-info btn-sm"
													href="?pageNo=${pagerDto.endPageNo+1}#board-list">다음</a>
											</c:if>
											<a class="btn btn-outline-primary btn-sm"
												href="?pageNo=${pagerDto.totalPageNo}#board-list">맨끝</a>
										</div>
									</td>
								</tr>
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
							<button type="button" class="btn btn-outline-secondary me-2" onClick="location.href='../board/writeBoardForm'">등록</button>
							
						</div>
					</div>
					<!-- 페이지네이션 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination d-flex justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</div>

</body>
</html>