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

	<div class="container d-flex flex-column"><!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-lg-2">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>				
				</div>
				
				<div class="col-lg-10">
					<!-- #################################### -->
					<div class="card">
						<div class="card-header">관리자 페이지</div>
						<div class="card-body">
							안녕하세요?
						</div>
					</div>
					<!-- #################################### -->
				</div>
				
			</div>
		</div> 
	</div>

</body>
</html>