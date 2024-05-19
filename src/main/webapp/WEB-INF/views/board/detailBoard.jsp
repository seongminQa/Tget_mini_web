<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리  설정-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="/Tget_mini_web/resources/css/board.css">
<!-- 사용자 정의 자바스크립트 -->
<script>
	
</script>

</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="board_detail">

		<div>
			<div class="d-flex" style="justify-content: space-between;">
				<div id="board_detail_title">${boardDto.btitle}</div>
				<div id="board_detail_date">
					<fmt:formatDate value="${boardDto.bdate}" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<hr>
			<div class="d-flex mb-4" style="justify-content: space-between;">
				<div>${boardDto.mid}</div>
				<div id="board_detail_date">조회수:${boardDto.bhitcount}</div>
			</div>
			<c:if test="${boardDto.bimgoname != null}">
				<div class="mb-2">
					<img src="attachDownload?bno=${boardDto.bno}" width="150" />
				</div>
			</c:if>
			<p>내용 : ${boardDto.bcontent}</p>
			<hr/>
			<div class="mb-5">
				<a id="writebtn" href="javascript:window.history.back()"
					class="btn btn-info btn-sm">목록</a>
				<c:if test="${mid == 'admin' || boardDto.mid == mid}">
					<a id="writebtn" href="updateBoardForm?bno=${boardDto.bno}"
						class="btn btn-info btn-sm">수정</a>
					<a id="writebtn" href="deleteBoard?bno=${boardDto.bno}"
						class="btn btn-info btn-sm">삭제</a>
				</c:if>
			</div>

		</div>
	</div>
</body>
</html>