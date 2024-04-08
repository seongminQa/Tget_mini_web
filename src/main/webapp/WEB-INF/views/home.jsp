<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
  <!-- Latest compiled and minified CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

  <script>

  </script>

  <style>
    * {
      /* border : 1px solid blue; */
    }

    /* 화면 너비가 575px 이하일 때 네비게이션 바 스타일 변경 */
    @media (max-width: 575px) {
      .nava {
        background-color: #D95B96;
        /* 변경될 배경색 */
      }

      .menu {
        color: white;
      }
    }
  </style>

  <link rel="stylesheet" href="/Tget_mini_web/resources/css/home.css">
</head>

<body>

  <!-- header -->
  <!-- header -->
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
          </form>
        </div>

      </div>
    </div>

  </nav>


  <!-- Carousel -->
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active" style="background-color: black;">
        <div style="width: 70%; margin: 0 auto; ">
          <iframe width="100%" height="500"
            src="https://www.youtube.com/embed/qvbuBjtpuig?si=gOviFY-C7nn_2x5y?autoplay=1&mute=1"
            title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; encrypted-media; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
      </div>
    </div>
  </div>

  <div id="review-title">
    <h3><b>베스트 연극</b></h3>
  </div>

  <!-- 구분선 꾸미기 -->
  <div style="border-bottom: 2px solid #D95B96;"></div>

  <!-- Carousel Start -->
  <div id="card-carousel">
    <div class="container">
      <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <!--5개 카드  -->
            <div class="row row-cols-md-1  row-cols-lg-5 g-5">
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F24%2F24000651_p.gif&w=256&q=75"
                    class="card-img-top" alt="...">
                  <div id="card-body">
                    <h5>아트</h5>
                    <p>링크아트센터 벅스홀</p>
                    <p id="date">2024.02.13 ~ 2024.05.12</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23017766_p.gif&w=256&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>알앤제이</h5>
                    <p>동국대학교 이해랑예술극장</p>
                    <p>2024.02.07 ~ 2024.04.28</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2403%2F240319025722_24003302.gif&w=256&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>클로저</h5>
                    <p>플러스씨어터</p>
                    <p>2024.04.23 ~ 2024.07.14</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F24%2F24000251_p.gif&w=256&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>초선의원</h5>
                    <p>대학로 자유극장</p>
                    <p>2024.03.22 ~ 2024.05.12</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F24%2F24000709_p.gif&w=256&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>비클래스</h5>
                    <p>링크아트센터드림 드림2관</p>
                    <p>2024.02.20 ~ 2024.05.06</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item ">
            <!--5개 카드  -->
            <div class="row row-cols-md-1  row-cols-lg-5 g-5">
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2404%2F240408115010_24005215.gif&w=1920&q=75"
                    class="card-img-top" alt="...">
                  <div id="card-body">
                    <h5>고도를 기다리며</h5>
                    <p>국립극장 달오름극장</p>
                    <p id="date">2024.04.26 ~ 2024.05.05</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2404%2F240402033345_24004955.gif&w=1920&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>존경하는 엘레나 선생님</h5>
                    <p>상명아트홀1관</p>
                    <p>2024.06.01 ~ 2024.06.30</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2403%2F240306045305_L0000078.gif&w=1920&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>러브레터</h5>
                    <p>LG아트센터 서울 U+ 스테이지(자세히)</p>
                    <p>2024.04.04 ~ 2024.04.27</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2402%2F240205035456_21013096.gif&w=1920&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>옥탑방 고양이</h5>
                    <p>대학로 틴틴홀</p>
                    <p>2024.04.06 ~ Open run</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div id="card h-100">
                  <img
                    src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FPlay%2F2403%2F240329020847_24003189.gif&w=1920&q=75"
                    class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5>웃음의 대학</h5>
                    <p>세종문화회관 S씨어터(자세히)</p>
                    <p>2024.05.11 ~ 2024.06.09</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>
    <!-- Carousel End -->

    <!-- 카드 시작 -->
    <div id="review-title" style="margin-top: 150px;">
      <h3><b>베스트 관람후기</b></h3>
    </div>
    
    <!-- 구분선 꾸미기 -->
    <div style="border-bottom: 2px solid #D95B96; margin-bottom:60px;"></div>
    
    <div class="container">
      <div class="row row-cols-1 row-cols-md-1 row-cols-lg-2 g-4">
        <div class="col">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-4">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2021/05/21/1621557313-62-0_wonbon_N_7_255x357_70_2.jpg"
                  class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>오마이갓 너무 재밌어요</b></h5>
                  <br>
                  <p class="card-text">
                    캐스팅된 배우진들의 이름만 들어도 가슴이 설레이네요~
                    21세기 들어서 연극계의 최고의 캐스팅이 아닐까 생각되네요~
                    명배우들의 조화가 최고일 것 같아요!
                    제 생애 가장 감명깊게...
                  </p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-4">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/03/04/1709512591-10-3_wonbon_N_7_255x357_70_2.jpg"
                  class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>썸데이는 무슨</b></h5>
                  <br>
                  <p class="card-text">
                    네시즌째 보고있는데 이번시즌은 너무 재미가 없어요 그냥 재미가 없어요... 캐릭터들이 살아 있다는 느낌도 없고 연출은 이미 포기했고 배우별
                    디테일도 연출이 다 막아놔서 더 본다고 달라질것 같지도 않네요 배우가 무대에서 움직이는게 ...
                  </p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-4">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/12/14/1702544001-24-3_wonbon_N_7_255x357_70_2.jpg"
                  class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>인사이드 미 그만</b></h5>
                  <br>
                  <p class="card-text">
                    샨티 덕분에 공연내내 웃음포인트가 많았고, 연기 지켜보는것 만으로도 재미있었고
                    주인공 인별 너무 예쁘고 가창력이 너무 좋았습니다.
                    일상에서 흔히 볼수 있는 연인들의 모습인데 연출을 맛깔스럽게...
                  </p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-4">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2022/02/21/1645407531-84-0_wonbon_N_7_255x357_70_2.jpg"
                  class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>이젠 도둑도 늙네요</b> </h5>
                  <br>
                  <p class="card-text">
                    최근에 별로 웃을 일이 없었는데, 두 시간 내내 폭풍처럼 휘몰아치는 배우들의 미친 연기와 애드립에 영혼이 탈탈 털렸습니다. 같이 간 가족들도 너무
                    웃어서 몸이 힘들다네요. 카타르시스는 비극을 통해서만 이루어지는게...  
                  </p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-------------- 관람후기 --------------------->


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
        <div style="text-align:center" ;>
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