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

<!-- 사용자 정의 자바스크립트 -->
<script>
	
</script>

</head>

<body>
	<div class="d-flex flex-column vh-100">

		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-md-4"></div>

				<div class="col-md-8">
					<!-- ###################################### -->
					<div class="card">
						<div class="card-header">게시물 보기</div>
						<div class="card-body">
							<p>번호 : ${boardDto.bno}</p>
							<p>제목 : ${boardDto.btitle}</p>
							<p>글쓴이 : ${boardDto.mid}</p>
							<p>
								날짜 :
								<fmt:formatDate value="${boardDto.bdate}" pattern="yyyy-MM-dd" />
							</p>
							<p>조회수 : ${boardDto.bhitcount}</p>
							<c:if test="${boardDto.bimgoname != null}">
								<div class="mb-2">
									<p>
										첨부파일 :<a href="attachDownload?bno=${boardDto.bno}">${boardDto.bimgoname}</a>
									</p>
									<img src="attachDownload?bno=${boardDto.bno}" width="150" />
								</div>
							</c:if>
								<p>내용 : ${boardDto.bcontent}</p>

								<hr />

								<a href="javascript:window.history.back()"
									class="btn btn-info btn-sm">목록</a>
								<c:if test="${boardDto.mid == mid}">
									<a href="updateBoardForm?bno=${boardDto.bno}"
										class="btn btn-info btn-sm">수정</a>
									<a href="deleteBoard?bno=${boardDto.bno}"
										class="btn btn-info btn-sm">삭제</a>
								</c:if>
						</div>
					</div>
					<!-- ###################################### -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>