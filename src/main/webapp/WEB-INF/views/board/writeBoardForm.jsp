<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

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
<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div>
		<div id="form_title">
			게시물 작성
		</div>
		<div id="form_box" class='my-5'>
			<form id="writeBoardForm" method="post" action="writeBoard"
				enctype="multipart/form-data">
				<div>
					<div>
						<span id="small_title">이미지</span>
						
					</div>
					<input id="battach" type="file" name="battach" class="form-control">
				</div>
				<div>
					<div>
						<span id="small_title">제목</span>
					</div>
					<input id="btitle" type="text" name="btitle" class="form-control">
				</div>
				<div>
					<div>
						<span id="small_title">내용</span>
					</div>
					<textarea id="bcontent" name="bcontent" class="form-control"></textarea>
				</div>
				<div class="mt-3">
					<button id="writebtn" type="submit">글쓰기</button>
					<a id="writebtn" class="btn" href="${pageContext.request.contextPath}/board#board-list">목록보기</a>
				</div>
			</form>
		</div>
	</div>


</body>
</html>