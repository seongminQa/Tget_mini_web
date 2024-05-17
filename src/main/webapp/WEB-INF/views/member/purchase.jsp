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
					<div>
                     	 <c:if test="${empty memberDto.mprofileImgData}">
	                        <img src="${pageContext.request.contextPath}/resources/image/project_image/circle_user.svg" width="150" style="margin-bottom: 20px"/>
	                     </c:if>
	                     <c:if test="${not empty memberDto.mprofileImgData}">
	                        <img src="imgProfileDownload?mid=${memberDto.mid}" width="150" style="border-radius: 70%; margin-bottom: 20px; border:3px solid black;" />
	                     </c:if>
                     </div>
						  <h4 class="ms-3"><strong>${memberDto.mname}</strong>님의 <br />마이페이지</h4>
						<hr />
						<%@include file="/WEB-INF/views/common/myPageList.jsp"%>
					
					</div>
				</div>
					<!-- 달력 -->
				<div class="col-9" style="background-color: white;">
					 <h4 class="ps-2 pt-5"></h4> 
					 
					 <div class="content-box ">
						 <div class="d-flex">
						 		 
						 	<div style="height:30px; width:100%; margin-top:25px">
					 			<h2 style="border-bottom: 4px solid #D95B96">최근 예매 내역</h2>					 
						 
							 
							 <div style="height:50px; width:100%; boder:1px solid blue;" class="text-end" > <!-- class="me-2"  -->
							
							 <label for="startdate">시작일 입력 </label>
							 <input type="date" id="startdate" name="startdate" value="2024-03-22">
							
							 <label for="enddate">~끝나는일 입력 </label>
							 <input type="date" id="enddate" name="enddate" value="2024-04-25">
								  <button type="button" class="btn btn-secondary btn-sm">
								  	조회하기
								  </button>
							 </div> 
							</div>
 
						 </div>
					 </div>
					 <!--달력  -->
					 
				<!-- 	 <div style="height:30px; width:100%; margin-top:10px">
					 <h4 style="border-bottom: 2px solid #D95B96">최근 예매 내역</h4>
					 
					 </div> -->
		
						
					<!-- 중앙 예매 한 내역 -->
					
				 <div class="sub"style="margin-top:80px; /* border:1px solid red; */" >
					<div style="text-align : center; ">  
					<table class="table" >
					  <thead class="table"style="border-bottom: 3px solid #D95B96">
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
					   
					  <tbody class="table-group-divider" style="border-bottom: 3px solid #e8e1e4" >
					    <tr>
					      <th scope="row">2024.02.20</th>
					      <td>11223322</td>
					      <td >창작가무극</td>
						  <td>2024.03.11</td>
					      <td>2</td>
					      <td>2024.03.10 | 23:59</td>
					      <td><span>예매|</span>
					      <button type="button" onclick="location='/Tget_mini_web/item/status_page'" class="btn btn-outline-dark btn-sm">
					      	상세
					      </button>
					      </td>
					    </tr>

					  </tbody>
					   <tbody class="table-group-divider" style="border-bottom: 3px solid #e8e1e4">
					    <tr>
					      <th scope="row">2024.02.21</th>
					      <td>1155522</td>
					      <td>옥탑방 고양이</td>
						  <td>2024.04.04</td>
					      <td>4</td>
					      <td>2024.04.5 | 04:44</td>
					      <td><span>취소|</span> 
					      <button type="button" onclick="location='/Tget_mini_web/item/status_page'" class="btn btn-outline-dark btn-sm">
					      	상세
					      </button>
					      </td>
					    </tr>

					  </tbody>
					   </tbody>
					   <tbody class="table-group-divider" >
					    <tr>
					      <th scope="row">2024.06.19</th>
					      <td>16884320</td>
					      <td>지킬엔하이드박사</td>
						  <td>2024.07.25</td>
					      <td>8</td>
					      <td>2024.07.26 | 15:15</td>
					      <td><span>취소|</span>
					      <button type="button" onclick="location='/Tget_mini_web/item/status_page'" class="btn btn-outline-dark btn-sm">
					     	 상세
					      </button>
					      </td>
					    </tr>

					  </tbody>
					  
					</table>
					</div>  
					</div> 
					<!-- 중앙 예매 한 내역 -->					
					<!-- <a style="text-decoration:none; color:black;" href="/Tget_mini_web/">취소 |</a> -->
				<!-- bg -->
				</div>

					<!-- context 감싸는 div 밑에서부터  -->
				</div>
			</div>
		</div>

					
	<!-- context ######-->




	<!-- footer 하단고정-->
	<div class="fixed-bottom">
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	</div>


</body>
</html>