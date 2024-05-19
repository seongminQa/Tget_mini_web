<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/Tget_mini_web/resources/css/board.css">
<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- 사용자 정의 자바스크립트 -->
<script>
	$(function() {
		$('.tabcontent > div').hide();
		$('.tabnav a').click(function() {
			/* tabnav' 클래스의 자식인 'a' 요소에 클릭 이벤트 핸들러를 추가 */
			$('.tabcontent > div').hide().filter(this.hash).fadeIn();
			/* 'tabcontent' 클래스의 자식인 'div' 요소들을 숨기고,
			  클릭된 링크의 해시값을 기준으로 필터링한 다음 해당 'div' 
			  요소를 서서히 나타내는 애니메이션을 적용 */
			$('.tabnav a').removeClass('active');
			$(this).addClass('active');
			/* 'tabnav' 클래스의 자식인 'a' 요소들에서 'active' 클래스를 제거하고,
			  그 다음에는 클릭된 링크에 'active' 클래스를 추가 */
			return false;
			/* 클릭된 링크의 기본 동작을 중지합니다. 
			  여기서는 다른 페이지로 이동하는 것을 막고, 
			  탭 기능만 실행  */
		}).filter(':eq(0)').click();
		/* 페이지가 로드될 때 첫 번째 'a' 요소에 대한 클릭 이벤트를 즉시 발생
		eq->이퀄라이저 선택한 요소중에서 전달받은 인덱스에 해당하는 요소 선택
		   페이지가 로드될 때 첫 번째 탭이 활성화되고 해당 콘텐츠가 표시
		 */
	});
</script>



</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>

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
	<div id="search">
		<div id="board_search" class="col-4 mt-2">
			<div class="row d-flex mb-3"
				style="border: 2px solid #D95B96; border-radius: 50px; height: 45px;">
				<input class="col-10" type="text" placeholder="검색어를 입력해주세요."
					style="border: none; outline: none; background-color: transparent;" />
				<button class="col-1" type="button"
					style="border: none; background-color: transparent;">
					<img src="/Tget_mini_web/resources/image/project_image/search.svg"
						style="height: 30px;" />
				</button>
			</div>
		</div>

	</div>
	<div class="container">
		<div id="best_board_title">
			<strong>베스트글</strong>
		</div>
		<!-- 베스트 글 시작-->
		<div id="best_board" class="d-flex" style="background-color: #F2F2F2;">
			<c:forEach var="board" items="${bListHit}" begin="0" end="3">

				<!-- 게시글 이미지 -->

				<div id="board">
					<a href="board/detailBoard?bno=${board.bno}">
						<div>

							<c:if test="${not empty board.bimg}">
								<img id="board_img" src="board/attachDownload?bno=${board.bno}">
							</c:if>

							<c:if test="${empty board.bimg}">
								<img id="board_img"
									src="/Tget_mini_web/resources/image/board/no_img.png">
							</c:if>

						</div>
					</a>
					<!-- 게시글 타이틀, 작성자, 글-->
					<div id="board_2">
						<div id="board_text">
							<div id="board_title">${board.btitle}</div>
							<div id="board_profile" class="d-flex">
								<img id="profile_img"
									src="member/imgProfileDownload?mid=${board.mid}">
								<div id="user_id">
									<span class="ms-2">${board.mid}</span>
								</div>
							</div>
							<div id="board_content">${board.bcontent}</div>
						</div>
					</div>
				</div>
			</c:forEach>




		</div>
		<!-- 베스트 글 끝 -->
		<!-- 전체 글 리스트 -->
		<div class="tab" style="width: 100%; height: 100%">
			<div class="sticky_nav" style="z-index: 2">
				<ul class="tabnav">
					<li><a href="#tab01">자유게시판</a></li>
					<li><a href="#tab02">공지사항</a></li>
					<li><a href="#tab03">Q/A</a></li>
				</ul>
			</div>
			<div class="tabcontent" style="width: 100%; height: 100%">
				<div id="tab01">
					<section class="notice">
						<div id="board-list">
							<div class="container">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col" class="th-num">번호</th>
											<th scope="col" class="th-title">제목</th>
											<th scope="col" class="th-date">등록일</th>
											<th scope="col" class="th-date">날짜</th>
											<th scope="col" class="th-date">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${boardList}">
											<tr>
												<td>${board.bno}</td>
												<td><a href="board/detailBoard?bno=${board.bno}">${board.btitle}</a></td>
												<td>${board.mid}</td>
												<td><fmt:formatDate value="${board.bdate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${board.bhitcount}</td>
											</tr>
										</c:forEach>

									</tbody>
									<tr>
										<td colspan="10" class="text-center">
											<div>
												<a class="btn btn-outline-primary btn-sm"
													href="?pageNo=1#board-list">처음</a>
												<c:if test="${pagerDto.groupNo>1}">
													<a class="btn btn-outline-info btn-sm"
														href="?pageNo=${pagerDto.startPageNo-1}#board-list">이전</a>
												</c:if>

												<c:forEach var="i" begin="${pagerDto.startPageNo}"
													end="${pagerDto.endPageNo}">
													<c:if test="${pagerDto.pageNo != i}">
														<a class="btn btn-outline-success btn-sm"
															href="?pageNo=${i}#board-list">${i}</a>
													</c:if>
													<c:if test="${pagerDto.pageNo == i}">
														<a class="btn btn-danger btn-sm"
															href="?pageNo=${i}#board-list">${i}</a>
													</c:if>
												</c:forEach>
												<c:if test="${pagerDto.groupNo<pagerDto.totalGroupNo}">
													<a class="btn btn-outline-info btn-sm"
														href="?pageNo=${pagerDto.endPageNo+1}#board-list">다음</a>
												</c:if>
												<a class="btn btn-outline-primary btn-sm"
													href="?pageNo=${pagerDto.totalPageNo}#board-list">맨끝</a>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<button class="btn"
								onclick="location.href = '${pageContext.request.contextPath}/board/writeBoardForm'">글쓰기</button>
						</div>
					</section>
				</div>
				<div id="tab02">
					<section class="notice">
						<div id="board-list">
							<div class="container">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col" class="th-num">번호</th>
											<th scope="col" class="th-title">제목</th>
											<th scope="col" class="th-date">작성자</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3</td>
											<th><a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
												<p>테스트</p></th>
											<td>2017.07.13</td>
										</tr>

										<tr>
											<td>2</td>
											<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
											<td>2017.06.15</td>
										</tr>

										<tr>
											<td>1</td>
											<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
											<td>2017.06.15</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</section>
				</div>
				<div id="tab03">
					<section class="notice">
						<div id="board-list">
							<div class="container">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col" class="th-num">번호</th>
											<th scope="col" class="th-title">제목</th>
											<th scope="col" class="th-date">등록일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3</td>
											<th><a href="#!">[Q/A] 자주 묻는 질문</a>
												<p>테스트</p></th>
											<td>2017.07.13</td>
										</tr>

										<tr>
											<td>2</td>
											<th><a href="#!">[Q/A] 문의 사항</a></th>
											<td>2017.06.15</td>
										</tr>

										<tr>
											<td>1</td>
											<th><a href="#!">[Q/A] 결제 방침</a></th>
											<td>2017.06.15</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</section>
				</div>
			</div>
		</div>




	</div>

</body>
</html>