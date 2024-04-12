<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- home css -->
		<link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>
		
		<!-- 내부 css 적용 (테스트용) -->
	    <style>
	        * {
	            border: 1px solid red;
	        }
	
	        body {
	            border: 1px solid dark;
	        }
	    </style>
		
	</head>
	<body>

	    <header class="container d-flex justify-content-between align-items-center">
	        <!-- 로고 자리 -->
	        <div class="row ">
	            <img src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" alt="" style="width: 300px; height: 200px;">
	        </div>
	        <!-- 회원정보 자리 -->
	        <div class="row">
	            <ul class="list-group list-group-horizontal">
	                <li class="list-group-item">
	                    <a class="nav-link" href="#" style="color: black;">
	                        <img src="/Tget_mini_web/resources/image/project_image/login.svg" style="height: 20px; width: 15px;" />
	                        <span style="font-size: small; display: block;">로그인</span>
	                    </a>
	                </li>
	                <li class="list-group-item">
	                    <a class="nav-link" href="#" style="color: black;">
	                        <img src="/Tget_mini_web/resources/image/project_image/sign-up.svg" style="height: 20px; width: 15px;" />
	                        <span style="font-size: small; display: block;">회원 가입</span>
	                    </a>
	                </li>
	                <li class="list-group-item">
	                    <a class="nav-link" href="#" style="color: black;">
	                        <img src="/Tget_mini_web/resources/image/project_image/user.svg" style="height: 20px; width: 15px;" />
	                        <span style="font-size: small; display: block;">마이페이지</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </header>
	
	    <!-- 목록 컨테이너 -->
	    <div class="container">
	        <div class="row">
	            <div class="col">
	                찜 목록
	            </div>
	    
	            <div class="col">
	                현재 할인 중            
	            </div>
	    
	            <div class="col">
	                쿠폰 내역
	            </div>
	    
	            <div class="col">
	                지난 관람내역
	            </div>
	        </div>
	
	        <!-- 날짜 조회 -->
	        <div class="row">
	            <div class="col">
	                날짜 조회
	            </div>
	            <div class="col">
	                년도
	            </div>
	            <div class="col">
	                분기
	            </div>
	        </div>
	
	        <!-- 찜 목록 상세 -->
	        <div class="row">
	            <div class="card m-3" style="max-width: 90%;">
	                <!-- g : 그리드? 확인하기 -->
	                <div class="row align-items-center"> 
	                  <div class="col-4 d-flex justify-content-center mt-2 mb-2">
	                    <img src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/28/1709101716-39-3_wonbon_N_7_255x357_70_2.jpg" class="img-fluid rounded-start" alt="">
	                  </div>
	                  <div class="col-8">
	                    <div class="card-body">
	                      <h5 class="card-title"><b>내일은 내일에게</b></h5>
	                      <br>
	                      <p class="card-text">예매 번호</p>
	                      <p class="card-text">관람 일시</p>
	                      <p class="card-text">공연장소</p>
	                      <p class="card-text">매수</p>
	                      <p class="card-text">남은 자리</p>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            <!-- <img class="img-fluid rounded-start" src="" alt=""> -->
	        </div>
	
	        <div class="row">
	            <div class="card m-3" style="max-width: 90%;">
	                <!-- g : 그리드? 확인하기 -->
	                <div class="row align-items-center justify-content-center"> 
	                  <div class="col-4 d-flex justify-content-center mt-2 mb-2">
	                    <img src="https://timeticket.co.kr/wys2/file_attach_thumb/2021/05/21/1621550193-67-0_wonbon_N_7_255x357_70_2.jpg" class="img-fluid rounded-start" alt="">
	                  </div>
	                  <div class="col-8">
	                    <div class="card-body">
	                      <h5 class="card-title"><b>너의 목소리가 들려</b></h5>
	                      <br>
	                      <p class="card-text">예매 번호</p>
	                      <p class="card-text">관람 일시</p>
	                      <p class="card-text">공연장소</p>
	                      <p class="card-text">매수</p>
	                      <p class="card-text">남은 자리</p>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            <!-- <img class="img-fluid rounded-start" src="" alt=""> -->
	        </div>
	
	        <div class="row">
	            <div class="card m-3" style="max-width: 90%;">
	                <!-- g : 그리드? 확인하기 -->
	                <div class="row align-items-center justify-content-center"> 
	                  <div class="col-4 d-flex justify-content-center mt-2 mb-2">
	                    <img src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/08/1707371922-53-3_wonbon_N_7_255x357_70_2.jpg" class="img-fluid rounded-start" alt="">
	                  </div>
	                  <div class="col-8">
	                    <div class="card-body">
	                      <h5 class="card-title"><b>오백에 삽심</b></h5>
	                      <br>
	                      <p class="card-text">예매 번호</p>
	                      <p class="card-text">관람 일시</p>
	                      <p class="card-text">공연장소</p>
	                      <p class="card-text">매수</p>
	                      <p class="card-text">남은 자리</p>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            <!-- <img class="img-fluid rounded-start" src="" alt=""> -->
	        </div>
	
	    </div>
	
	
	
	
	
	
	
	
	
	    <!-- footer -->
	    <div class="d-flex justify-content-evenly mt-2 p-4"
	      style="border-top: 2px solid gray; background-color: lightgray;">
	      <div class="overflow-hidden">
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <!--회사 소개 및 링크 이동 -->
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          회사
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(3, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          지속능경영
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          IR
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          이용약관
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          채용정보
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          광고/제휴/출점문의
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          편성기준
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          개인정보처리방침
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          법적고지
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          이메일주소무수집거부
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          윤리경영
	        </a>
	
	        <a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);" href="#">
	          <!-- 이용약관 -->
	          <svg class="bi" aria-hidden="true">
	            <use xlink:href="#clipboard"></use>
	          </svg>
	          사이버감사실
	        </a>
	
	        <!-- 주소와 정보 등.. -->
	        <div style="text-align:center;">
	          <br>
	          <ul>
	            <li style="list-style:none;">(05717)서울 송파구 중대로 135 아이티벤처타워, 아이티벤처타워 12층(가락동 78)</li>
	            <!-- footer 및 이용약관 -->
	            <li style="list-style:none;">대표자: 8호선.</li>
	            <li style="list-style:none;">사업자는 아직 없습니다.</li>
	            <li style="list-style:none;">However, 총 깃아이디들을 올릴 것입니다.</li>
	            <li style="list-style:none;">© T-get. All Rights Reserved.</li>
	          </ul>
	        </div>
	
	      </div>
	    </div>

	</body>
</html>