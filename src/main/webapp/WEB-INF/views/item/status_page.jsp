<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	
<meta charset="UTF-8">
      <title>Insert title here</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      <!-- jQuery 외부 라이브러리 설정 -->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
      
      <script>
     
      
         
      </script>

	</head>
	
	<body>
	
	<!-- header(헤더) -->
	 <%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	   	<div class="container" style="height: 100px; width: 100%;  margin-top:30px; ">
  	  		<h2 >예매내역 확인 * 취소</h2>
  			<div style="height: 50px; width: 100%; ">
  				<table class=" table table-danger"> <!--border:1px solid red;,  table-bordered border-balck"  -->
					<tr>
						<th style="text-align:left">존경하는 엘라나 선생님</th>
						<th style="text-align:right">*예매경로:인터넷으로 해라</th>
					</tr>
				</table>
  			</div>
  			
  	  		<div class="row d-flex" ><!--style=" justify-content: space-between;"  -->
  	  		
	  	  		<!-- 이미지 파일 창 -->
	  	  	
	  	  		<div class="col-lg-5 text-center" >
		  	  		<div  style="width: 100%; height:450px;  margin-right:30px; "> <!--border:1px solid red; float: left;-->	
		  	  			<img src="/Tget_mini_web/resources/image/detail_photos/존경하는 선생님 엘레나.gif"/>
					</div>
				</div>
				
				<!-- 예매자 창 -->
				<div  class="col-lg-7">	
					<div style="width: 100%; height:450px;  word-spacing: 0.5em; ">	<!--border:1px solid black; margin-top:0px; float: right; -->	
						<table class="table table-bordered border-balck"> <!-- table-bordered border-balck"  -->
							<tr>
								<th class="table-active" style="border:1px solid white;"><h4>예매자</h4></th>
								<th>홍길동</th>
							</tr>
							<tr>
								<td class="table-active" style="border:1px solid white; "><h4>예약번호</h4></td>
								<td>468541415</td>
							</tr>
							<tr>
								<td class="table-active" style="border:1px solid white; "><h4>이용일</h4></td>
								<td>0121513</td>
							</tr>
							<tr>
								<td class="table-active" style="border:1px solid white; "><h4>장소</h4></td>
								<td>예술의 전당</td>
							</tr>
							<tr>
								<td class="table-active" style="border:1px solid white; "><h4>좌석</h4></td>
								<td>3층 블록 뭐시기저시기</td>
							</tr>
							<tr style="height:100px;">
								<td class="table-active" style="border:1px solid white; "><h4>티켓수령방법</h4></td>
								<td>현장 수령이긴하나 나도 그건 잘모르겠습니다 그러니깐 알아서 가져가세요</td>
							</tr>
						</table>
					</div>
					</div>
					
	  	  		</div>
	  	  		
	  	  		
  	  		
  	  		<!-- 결재내역창 -->
  	  		<div style="width:100%; height:150px; padding:10px; "><!-- border:1px solid green; -->
  	  		 <h2 style="border-bottom: 5px solid #D95B96">결제 내역</h2>
  	  		 <!-- <p style="width:100%; height:10px; border:none;background-color:#D95B96;"></p>  -->
  	  		
  	  		 <table class="table">
				  <thead>
				   		 <tr>
					      <th scope="col" class="table-active" style="border:1px solid white;">예매일</th>
					      <th scope="col">2024-01-05</th>
					      <th scope="col" class="table-active" style="border:1px solid white;">현재상태</th>
					      <th scope="col">취소</th>
				    	</tr>
				  </thead>
				  
				  <thead>
					    <tr>
					      <th scope="col" class="table-active" style="border:1px solid white;">결제수단</th>
					      <th scope="col">카드</th>
					      <th scope="col" class="table-active" style="border:1px solid white;">결제상태</th>
					      <th scope="col">결제</th>
					    </tr>
				 </thead>

			  </table>
  	  		</div >
  	  		
  	  		<!-- 예매번호 창 -->
	  	  		<div style="width:100%; height:120px; margin-top:10px; padding:10px;"><!--border:1px solid red;  -->
	  	  		<table class="table">
	  	  			<thead class="table table-active" >
						    <tr>
						      <th scope="col" >예매번호</th>
						      <th scope="col">좌석등급</th>
						      <th scope="col">가격등급</th>
						      <th scope="col">좌석 번호</th>
						      <th scope="col">가격</th>
						      <th scope="col">취소여부</th>
						      <th scope="col"></th>    
						    </tr>
					 </thead>
	  						 <tbody class="table-group-divider" >
							    <tr>
							      <th scope="row">T15684658415</th>
							      <td>A석</td>
							      <td>마티네 할일 30%</td>
								  <td>3층 B블록 5열 12</td>
							      <td>21000</td>
							      <td>취소됨</td>
							      <td>2024.04.25</td>
							    </tr>
						  </tbody>
	  	  			</table>
	  	  		</div>
  	  		
  	  		<!-- 결제 금액 확인 창 -->
  	  		<div style="width:100%; height:100px;  padding:10px;"><!--border:1px solid red;  -->
  	  			<table class="table table-bordered border-balck">
			  		<thead class="table">
					    <tr>
					      <th scope="col" class="table-active" style="border:1px solid white;">총 결제 금액</th>
					      <th scope="col">23,000원</th>
					      <th scope="col" class="table-active" style="border:1px solid white;">취소 수수료</th>
					      <th scope="col">2,100</th>
					    </tr>
					</thead>
			
					  <thead>
					    <tr>
					      <th scope="col" class="table-active" style="border:1px solid white;">취소금액</th>
					      <th scope="col">18,900</th>
					      <th scope="col" class="table-active" style="border:1px solid white;">예매 수수료</th>
					      <th scope="col">2,000은 환불 되지 않습니다.</th>
					    </tr>
					  </thead>
				</table>
  	  		</div>
  	  		
  	  		<!-- 유의사항 창 -->
  	  		<div style="width:100%; height:500px;  padding:10px; "><!--border:1px solid blue;  -->
  	  			<h2 style="border-bottom: 4px solid #D95B96">취소 유의 사항</h2>
				<table class="table table-bordered border-balck">
					 <thead class="table">
					    <tr>
					      <th scope="col" class="table-active" style="border:1px solid white;">취소 마감시간</th>
					      <th scope="col">1시간전에는 불가능합니다.</th> 
					   	 </tr>
					</thead>
						  <thead>
					    	<tr>
						      <th scope="col" class="table-active" style="border:1px solid white;">취소수수료</th>
						      <th scope="col">취소하면 매진좌석일시 다시 구매가 불가능합니다</th>
					    	</tr>
					  	</thead>
				</table>
				
				   <!-- 예매내역 목록 버튼 -->
					<div class="d-flex justify-content-end">
					 	<button type="button" onclick="location='/Tget_mini_web/member/purchase'" class="btn btn-secondary btn-lg">
					     	 예매내역 목록
					     </button>

					   <!--   <button type="button" onclick="location='/Tget_mini_web/payment/payment_cancel'" class="btn btn-warning btn-lg"> -->
					     <button type="button" onclick="location='/Tget_mini_web/member/purchase'" class="btn btn-danger btn-lg">

					     	 취소
					     </button>
					</div>	
						<div class="d-flex justify-content-start">
					 	
					</div>	
						
  	  		</div>
  	  		<!--####  -->
  		</div>


	</body>
	 	
</html>