<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="/Tget_mini_web/resources/css/board.css">
</head>

<body>
	<%-- <div class="d-flex flex-column ">
		<!-- viewport height -->

		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-md-4"></div>

				<div class="col-md-8">
					<!-- #################################### -->
					<div class="card">
						<div class="card-header">게시물 수정</div>
						<div class="card-body">

							<form id="updateBoardForm" method="post" action="updateBoard"
								enctype="multipart/form-data">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">bno</span>
									</div>
									<input id="bno" type="text" name="bno" class="form-control"
										readonly value="${boardDto.bno}" />
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">btitle</span>
									</div>
									<input id="btitle" type="text" name="btitle"
										class="form-control" value="${boardDto.btitle}">
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">bcontent</span>
									</div>
									<textarea id="bcontent" name="bcontent" class="form-control">${boardDto.bcontent}</textarea>
								</div>

								<div class="input-group mt-2">
									<div class="input-group-prepend">
										<span class="input-group-text">battach</span>
									</div>
									<input id="battach" type="file" name="battach"
										class="form-control">
									<c:if test="${boardDto.bimgoname != null}">
										<img src="attachDownload?bno=${boardDto.bno}" width="150" />
									</c:if>

								</div>

								<div class="mt-3">
									<button type="submit" class="btn btn-info btn-sm me-2">수정</button>
									<a class="btn btn-info btn-sm"
										href="javascript:window.history.back()">목록</a>
								</div>
							</form>

						</div>
					</div>
					<!-- #################################### -->
				</div>
			</div>
		</div>
	</div> --%>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div>
		<div id="form_title">게시물 수정</div>
		<div id="form_box" class='my-5'>
			<form id="updateBoardForm" method="post" action="updateBoard"
				enctype="multipart/form-data">
			
				<input id="bno" type="hidden" name="bno" class="form-control" readonly
					value="${boardDto.bno}" />
				<div>
					<div>
						<span id="small_title">이미지</span>

					</div>
					<input id="battach" type="file" name="battach" class="form-control">
					<c:if test="${boardDto.bimgoname != null}">
						<img src="attachDownload?bno=${boardDto.bno}" width="150" />
					</c:if>
				</div>
				<div>
					<div>
						<span id="small_title">제목</span>
					</div>
					<input id="btitle" type="text" name="btitle" class="form-control"
						value="${boardDto.btitle}">
				</div>
				<div>
					<div>
						<span id="small_title">내용</span>
					</div>
					<textarea id="bcontent" name="bcontent" class="form-control">${boardDto.bcontent}</textarea>
				</div>
				<div class="mt-3">
					<button id="writebtn" type="submit">수정하기</button>
					<a id="writebtn" class="btn" href="${pageContext.request.contextPath}/board#board-list">목록보기</a>
				</div>
			</form>
		</div>
	</div>





</body>
</html>