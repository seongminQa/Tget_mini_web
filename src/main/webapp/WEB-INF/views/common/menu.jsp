<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button ${admin=='member'?'':'collapsed'}" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        	회원
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse ${admin=='member'?'show':''}" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      	<ul>
      		<li><a href="${pageContext.request.contextPath}/admin/memberReader">회원 조회</a></li>
      	</ul>  
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button ${admin=='product'?'':'collapsed'}" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        	상품
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse ${admin=='product'?'show':''}" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <ul>
      		<li><a href="${pageContext.request.contextPath}/admin/productReader">상품 조회</a></li>
      	</ul> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button ${admin=='board'?'':'collapsed'}" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        	게시글
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse ${admin=='board'?'show':''}" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <ul>
      		<li><a href="${pageContext.request.contextPath}/admin/boardReader">게시글 조회</a></li>
      	</ul> 
      </div>
    </div>
  </div>
  
  
  

</div>