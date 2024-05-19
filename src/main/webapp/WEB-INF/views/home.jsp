<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script>
	
</script>


<link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- header -->
	<header class="container">

		<%-- <div class="">
         <div class="d-flex justify-content-end">
            
            <ul class="nav justify-content-center">
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/member/login"
                  style="color: black;"> <span
                     style="font-size: small; display: block;">로그인</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/member/sign_up"
                  style="color: black;"> <span
                     style="font-size: small; display: block;">회원 가입</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/member/memberInfoModify"
                  style="color: black;"> <span
                     style="font-size: small; display: block;">마이페이지</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/shopping/cart"
                  style="color: black;"> <span
                     style="font-size: small; display: block;">장바구니</span>
               </a></li>
            </ul>

         </div>

         <div class="d-flex justify-content-start">
            <a class="navbar-brand" href="${pageContext.request.contextPath}"><img
               src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg"
               style="height: 100px;" /></a>
         </div>


      </div> --%>

	</header>


	<!-- navar -->


	<div id="carouselExampleFade" class="carousel slide"
		data-bs-ride="carousel" style="border: solid">
		<div class="carousel-inner" style="border: solid">
			<div class="carousel-item active">
				<img id="crs_01"
					src="/Tget_mini_web/resources/image/MainCarouselimg/BigBanner_pc_24-워터밤.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="/Tget_mini_web/resources/image/MainCarouselimg/BigBanner_pc_박창근.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="/Tget_mini_web/resources/image/MainCarouselimg/BigBanner_pc_시카고.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="/Tget_mini_web/resources/image/MainCarouselimg/BigBanner_pc_아람로열클래식.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="/Tget_mini_web/resources/image/MainCarouselimg/BigBanner_pc_타카하타.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>

	</div>
	<!-- 구분선 꾸미기 -->
	<!-- <div style="border-bottom: 2px solid #D95B96;"></div> -->
	<!-- Carousel Start -->
	<div id="card-carousel">
		<div class="container" id="review-title">
			<h3>
				<b>베스트 연극</b>
			</h3>
		</div>
		<div class="container">
			<div id="carouselExampleInterval" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<!--5개 카드  -->
						<div class="row row-cols-md-1  row-cols-lg-5 g-5">
							<c:forEach var="product" items="${productList}" begin="0" end="4">
								<div>
									<a
										href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}"><img
										id="poster_img" alt=""
										src="product/attachProduct?pno=${product.pno}"></a>

									<div id="right_info">
										<h5>${product.ptitle}</h5>
										<p>${product.pplace}</p>
										<p>
											<fmt:formatDate value="${product.pdatestart}"
												pattern="yyyy-MM-dd" />
											~
											<fmt:formatDate value="${product.pdateend}"
												pattern="yyyy-MM-dd" />
										</p>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="carousel-item ">
						<!--5개 카드  -->
						<div class="row row-cols-md-1  row-cols-lg-5 g-5">
							<c:forEach var="product" items="${productList}" begin="0" end="4">
								<div>
									<a
										href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}"><img
										id="poster_img" alt=""
										src="product/attachProduct?pno=${product.pno}"></a>

									<div id="right_info">
										<h5>${product.ptitle}</h5>
										<p>${product.pplace}</p>
										<p>
											<fmt:formatDate value="${product.pdatestart}"
												pattern="yyyy-MM-dd" />
											~
											<fmt:formatDate value="${product.pdateend}"
												pattern="yyyy-MM-dd" />
										</p>
									</div>

								</div>

							</c:forEach>






						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleInterval" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->
	<!-- 연극 or 뮤지컬 티저영상 시작-->
	<div class="d-flex"
		style="height: 500px; background-color: #F6F6F6; margin-top: 150px; margin-bottom: 150px;">
		<div id="video_box" class="container d-flex">
			<div id="video_text_box" style="flex: 1">
				<div id="ticket_spot">Ticket Spot</div>
				<div id="content_title">2024 뮤지컬 시카고</div>
				<div id="video_btn_box" class="d-flex">
					<div class="d-flex" id="video_btn">
						<i class="bi bi-chevron-left"></i>
					</div>
					<div class="d-flex" id="video_btn">
						<i class="bi bi-chevron-right"></i>
					</div>
				</div>
			</div>
			<div style="flex: 1">
				<iframe id="teaser" width="750" height="370"
					src="https://www.youtube.com/embed/36hshluncms?si=hdggGK2elEh1VqpM"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			</div>
		</div>

	</div>
	<!-- 연극 or 뮤지컬 티저영상 끝-->
	<!-- 추천? ...제목모름  이주의 공연·전시-->
	<div class="container d-flex ">
		<div id="left_content" style="flex: 1;">
			<div id="left_img" class="d-flex">
				<c:forEach var="product" items="${productList}" end="0">
					<a
						href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}"
						style="margin: auto;"> <img id="left_img_inner" alt=""
						src="product/attachProduct?pno=${product.pno}"
						style="width: 400px;">
					</a>
					<div style="text-align: center; margin-top: 10px;">
						<h5>${product.ptitle}</h5>
						<p>${product.pplace}</p>
						<p>
							<fmt:formatDate value="${product.pdatestart}"
								pattern="yyyy-MM-dd" />
							~
							<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd" />
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="d-flex" style="flex: 1;">
			<div id="right_contents">
				<c:forEach var="product" items="${productList}" begin="1" end="4">
					<div>
						<a
							href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}"><img
							id="right_img" alt=""
							src="product/attachProduct?pno=${product.pno}"></a>

						<div id="right_info">
							<h5>${product.ptitle}</h5>
							<p>${product.pplace}</p>
							<p>
								<fmt:formatDate value="${product.pdatestart}"
									pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd" />
							</p>
						</div>

					</div>

				</c:forEach>


			</div>
			<div id="right_contents">
				<c:forEach var="product" items="${productList}" begin="5" end="8">
					<div>
						<a
							href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}"><img
							id="right_img" alt=""
							src="product/attachProduct?pno=${product.pno}"></a>
						<div id="right_info">
							<h5>${product.ptitle}</h5>
							<p>${product.pplace}</p>
							<p>
								<fmt:formatDate value="${product.pdatestart}"
									pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd" />
							</p>
						</div>

					</div>

				</c:forEach>
			</div>

		</div>


	</div>
	<!-- 베스트 관람 후기  -->
	<div class="container">
		<div id="review-title" style="margin-top: 150px;">
			<h3>
				<b><a href="${pageContext.request.contextPath}/board">게시판 </a></b>
			</h3>

		</div>
		<div class="row row-cols-1 row-cols-md-1 row-cols-lg-2 g-4">
			<c:forEach var="board" items="${boardList}" begin="0" end="3">
				<div class="col">
					<a href="board/detailBoard?bno=${board.bno}">
						<div class="card mb-3">
							<div class="row g-0">
								<div class="col-md-4">
									<c:if test="${not empty board.bimgoname}">
										<img id="review_img"
											src="board/attachDownload?bno=${board.bno}"
											class="img-fluid rounded-start" alt="...">
									</c:if>
									<c:if test="${empty board.bimgoname}">
										<img id="review_img"
											src="/Tget_mini_web/resources/image/board/no_img2.png"
											class="img-fluid rounded-start" alt="...">
									</c:if>

								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">
											<b>${board.btitle}</b>
										</h5>
										<br>
										<p class="card-text">${board.bcontent}</p>
										<p class="card-text">
											<small class="text-muted"><fmt:formatDate
													value="${board.bdate}" pattern="yyyy-MM-dd" /></small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-------------- 관람후기 --------------------->


	<!-- footer -->
	<div class="d-flex justify-content-evenly mt-2 p-4"
		style="border-top: 2px solid gray; background-color: lightgray;">
		<div class="overflow-hidden">
			<a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <!--회사 소개 및 링크 이동 --> <svg class="bi"
					aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 회사
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(3, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 지속가능경영
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> IR
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 이용약관
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 채용정보
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 광고/제휴/출점문의
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 편성기준
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 개인정보처리방침
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 법적고지
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 이메일주소무수집거부
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 윤리경영
			</a> <a class="icon-link icon-link-hover"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="#"> <!-- 이용약관 --> <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg> 사이버감사실
			</a>
			<div style="text-align: center;">
				<br>
				<ul>
					<li style="list-style: none;">(05717)서울 송파구 중대로 135 아이티벤처타워,
						아이티벤처타워 12층(가락동 78)</li>
					<!-- footer 및 이용약관 -->
					<li style="list-style: none;">대표자: 8호선.</li>
					<li style="list-style: none;">사업자는 아직 없습니다.</li>
					<li style="list-style: none;">However, 총 깃아이디들을 올릴 것입니다.</li>
					<li style="list-style: none;">© T-get. All Rights Reserved.</li>
				</ul>
			</div>

		</div>
	</div>


</body>

</html>