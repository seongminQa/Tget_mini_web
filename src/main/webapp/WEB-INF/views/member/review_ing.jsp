<%@ page contentType="text/html; charset=UTF-8"%>
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
      <script type="text/javascript">
         
      </script>

	</head>
	
	<body>
	  	<!-- header(헤더) -->
  	<%@include file="/WEB-INF/views/common/header.jsp"%>
  	
  	
  	
<!--   	<div style="border: 1px solid #48BAE4; height:auto; width:50%;"> -->
  	 <!-- context ######-->
  <div class="content" style="background-color:white-space; width: 100%; height: 100vh; ">
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
             <h4 class="ms-3" ><strong>${memberDto.mname}</strong>님의 <br />마이페이지</h4>
            <hr/>
          
             <%@include file="/WEB-INF/views/common/myPageList.jsp"%>
            
          </div>
      
        </div>
      
        <div class="col-9" style="background-color: white">
        
          
         
          <!--#########  -->
          
 
   
        <nav class="navbar">
			  <div class="container-fluid">
			    <a class="navbar-brand" ></a>
			    <form class="d-flex" role="search" >
			      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" >
			      <button class="btn btn-outline-success" type="submit">Search</button>
			    </form>
			 </div>
		</nav>
	
  			 	<!-- 공연 후기 -->
  			 	<div style="margin-top:27px;">
  			 	<div style="text-align : center;">  
					<table class="table">
					  <thead class="table" style="border-bottom: 3px solid #D95B96">
					    <tr>
					      <th scope="col" class="j-title">제목</th>
					      <th scope="col" class="j-date">작성일</th>
					      <th scope="col" class="j-date">조회수</th>
					     
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					  <c:forEach var="board" items="${boardList}">
			 		
					    <tr>
					  <!--     <th scope="row" class="table-active" style="border:1px solid white"></th>  -->
					      <td ><a href="${pageContext.request.contextPath}/board/detailBoard?bno=${board.bno}">${board.btitle}</a></td>
					      <td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					      <td>${board.bhitcount}</td>
					    </tr>
			
					  </c:forEach>
					    
				<!-- 	    <tr>
					      <th scope="row" class="table-active" style="border:1px solid white;"></th>
					      <td>d</td>
					      <td>s</td>
					      <td>s</td>
					    </tr>
					    
					    <tr>
					      <th scope="row" class="table-active" style="border:1px solid white"></th>
					      <td>s</td>
					      <td>s</td>
					      <td>s</td>
					    </tr>
					     -->
					  	</tbody>
						</table>
					</div> 
  				</div>
  			<!-- 공연 후기 -->
  			
  		<!-- 페이지 네이션 -->
			<div class="center">
			  	<nav aria-label="Page navigation example">
					  <ul class="pagination d-flex justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
			 		 </ul>
				</nav>
			</div> 

  		<!-- 페이지 네이션 -->
  	</div>


   <!-- context 감싸는 div  -->
           </div>
      </div>
    </div>

 
  		  
 

  		
   <!-- footer 하단고정-->
	<div class="fixed-bottom">
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
     
	</body>
</html>