<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="UTF-8">
		  <title>Insert title here</title>
		  <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		  <!-- Latest compiled and minified CSS -->
		  <link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">
		  <link rel="stylesheet" href="/Tget_mini_web/resources/css/item.css">
		 
		  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		  <!-- jQuery 외부 라이브러리 설정 -->
		  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		  <script>
			  $(function(){
				  
				  $('.tabnav a').click(function () { 
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
	  <header class="container" style="border-bottom: 5px solid #D95B96">
	    <div class="row align-items-center">
	      <div class="col d-flex justify-content-start">
	        <a class="navbar-brand" href="#"><img src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="height: 100px;" /></a>
	      </div>
	      <div class="col d-flex justify-content-end">
	        <ul class="nav ustify-content-center">
	          <li class="nav-item">
	            <a class="nav-link" href="#" style="color: black;">
	              <img src="/Tget_mini_web/resources/image/project_image/login.svg" style="height: 20px; width: 15px;" />
	              <span style="font-size: small; display: block;">로그인</span>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#" style="color: black;">
	              <img src="/Tget_mini_web/resources/image/project_image/sign-up.svg" style="height: 20px; width: 15px;" />
	              <span style="font-size: small; display: block;">회원 가입</span>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#" style="color: black;">
	              <img src="/Tget_mini_web/resources/image/project_image/user.svg" style="height: 20px; width: 15px;" />
	              <span style="font-size: small; display: block;">마이페이지</span>
	            </a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </header>
	    <!-- navar -->
  <nav class="container" style="border-bottom: 5px solid #D95B96; height: 60px;">
    <!-- 토글 어느정도 줄였을 때 사용할 것인가? -->
    <!-- 스크롤을 내렸을 때 처리해주기 -->
    <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
              <span class="navbar-toggler-icon"></span>
            </button> -->
    <div class="row d-flex align-items-start">
      <div class="row justify-content-between">
        <div class="col mt-2">
          <ul class="nav">
            <li class="nav-item">
              <a class="menu nav-link" style="color: grey;">연극</a>
            </li>
            <li class="nav-item">
              <a class="menu nav-link" style="color: grey;">뮤지컬</a>
            </li>
            <li class="nav-item">
              <a class="menu nav-link" style="color: grey;">콘서트</a>
            </li>
            <li class="nav-item">
              <a class="menu nav-link" style="color: grey;">공연장</a>
            </li>
            <li class="nav-item">
              <a class="menu nav-link" style="color: grey;">예매</a>
            </li>
          </ul>
        </div>
        <div class="col mt-2">
          <div class="d-flex">
            <input class="form-control" type="text" placeholder="Search" style="width:300px; margin-left: 300px">
            <button class="btn" style="background-color: #D95B96; color:white" type="button">Search</button>
          </div>
        </div>

      </div>
    </div>
  </nav>
  <div id="detail_container"class="container" style="heigth:100%;">
  	<div class="d-flex" style="height:100%;">
  	  <div style="flex:2;border:soild">

  	  		<h2>연극 &lt존경하는 엘레나 선생님&gt</h2>
			<div class="d-flex" style=" justify-content: space-between;">
	  	  	  <div><img src="/Tget_mini_web/resources/image/detail_photos/존경하는 선생님 엘레나.gif"/></div>
	  	  	  <div class="d-flex" style=" width:500px; align-items: center">
				<div style="height:300px; margin-right:30px;">
					 <p>장소</p>
					 <p>공연기간</p>
					 <p>공연시간</p>
					 <p>관람연령</p>
					 <p>가격</p>
					 <p>혜택</p>
				</div>
				<div style="height:300px;">
					 <p>상명 아트홀 1관</p>
					 <p>2024.06.01~2024.06.30</p>
					 <p>110분</p>
					 <p>중학생 이상 관람가</p>
					 <p>전체 가격보기</p>
					 <p>무이자 할부</p>			
				</div>  	  	  
	  	  	  </div>
	  	    </div>  	  	
  	  	
  	  	<div style="flex-2; height:100%" >
  	  		 <div class="tab" style="width:100%; height:100%">
  	  		 	<div class="sticky_nav"style="z-index:2">
  	  		 		<ul class="tabnav">
				      <li><a href="#tab01">공연정보</a></li>
				      <li><a href="#tab02">캐스팅정보</a></li>
				      <li><a href="#tab03">관람후기</a></li>
				      <li><a href="#tab04">판매정보</a></li>
				    </ul>
  	  		 	</div>
			    
			    <div class="tabcontent" style="width:100%; height:100%">
			      <div id="tab01" >
			      	<div>
			      		<h3>공연 시간 정보</h3>
					    <p>예매 가능한 시간: 관람 3시간 전까지 </p>
					    <p>화~금 오후 8시 / 토 오후 3시,7시 / 일 오후 2시,6시 / 월 공연없음 </p>
					    <p>*6/1(토) 오후 7시 (1회)</p>
					    <h3 class="my-5">공지사항</h3>
					    <img alt="" src="/Tget_mini_web/resources/image/detail_photos/공지사항.jpg">
					    <h3 class="my-5">할인정보</h3>
					    <img alt="" src="/Tget_mini_web/resources/image/detail_photos/할인정보.jpg">
					    <h3 class="my-5">공연상세</h3>
					    <img alt="" src="/Tget_mini_web/resources/image/detail_photos/공연상세.jpg">
			      	</div>
				  </div>
			      <div id="tab02" >
			      	<div class="d-flex" id="casting">
			      		<div id="profile">
			      			<div id="actor" >
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/엘레나_박현미.jpg">
				      		</div>
				      		<div id="name">
				      			<strong>엘레나</strong>
				      			<p style="color:#808080">박현미</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile" >
			      			<div id="actor">
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/엘레나_강정임.gif">
				      		</div>
				      		<div id="name">
				      			<strong>엘레나</strong>
				      			<p style="color:#808080">강정임</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile" >
			      			<div id="actor">
					      		<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/발로쟈_정대성.gif">
					      	</div>
				      		<div id="name">
				      			<strong>발로쟈</strong>
				      			<p style="color:#808080">정대성</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile" >
			      			<div id="actor">
					      		<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/발로쟈_이봉준.gif">
					      	</div>
				      		<div id="name">
				      			<strong>발로쟈</strong>
				      			<p style="color:#808080">이봉준</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile" >
			      			<div id="actor">
					      		<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/삐샤_서우진.gif">
					      	</div>
				      		<div id="name">
				      			<strong>빠샤</strong>
				      			<p style="color:#808080">서우진</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile" >
			      			<div id="actor">
					      		<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/삐샤_양보현.gif">
					      	</div>
				      		<div id="name">
				      			<strong>빠샤</strong>
				      			<p style="color:#808080">양보현</p>
				      		</div>
				      		
			      		</div>
			      	</div>
			      	<!-- 더보기 -->
					<div class="d-flex" id="casting">
				      	<div id="profile">
			      			<div id="actor" >
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/랄랴_오유민.gif">
				      		</div>
				      		<div id="name">
				      			<strong>랼랴</strong>
				      			<p style="color:#808080">오유민</p>
				      		</div>
			      		</div>
			      		<div id="profile">
			      			<div id="actor" >
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/랄랴_조은정.gif">
				      		</div>
				      		<div id="name">
				      			<strong>랼랴</strong>
				      			<p style="color:#808080">조은정</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile">
			      			<div id="actor" >
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/비쨔_장두환.gif">
				      		</div>
				      		<div id="name">
				      			<strong>비쨔</strong>
				      			<p style="color:#808080">장두환</p>
				      		</div>
				      		
			      		</div>
			      		<div id="profile">
			      			<div id="actor" >
				      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/비쨔_나준영.gif">
				      		</div>
				      		<div id="name">
				      			<strong>비쨔</strong>
				      			<p style="color:#808080">나준영</p>
				      		</div>

			      		</div>
			      	</div>				
				  </div>
			      <div id="tab03">
					  <div class="d-flex" style="justify-content: space-between;">
					  	<div class="d-flex" style="align-items: center;">
					  	  <div>총 4 개의 관람 후기가 등록 되었습니다.</div>
					  	</div>
					  	<div class= "d-flex">
					  		<div class="search">
						     <input id = "srch_inpt" type="text" placeholder="검색어 입력">
						     <img id = "srch_img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
							</div>
							<a id="srch_btn" class ="btn">관람후기 작성</a>
						</div>
					  </div>
				  	<hr/>
				  	<div class="d-flex flex-column" style="z-index:1">
							<div id="review_card" class="card" style="width:100%;">
							  <div class="card-body">
							    <h5 class="card-title">리뷰의 제목이 들어갈 곳입니다.</h5>
							    <h6 class="card-subtitle mb-2 text-body-secondary">작성자</h6>
							    <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
							  </div>
							</div>	
							<div id="review_card" class="card" style="width:100%;">
							  <div class="card-body">
							    <h5 class="card-title">리뷰의 제목이 들어갈 곳입니다.</h5>
							    <h6 class="card-subtitle mb-2 text-body-secondary">작성자</h6>
							    <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
							  </div>
							</div>	
							<div id="review_card" class="card" style="width:100%;">
							  <div class="card-body">
							    <h5 class="card-title">리뷰의 제목이 들어갈 곳입니다.</h5>
							    <h6 class="card-subtitle mb-2 text-body-secondary">작성자</h6>
							    <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
							  </div>
							</div>	
							<div id="review_card" class="card" style="width:100%;">
							  <div class="card-body">
							    <h5 class="card-title">리뷰의 제목이 들어갈 곳입니다.</h5>
							    <h6 class="card-subtitle mb-2 text-body-secondary">작성자</h6>
							    <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
							  </div>
							</div>		  		
				  	</div>
				  </div>
			      <div id="tab04">
			      	<div>
			      		<div style="margin-bottom:20px;">
			      			<h4><Strong>기획사 정보</Strong></h4>
			      			<div class="d-flex flex-column">
			      				<span class="mt-2">제작:컬쳐마인</span>
			      				<span class="mt-2">문의:1566-5588</span>
			      			</div>
			      		</div>
			      		<div>
			      			<img id="actor_img" alt="" src="/Tget_mini_web/resources/image/casting/상품관련정보.png">
			      		</div>
			      	</div>
			      </div>
			    </div>
			  </div><!--tab-->
  	  	</div>
  	  </div>
  	  <div id ="sticky_cal"style="flex:1; height:100%; ">
         	<div class="wrapper" style="height:100%; ">
			    <header>
			        <div class="cal_nav">
			          <p class="current-date" style="margin:auto">September 2024</p>
			        </div>
			      </header>
			      <div class="calendar">
			        <ul class="weeks">
			          <li>Sun</li>
			          <li>Mon</li>
			          <li>Tue</li>
			          <li>Wed</li>
			          <li>Thu</li>
			          <li>Fri</li>
			          <li>Sat</li>
			        </ul>
			        <ul class="days">
			          <li class="inactive">27</li>
			          <li class="inactive">28</li>
			          <li class="inactive">29</li>
			          <li class="inactive">30</li>
			          <li>1</li>
			          <li>2</li>
			          <li>3</li>
			          <li>4</li>
			          <li>5</li>
			          <li>6</li>
			          <li>7</li>
			          <li>8</li>
			          <li>9</li>
			          <li>10</li>
			          <li>11</li>
			          <li>12</li>
			          <li>13</li>
			          <li>14</li>
			          <li>15</li>
			          <li>16</li>
			          <li>17</li>
			          <li>18</li>
			          <li>19</li>
			          <li>20</li>
			          <li>21</li>
			          <li>22</li>
			          <li>23</li>
			          <li>24</li>
			          <li>25</li>
			          <li>26</li>
			          <li>27</li>
			          <li>28</li>
			          <li>29</li>
			          <li>30</li>
			          <li>31</li>
			        </ul>
			      </div>
			    </div>
	 		  </div>
  		</div>
      </div>
	</body>
</html>