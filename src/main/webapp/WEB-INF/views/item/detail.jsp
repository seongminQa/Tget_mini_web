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
	//데이터 전송 객체 생성!
	var comment = {
		// 이벤트 등록
		init : function() {
			var _this = this;
			// 생성 버튼 클릭 시!
			const createBtn = document.querySelector('#comment-create-btn');
			// 이벤트 감시 시, 수행할 메소드 연결!
			createBtn.addEventListener('click', function() {
				_this.create();
			});
		},
		// 댓글 등록
		create : function() {
			// 데이터
			var data = {
				author : document.querySelector('#comment-author').value,
				content : document.querySelector('#comment-content').value,
			};
			// url에서 article의 id를 추출!
			var split = location.pathname.split('/');
			var articleId = split[split.length - 1];
			// Ajax 통신
			// - https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
			// - https://t.ly/Vrrz
			fetch('/api/comments/' + articleId, { // 요청을 보냄
				method : 'POST',
				body : JSON.stringify(data),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(function(response) { // 응답 처리
				if (response.ok) { // 성공
					alert('댓글이 등록되었습니다.');
					window.location.reload();
				} else { // 실패
					alert('댓글 등록 실패..!');
				}
			});
		}
	};
	// 객체 초기화!
	comment.init();
</script>
</head>
<body>
	<header class="container" style="border-bottom: 5px solid #D95B96">
		<div class="row align-items-center">
			<div class="col d-flex justify-content-start">
				<a class="navbar-brand" href="#"><img
					src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg"
					style="height: 100px;" /></a>
			</div>
			<div class="col d-flex justify-content-end">
				<ul class="nav ustify-content-center">
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: black;"> <img
							src="/Tget_mini_web/resources/image/project_image/login.svg"
							style="height: 20px; width: 15px;" /> <span
							style="font-size: small; display: block;">로그인</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: black;"> <img
							src="/Tget_mini_web/resources/image/project_image/sign-up.svg"
							style="height: 20px; width: 15px;" /> <span
							style="font-size: small; display: block;">회원 가입</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: black;"> <img
							src="/Tget_mini_web/resources/image/project_image/user.svg"
							style="height: 20px; width: 15px;" /> <span
							style="font-size: small; display: block;">마이페이지</span>
					</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- navar -->
	<nav class="container"
		style="border-bottom: 5px solid #D95B96; height: 60px;">
		<!-- 토글 어느정도 줄였을 때 사용할 것인가? -->
		<!-- 스크롤을 내렸을 때 처리해주기 -->
		<!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
              <span class="navbar-toggler-icon"></span>
            </button> -->
		<div class="row d-flex align-items-start">
			<div class="row justify-content-between">
				<div class="col mt-2">
					<ul class="nav">
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;">연극</a></li>
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;">뮤지컬</a></li>
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;">콘서트</a></li>
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;">공연장</a></li>
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;">예매</a></li>
						<li class="nav-item"><a class="menu nav-link"
							style="color: grey;"></a></li>
					</ul>
				</div>
				<div class="col mt-2">
					<div class="d-flex">
						<input class="form-control" type="text" placeholder="Search"
							style="width: 300px; margin-left: 300px">
						<button class="btn"
							style="background-color: #D95B96; color: white" type="button">Search</button>
					</div>
				</div>

			</div>
		</div>
	</nav>


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
							<p>producDto : ${productDto.pplace}</p>
							<p>
								<fmt:formatDate value="${productDto.pdatestart}"
									pattern="yyyy-MM-dd" />
								producDto ~
								<fmt:formatDate value="${productDto.pdateend}"
									pattern="yyyy-MM-dd" />
							</p>
							<p>producDto : ${productDto.pprice}</p>
						</div>
					</div>
				</div>

				<div style="height: 100%">
					<div class="tab" style="width: 100%; height: 100%">
						<div class="sticky_nav" style="z-index: 2">
							<ul class="tabnav">
								<li><a href="#tab01">공연정보</a></li>
								<li><a href="#tab02">캐스팅정보</a></li>
								<li><a href="#tab03">관람후기</a></li>
								<li><a href="#tab04">판매정보</a></li>
							</ul>
						</div>

						<div class="tabcontent" style="width: 100%; height: 100%">
							<div id="tab01">
								<div>
									<h3>공연 시간 정보</h3>
									<p>예매 가능한 시간: 관람 3시간 전까지</p>
									<p>화~금 오후 8시 / 토 오후 3시,7시 / 일 오후 2시,6시 / 월 공연없음</p>
									<p>*6/1(토) 오후 7시 (1회)</p>
									<h3 class="my-5">공지사항</h3>
									<img alt=""
										src="/Tget_mini_web/resources/image/detail_photos/공지사항.jpg">
									<h3 class="my-5">할인정보</h3>
									<img alt=""
										src="/Tget_mini_web/resources/image/detail_photos/할인정보.jpg">
									<h3 class="my-5">공연상세</h3>
									<img alt=""
										src="/Tget_mini_web/resources/image/detail_photos/공연상세.jpg">
								</div>
							</div>
							<div id="tab02">
								<div class="d-flex" id="casting">
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/엘레나_박현미.jpg">
										</div>
										<div id="name">
											<strong>엘레나</strong>
											<p style="color: #808080">박현미</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/엘레나_강정임.gif">
										</div>
										<div id="name">
											<strong>엘레나</strong>
											<p style="color: #808080">강정임</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/발로쟈_정대성.gif">
										</div>
										<div id="name">
											<strong>발로쟈</strong>
											<p style="color: #808080">정대성</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/발로쟈_이봉준.gif">
										</div>
										<div id="name">
											<strong>발로쟈</strong>
											<p style="color: #808080">이봉준</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/삐샤_서우진.gif">
										</div>
										<div id="name">
											<strong>빠샤</strong>
											<p style="color: #808080">서우진</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/삐샤_양보현.gif">
										</div>
										<div id="name">
											<strong>빠샤</strong>
											<p style="color: #808080">양보현</p>
										</div>

									</div>
								</div>
								<!-- 더보기 -->
								<div class="d-flex" id="casting">
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/랄랴_오유민.gif">
										</div>
										<div id="name">
											<strong>랼랴</strong>
											<p style="color: #808080">오유민</p>
										</div>
									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/랄랴_조은정.gif">
										</div>
										<div id="name">
											<strong>랼랴</strong>
											<p style="color: #808080">조은정</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/비쨔_장두환.gif">
										</div>
										<div id="name">
											<strong>비쨔</strong>
											<p style="color: #808080">장두환</p>
										</div>

									</div>
									<div id="profile">
										<div id="actor">
											<img id="actor_img" alt=""
												src="/Tget_mini_web/resources/image/casting/비쨔_나준영.gif">
										</div>
										<div id="name">
											<strong>비쨔</strong>
											<p style="color: #808080">나준영</p>
										</div>

									</div>
								</div>
							</div>
							<div id="tab03">
								<div class="d-flex" style="justify-content: space-between;">
									<div class="d-flex" style="align-items: center;">
										<div>총 4 개의 관람 후기가 등록 되었습니다.</div>
									</div>
									<div class="d-flex">
										<div class="search"></div>
										<a id="srch_btn" class="btn"
											href="${pageContext.request.contextPath}/item/writeReviewForm">관람후기
											작성</a>
									</div>
								</div>
								<hr />
								<!-- 리뷰 작성 -->
								<div class="card" id="comments">
									<div class="card-body">
										<form>
											<div class="form-group">
												<label>댓글 작성</label>
												<textarea class="form-control" id="comment-content" rows="3"></textarea>
											</div>
											<input type="hidden" id="comment-author" value="익명">
											<button type="button" class="btn btn-primary"
												id="comment-create-btn">등록</button>
										</form>
									</div>
								</div>
								<!-- 리뷰 작성 끝 -->
							</div>
							<div id="tab04">
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
				<div class="wrapper" style="height: 100%;">
					주문하기
					<form action="addCartItem">
						<!-- form 태그에서 히든으로 넘기는것들  -->
						<input type="hidden" name="pno" value="${productDto.pno}"/>
						<input type="hidden" name="pkind" value="${productDto.pkind}"/>
						<input type="hidden" name="ptitle" value="${productDto.ptitle}"/>
						<input type="hidden" name="pplace" value="${productDto.pplace}"/>
						<input type="hidden" name="pprice" value="${productDto.pprice}"/>
						<input type="hidden" name="pposter" value="${productDto.pposter}"/>
						<input type="hidden" name="pgenre" value="${productDto.pgenre}"/>
						
						
						<!-- 사용자가 시각적으로 볼수 있는 정보와 사용자 선택할수 있는 정보 -->
						
						<input id="today" name="poderdate" type="date"/>
						<!-- pseatscnt 는 해당 상품의 남은 좌석 수로 실시간으로 변경됨. -->
		                <select class="form-control" id="" name="pseatgrade">
		                	<option value="일반석" selected="selected">일반석</option>
		              		<option value="로얄석">로얄석</option>
		                </select>
						<input type="number" name="pamount" value="1" min="1" max="${productDto.pseatscnt}"/>
						
						<!-- max="<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd"/>" -->
						
						 <button type="submit" class="btn btn-outline-secondary mt-2">주문</button>
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