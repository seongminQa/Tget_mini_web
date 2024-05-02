<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="" />

<!-- 사용자 정의 자바스크립트 -->
<script></script>

<!-- 내부 css 적용 (테스트용) -->
<style>
input { /* input 태그가 가진 기본적인 설정들을 지움 */
	outline: none;
	border: none;
	color: gray;
}

.div_form {
	width: 80%; /* 창 크기가 변경되어도 비율을 유지 */
	height: 50px;
	border-bottom: 3px solid black;
	margin-top: 20px;
	white-space: nowrap; /* 창 크기가 변경되어도 줄바꿈을 하지 않는다. */
}

.div_form_checkbox, .submit_btn {
	width: 40%;
	height: 60px;
}

.span_radio {
	display: inline;
	margin-top: 15px;
}

header, form {
	min-width: 822px; /* 최소 창 가로폭 지정(더 줄어들면 아래에 스크롤바가 생김) */
}
</style>
</head>
<body>
	<div class="container d-flex flex-column">
		<!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-md-3">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>
				</div>

				<div class="col-md-9">
					<!-- #################################### -->
					<div class="card">
						<div class="card-header">관리자 페이지</div>
						<div class="card-body">

							<div class="content" style="background-color: white; width: 100%">
								<div class="row justify-content-center">
									<div class="pt-3 pb-3 row align-items-stretch">

										<div class="col ps-5 pe-5"
											style="background-color: white; border-radius: 10px;">
											<h5 class="ps-2 pt-5">
												<strong>회원 정보 수정</strong>
											</h5>
											<hr style="border-top: 4px solid black" />
											
											
											<form method="post"
												class="row d-flex flex-column align-items-center ps-3 pe-3 pb-3">
												<div class="div_form row">
													<div class="col-3">
														<strong>아이디</strong>
													</div>
													<div class="col-8">kosa123123</div>
												</div>
												<div class="div_form row">
													<div class="col-3">
														<strong>비밀번호</strong>
													</div>
													<div class="col-7"></div>
													<div class="col-2">
														<button type="button" class="btn"
															style="background-color: #d95b96; color: white"
															onclick="pwModify()">수정</button>
													</div>
												</div>

												<div class="div_form row">
													<div class="col-3">
														<strong>이름</strong>
													</div>
													<div class="col-8">김연뮤</div>
												</div>
												<div class="div_form row">
													<div class="col-3">
														<strong>닉네임</strong>
													</div>
													<div class="col-7">연뮤덕</div>
													<div class="col-2">
														<button type="button" class="btn"
															style="background-color: #d95b96; color: white"
															onclick="nickModify()">수정</button>
													</div>
												</div>
												<div class="div_form row">
													<div class="col-3">
														<strong>이메일</strong>
													</div>
													<div class="col-7">ko*****123@na***.com</div>
													<div class="col-2">
														<button type="button" class="btn"
															style="background-color: #d95b96; color: white"
															onclick="emailModify()">수정</button>
													</div>
												</div>

												<div class="div_form row">
													<div class="col-3">
														<strong>주소</strong>
													</div>
													<div class="col-7">대학로 유니 플렉스</div>
													<div class="col-2">
														<button type="button" class="btn"
															style="background-color: #d95b96; color: white"
															onclick="addressModify()">수정</button>
													</div>
												</div>

												<div class="div_form row" style="margin-bottom: 15px">
													<div class="col-3">
														<strong>전화번호</strong>
													</div>
													<div class="col-7">010-****-2222</div>
													<div class="col-2">
														<button type="button" class="btn"
															style="background-color: #d95b96; color: white"
															onclick="phoneModify()">수정</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
					<!-- #################################### -->
				</div>

			</div>
		</div>
	</div>

</body>
</html>