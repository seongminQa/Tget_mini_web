<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">
<link rel="stylesheet" href="/Tget_mini_web/resources/css/item.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
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
<script defer="defer" type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		day = document.getElementById("today");
		day.value = today;
		day.min = today;
		/* day.max = ${productDto.pdateend}; */
	}
</script>
<script type="text/javascript">
	var name = $('#userid').val();
	if (name !== '') {
		$('#insertReviewbody').show();
	} else {
		$('#insertReviewbody').hide();
	}
</script>
<!-- <script>
	$(document).ready(
			function() {
				$('#reviewForm').on('submit', function(event) {
					event.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

					$.ajax({
						url : 'writeReview',
						type : 'POST',
						data : $(this).serialize(),
						success : function(response) {
							// 서버로부터 성공 응답을 받았을 때의 처리
							// 리뷰 목록을 업데이트합니다.
							loadReviews();
							$('#rcontent').val(''); // 텍스트 영역을 비웁니다.
						},
						error : function(jqXHR, textStatus, errorThrown) {
							// 오류가 발생했을 때의 처리
							console.log('Error:', textStatus, errorThrown);
						}
					});
				});
</script> -->

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>


	<div id="detail_container" class="container" style="heigth: 100%;">
		<div class="d-flex" style="height: 100%;">
			<div style="flex: 2; border: soild">

				<c:if test="">
				</c:if>

				<h2>${productDto.pkind}&lt${productDto.ptitle}&gt</h2>
				<div class="d-flex" style="justify-content: space-between;">
					<div>
						<img src="attachProduct?pno=${productDto.pno}" />
					</div>
					<div class="d-flex" style="width: 500px; align-items: center">
						<div style="height: 300px; margin-right: 30px;">
							<p>장소</p>
							<p>공연기간</p>
							<p>가격</p>
						</div>
						<div style="height: 300px;">
							<p>${productDto.pplace}</p>
							<p>
								<fmt:formatDate value="${productDto.pdatestart}"
									pattern="yyyy-MM-dd" />

								<fmt:formatDate value="${productDto.pdateend}"
									pattern="yyyy-MM-dd" />
							</p>
							<p>${productDto.pprice}</p>
						</div>
					</div>
				</div>

				<div style="height: 100%">
					<div class="tab" style="width: 100%; height: 100%">
						<div class="sticky_nav" style="z-index: 2">
							<ul class="tabnav">
								<li><a id="tab01" href="#tab01">공연정보</a></li>
								<li><a href="#tab02">관람후기</a></li>
								<li><a href="#tab03">판매정보</a></li>
							</ul>
						</div>

						<div class="tabcontent" style="width: 100%; height: 100%">
							<div id="tab01">
								<div id="tab01-01">
									<img style="width: 100%;"
										src="attachProductContent?pno=${productDto.pno}" />
								</div>
							</div>

							<div id="tab02">

								<hr />
								<!-- 리뷰 작성 -->
								<div class="card" id="comments">
									<div class="card-body">
										<div class="form-group">
											<form action="writeReview" method="post">
												<input type="hidden" name="pno" value="${productDto.pno}"
													readonly="readonly" />
												<textarea class="form-control" name="rcontent" id="rcontent"
													rows="3"></textarea>
												<button type="submit" class="btn btn-dark mt-2" id="reviewbtn">등록</button>
											</form>
										</div>
									</div>
								</div>
								<!-- 리뷰 작성 끝 -->
								<hr />
								<!-- 리뷰 목록 -->
								<div>
									<c:forEach var="review" items="${reviewList}">
										<div class="d-flex" style="justify-content: space-between;">
											<p>${review.rcontent}</p>
											<p>${review.mid}
										</div>
										<hr/>
									</c:forEach>
								</div>
								<!-- 리뷰 목록 끝-->
							</div>
							<div id="tab03">
								<div>
									<div style="margin-bottom: 20px;">
										<h4>
											<Strong>기획사 정보</Strong>
										</h4>
										<div class="d-flex flex-column">
											<span class="mt-2">제작:컬쳐마인</span> <span class="mt-2">문의:1566-5588</span>
										</div>
									</div>
									<div>
										<img id="actor_img" alt=""
											src="/Tget_mini_web/resources/image/casting/상품관련정보.png">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--tab-->
				</div>
			</div>
			<div id="sticky_cal" style="flex: 1; height: 100%;">
				<div id="smallinfo">
					<h5>${productDto.pkind}&lt${productDto.ptitle}&gt</h5>
					<div class="d-flex" style="justify-content: space-between;">
						<div>
							<img id="smallimg" src="attachProduct?pno=${productDto.pno}" />
						</div>
						<div class="d-flex" style="width: 300px; align-items: center;">
							<div class="mx-3">
								<p>장소</p>
								<p>공연기간</p>
								<p>가격</p>
							</div>
							<div>
								<p>${productDto.pplace}</p>
								<p>
									<fmt:formatDate value="${productDto.pdatestart}"
										pattern="yyyy-MM-dd" />

									<fmt:formatDate value="${productDto.pdateend}"
										pattern="yyyy-MM-dd" />
								</p>
								<p>${productDto.pprice}</p>
							</div>
						</div>
					</div>


				</div>

				<div class="wrapper" style="height: 100%;">
					<form action="addCartItem" method="post">
						<!-- form 태그에서 히든으로 넘기는것들  -->
						<input type="hidden" name="pno" value="${productDto.pno}"
							readonly="readonly" />
						<%-- <input type="hidden" name="pkind" value="${productDto.pkind}"/>
                  <input type="hidden" name="ptitle" value="${productDto.ptitle}"/>
                  <input type="hidden" name="pplace" value="${productDto.pplace}"/>
                  <input type="hidden" name="pprice" value="${productDto.pprice}"/>
                  <input type="hidden" name="pposter" value="${productDto.pposter}"/>
                  <input type="hidden" name="pgenre" value="${productDto.pgenre}"/> --%>


						<!-- 사용자가 시각적으로 볼수 있는 정보와 사용자 선택할수 있는 정보 -->
						<div>
							<input id="today" name="odate" type="date" />
						</div>

						<!-- pseatscnt 는 해당 상품의 남은 좌석 수로 실시간으로 변경됨. -->
						<div>
							<select id="seat" name="oseatgrade">
								<option value="일반석" selected="selected">일반석</option>
								<option value="로얄석">로얄석</option>
							</select>

						</div>
						<div>
							<input type="number" name="oamount" value="1" min="1"
								id="oamount" max="${productDto.pseatscnt}" />
						</div>
						<!-- max="<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd"/>" -->
						<!-- <a href="addCartItem" type="submit" class="btn btn-outline-secondary mt-2">주문</a> -->
						<button id="cartbtn" type="submit"
							class="btn btn-outline-secondary mt-2">장바구니</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	buildCalendar();
</script>
</html>