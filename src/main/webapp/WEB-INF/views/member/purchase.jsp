<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<link rel="stylesheet" href="/Tget_mini_web/resources/css/purchase.css">
<!-- 반응형 제거 코드 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 반응형 제거 코드 -->
<style >

table tr td {
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width: 140px;
}

</style>
</head>

<body>

	<!-- header(헤더) -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>




	<!-- context ######-->
	
	<div class="content"
		style="background-color: white-space; width: 100%; height: 100vh">
		<div class="row justify-content-center">
			<div class="pb-3 row" style="width: 70%">
			
				<div class="col-3">
					<div style="background-color: white" class="pt-5 pb-5">
						<p class="ms-3">
							홍길동님의 <br />마이페이지
						</p>
						<hr />
						<ul>
							<a href="#"><li>회원정보 수정</li></a>
							<a href="#"><li>내가 쓴 후기</li></a>
							<a href="#"><li>구매 내역</li></a>
							<a href="#"><li>회원 탈퇴</li></a>
						</ul>
					</div>
				</div>
					<!-- bg -->
				<div class="col-9" style="background-color: white">
					 <h4 class="ps-2 pt-5"></h4> 
					 
					 <div class="content-box">
					 <div class="d-flex justify-content-center"style="margin-top:5%;">
					 <div class="me-2">
					 조회기간
					 <button type="button" class="round gray">1개월</button>
					 <button type="button" class="round gray">3개월</button>
					 <button type="button" class="round gray">6개월</button>
					 </div>
					 
					 <p>
					 <label for="startdate">시작일 입력 </label>
					 <input type="date" id="startdate" name="startdate" value="2024-03-22">
					
					 
					 <label for="enddate">~끝나는일 입력 </label>
					 <input type="date" id="enddate" name="enddate" value="2024-04-25">
					 
					  
					  <button type="button" class="btn btn-secondary btn-sm">
					  <span>조회하기</span>
					  </button>
					 
					 </p>
					 </div>
					 </div>
		
						
					<!-- 중앙 예매 한 내역 -->
					
				 <div class="sub"style="margin-top:23px;">
					<div style="text-align : center; ">  
					<table class="table">
					  <thead class="table">
					    <tr>
					      <th scope="col">예매일</th>
					      <th scope="col">예약번호</th>
					      <th scope="col">공연명</th>
					      <th scope="col">관람일</th>
					      <th scope="col">매수</th>
					      <th scope="col">취소가능일</th>
					      <th scope="col">상태</th>
					     
					    </tr>
					  </thead>
					   
					  <tbody class="table-group-divider" >
					    <tr>
					      <th scope="row">2024.02.20</th>
					      <td>11223322</td>
					      <td>창작가무극</td>
						  <td>2024.03.11</td>
					      <td>2</td>
					      <td>2024.03.10 | 23:59</td>
					      <td>취소 | 
					      <button type="button" class="btn btn-outline-dark btn-sm">상세</button>
					      </td>
					    </tr>

					  </tbody>
					  
					</table>
					</div>  
					</div> 
					<!-- 중앙 예매 한 내역 -->					
					
				<!-- bg -->
				</div>

					<!-- context 감싸는 div 밑에서부터  -->
				</div>
			</div>
		</div>

					
	<!-- context ######-->




	<!-- footer 하단고정-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


</body>
</html>