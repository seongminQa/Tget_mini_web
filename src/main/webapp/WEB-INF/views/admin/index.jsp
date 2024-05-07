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
						<div class="container" style=" height: 50px; width: 100%;margin-top:10px">
						<h4> <li>전체 주문 통계</li></h4>
						</div>
					
					
						<div class="d-flex justify-content-center" style=" width: 50%; height:30px; float: left; margin-top:10px;"><!-- border:1px solid black; -->
							<h4 >주문상태 현황</h4>
						</div>
						
						<div class="d-flex justify-content-center" style=" width: 50%; height:30px;float: right; margin-top:10px; ">
							<h4>전체 주문 현황</h4>
						</div>
						
						
						<div style=" width: 50%; height:100px; float: left; margin-top:10px;">
							<table class="table"  style="text-align: center;">
						  		<thead >
								    <tr>
								      <th scope="col" class="table-active" style="border:1px solid white; ">총 주문건수</th>				     
								      <th scope="col" class="table-active" style="border:1px solid white; ">총 주문액</th>
								    </tr>
								    <tr>
								      <td style="border:1px solid white; height:50px; background-color:#F6F6F6;" >34</td>
								      <td style="border:1px solid white; height:50px; background-color:#F6F6F6;">2,459,700</td>
								      </tr>
								</thead>
							</table>
						</div>
						
						<div style="width: 50%; height:100px; float: right; margin-top:10px;">
							<table class="table" style="text-align: center;">
						  		<thead>
								    <tr>
								      <th scope="col" class="table-active" style="border:1px solid white;">입금대기</th>				     
								      <th scope="col" class="table-active" style="border:1px solid white;">입금완료</th>
								      <th scope="col" class="table-active" style="border:1px solid white;">구매확정</th>
								    </tr>
								    <tr>
								      <td style="border:1px solid white; height:50px; background-color:#F6F6F6;">0</td>
								      <td style="border:1px solid white; height:50px; background-color:#F6F6F6; ">0</td>
								      <td style="border:1px solid white; height:50px; background-color:#F6F6F6;">0</td>
								      </tr>
								</thead>
							</table>
						</div>
						
						
						
						<div class="d-flex justify-content-center" style=" width: 50%; height:30px;margin-top:20%">
							<h4>문의 및 게시판</h4>
						</div>
						
						<div style=" width: 50%; height:100px;  margin-top:10px;">
							<table class="table"  style="text-align: center;">
						  		<thead>
								    <tr>
								      <th scope="col" class="table-active" style="border:1px solid white;">미답변 문의</th>				     
								      <th scope="col" class="table-active" style="border:1px solid white;">신고가 들어온 게시물</th>
								    </tr>
								    <tr>
								      <td style="border:1px solid white;height:50px;background-color:#F6F6F6;">34</td>
								      <td style="border:1px solid white;height:50px;background-color:#F6F6F6;">2,437,700</td>    
								      </tr>
								</thead>
							</table>
						</div>
						
					<!-- #################################### -->
				</div>
				
			</div>
		</div> 
	</div>

</body>
</html>