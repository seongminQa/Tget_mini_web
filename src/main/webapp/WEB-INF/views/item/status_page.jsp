<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
<meta charset="UTF-8">
      <title>Insert title here</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      <!-- jQuery 외부 라이브러리 설정 -->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
      
      <script >
         
      </script>

	</head>
	
	<body>
	
	<!-- header(헤더) -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
	   	<div class="container" style="height: 100px; width: 100%;  margin-top:50px;">
  			<!-- border:1px solid black; -->
  	  		<h2>예매내역 확인 취소</h2>
			<div class="d-flex" style=" justify-content: space-between;">
	  	  	  <div><img src="/Tget_mini_web/resources/image/detail_photos/존경하는 선생님 엘레나.gif"/></div>
	  	  	  <div class="d-flex" style=" width:500px; align-items: center">
				<div style="height:300px; margin-right:50px;">
					 <p>예매자:</p>
					 <p>예약번호: </p>
					 <p>이용일: </p>
					 <p>장소: </p>
					 <p>좌석 :</p>
					 <p>티켓수령 방법:</p>
				</div>
				<div style="height:300px;">
					 <p>홍수민</p>
					 <p>T15684658415(총1매)</p>
					 <p>2024년 4월 12일 목 12시30분</p>
					 <p>예술의 전당</p>
					 <p>3층 B블록 5열 12</p>
					 <p>현장 수령  배송 방법유의사항등등</p>			
				</div>  	  	  
	  	  	  </div>
	  	    </div>  
	  	    
	  	    <!--  -->
	  	    <div style="margin-top:40px;">
	  	    <h2><li>결제 내역</li></h2>
	  	    <table class="table  table-striped-columns">
			  <thead>
			    <tr>
			      <th scope="col">예매일</th>
			      <th scope="col">2024-01-05</th>
			      <th scope="col">현재상태</th>
			      <th scope="col">취소</th>
			    </tr>
			  </thead>
			  <thead>
			    <tr>
			      <th scope="col">결제수단</th>
			      <th scope="col">카드</th>
			      <th scope="col">결제상태</th>
			      <th scope="col">결제</th>
			    </tr>
			  </thead>
			  <!--  -->
				
				<!--  -->		 
	 				 <div class="sub"style="margin-top:10px;" >
					<div style="text-align : center;">  
					<table class="table ">
					  <thead class="table table-active">
					    <tr>
					      <th scope="col">예매번호</th>
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
					      <td>2024.</td>
					    </tr>

					  </tbody>
				
					
					
				<hr>	
				<table class="table table-bordered border-balck">
			  <thead class="table">
			    <tr>
			      <th scope="col">총 결제 금액</th>
			      <th scope="col">23,000원</th>
			      <th scope="col">취소 수수료</th>
			      <th scope="col">2,100</th>
			    </tr>
			  </thead>
			  <thead>
			    <tr>
			      <th scope="col">취소금액</th>
			      <th scope="col">18,900</th>
			      <th scope="col">예매 수수료</th>
			      <th scope="col">2,000은 환불 되지 않습니다.</th>
			    </tr>
			  </thead>
				</table>
					</hr>
					  
				<div style="padding-bottom: 150px;">
				<h2><li>취소 유의 사항</li></h2>
				<table class="table table-bordered border-balck">
			  <thead class="table">
			    <tr>
			      <th scope="col">취소 마감시간</th>
			      <th scope="col">1시간전에는 불가능합니다.</th>
			     
			    </tr>
			  </thead>
			  <thead>
			    <tr>
			      <th scope="col">취소수수료</th>
			      <th scope="col">취소하면 매진좌석일시 다시 구매가 불가능합니다</th>
			     
			    </tr>
			  </thead>
				</table>
					<div class="d-flex justify-content-end">
					 <button type="button" onclick="location='/Tget_mini_web/member/purchase'" class="btn btn-secondary btn-lg">
					      예매내역 목록
					      </button>
					</div>
				
				</div>	  	
					  
					  
					</table>
					</div>  
					</div> 
			</table>
			
			
				
	 				 
	  	    </div>
			  <!--  -->
				 
			  
			  
			  
			  
			  
			  
			  
	
	  	    	  	
  		</div>
 			

	</body>
	 	
</html>