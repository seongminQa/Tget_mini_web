<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- 사용자 정의 자바스크립트 -->
    <script>

    </script>
    <style>
    	.container {
    		display: grid;
    		
    	}
    	
      	a {
	        color: #242428;
	        text-decoration: none;
	      }
	
		ol, ul {
		  list-style: none;
		}
		
		product_title {
			font-size: 22px;
		}
    </style>
  </head>

  <body>
    <!-- header(헤더) -->
    <%@include file="/WEB-INF/views/common/header.jsp"%>
    <!-- 상품 리스트 컨테이너 -->
	<div class="container">
    	<!-- 연극 / 뮤지컬  장르 선택 -->
    	<!-- <div class="grid d-flex justify-content-between align-items-center">
		    <div class="g-col-4 p-3 ms-5">
		      <h3>공연</h3>
		    </div>
		    <div class="g-col-8 p-3 me-5">
		      <button onclick="" type="button" class="btn btn-outline-secondary">연극</button>    		
	    	  <button onclick="" type="button" class="btn btn-outline-secondary">뮤지컬</button>
		    </div>
		</div> -->

      <!-- 캐러셀 섹션 -->
      <section class="rankCarousel m-3 pb-3 text-bg-light text-center" style="border-radius: 20px;">
        <div class="grid d-flex justify-content-between align-items-center">
          <div class="g-col-8 p-3">
            <h3>랭킹</h3>
          </div>
          <div class="g-col-4 p-3">
            <a href="">전체보기</a>
          </div>
        </div>
        <ul class="d-flex justify-content-end">
          <li class="me-4">
            <a href="#">일간</a>
          </li>
          <li class="me-4">
            <a href="#">주간</a>
          </li>
          <li class="me-4">
            <a href="#">월간</a>
          </li>
          <li class="me-4">
            <a href="#">연간</a>
          </li>
        </ul>
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner d-block w-100">
            <!-- 캐러셀 div 반복작업 필요** -->
            <!-- 이미지 해당 div 중앙은 text-center을 이용 -->
            <div class="carousel-item active " data-bs-interval="10000">
              <!-- 캐러셀 이미지 크기 18%*247 -->
              <img src="/Tget_mini_web/resources/image/product_image/image1.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image2.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image3.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image4.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image5.jpg" style="width: 18%; height: 247;">
            </div>
            <div class="carousel-item">
              <img src="/Tget_mini_web/resources/image/product_image/image6.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image7.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image8.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image10.jpg" style="width: 18%; height: 247;">
              <img src="/Tget_mini_web/resources/image/product_image/image11.jpg" style="width: 18%; height: 247;">
            </div>
            <!-- 버튼 모양 변경 가능?** -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
      </section>
      <!-- 상품 리스트 시작 -->
      <!-- 상품 리스트 이미지 크기 257*318 -->
      <!-- ul 리스트로 구현해보기 -->
      <section class="productList_section">
        <div class="grid d-flex justify-content-between align-items-center">
		    <div class="g-col-4 p-3 ms-5">
		      <h3>연극</h3>
		    </div>
		    <div class="g-col-8 p-3 me-5">
		      <button onclick="" type="button" class="btn btn-outline-secondary">인기순</button>    		
	    	  <button onclick="" type="button" class="btn btn-outline-secondary">별점순</button>
	          <button onclick="" type="button" class="btn btn-outline-secondary">최저가순</button>    		
	    	  <button onclick="" type="button" class="btn btn-outline-secondary">최고가순</button>
		    </div>
		</div>
		<hr/>
        <div class="product_grid">
          <ul class="product_grid_list">
            <!-- 상품 리스트 있는 만큼 반복 -->
            <c:forEach var="product" items="${productList}">
              <li class="product_grid_item m-3" style="display: inline-block">
                <div class="product_grid_unit">
                  <!-- 해당 상품 클릭시 상품 상세페이지로 전환 -->
                  <a href="detail?pno=${product.pno}" class="product_link">
                    <div class="product_imgbox">
                      <img src="${product.pimg}" alt="" class="product_img">
                    </div>
                    <div class="product_info">
                      <span class="product_region"></span>
                      <span class="product_title"><b>${product.ptitle}</b></span>
                      <div class="product_sideinfo">
                        <span class="product_place">
                          ${product.pplace}
                        </span>
                        <br>
                        <span class="period">기간 ${product.pperiod} ~ 2024.4.24</span>
                        <br>
                        <span class="price">가격: ${product.pprice}</span>
                      </div>
                      <!-- 상품 플래그가 필요할까? -->
                      <div class="product_flag">
                        <div class="flag_area"></div>
                      </div>
                    </div>
                  </a>
                </div>
              </li>
            </c:forEach>
          </ul>
        </div>
      </section>
    </div>
    <!-- footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
  </body>

</html>