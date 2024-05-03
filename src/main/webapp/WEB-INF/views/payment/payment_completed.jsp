<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>결제 완료</title>
    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- font -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
    <!-- <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'> -->
    <script>
     
    </script>

    <style>
       *{
         font-family: 'NanumSquare', sans-serif 
        /* font-family: 'Spoqa Han Sans Neo', 'sans-serif'; */
        }

        tr{
            
            border-bottom: 2px solid #d95b96;
        }

        td {
          padding-top: 10px;
        }

        .tTop{
          border-top: 5px solid #d95b96;
        }

      header,
      .content,
      .tget_footer {
        min-width: 500px; /* 최소 창 가로폭 지정(더 줄어들면 아래에 스크롤바가 생김) */
      }

      .tableHead{
        background-color: #fdc0dc;
        text-align: center;
      }

      .


      /* 나중에 수정하기 */
    </style>

    <link rel="stylesheet" href="/resources/css/home.css" />
  </head>

  <body>
    <!-- header -->
    <header
      class="container"
      style="border-bottom: 5px solid #d95b96; background-color: white"
    >
      <div class="row align-items-center">
        <div class="col d-flex justify-content-start">
          <!-- <a class="navbar-brand" href="#"><img src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="height: 100px;" /></a> -->
          <a class="navbar-brand" href="${pageContext.request.contextPath}"
            ><img
              src="${pageContext.request.contextPath}/resources/image/project_image/t_get_logo.svg"
              style="height: 100px"
          /></a>
        </div>

        <div class="col d-flex justify-content-end">
          <ul class="nav ustify-content-center">
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/member/login"
                style="color: black"
              >
                <span style="font-size: small; display: block">로그인</span>
              </a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/member/sign_up"
                style="color: black"
              >
                <span style="font-size: small; display: block">회원 가입</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: black">
                <span style="font-size: small; display: block">마이페이지</span>
              </a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/member/shoppingcart"
                style="color: black"
              >
                <span style="font-size: small; display: block">장바구니</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <!-- context -->
    <div class="container">
    <div class="row">
            <div class="col pt-5 pb-5" style="text-align: center;">
                <img class="pt-5" src="${pageContext.request.contextPath}/resources/image/project_image/buy_check.svg" style="width:10%;" >
                <h4 class="pt-5"><strong>결제가 완료되었습니다.</strong></h4>
                <p class="col pb-5">즐거운 관람 되시길 바랍니다.</p>
            </div>
        </div>
        <div>
          <div>
            <span><strong>결제 요약 정보</strong></span>
          </div>
            <table style="width: 100%; margin-bottom: 100px;">
                <tbody >
                    <tr class="tTop row">
                        <td class="tableHead col-2" ><br>결제 정보</td>
                        <td class="col-10 pb-2"><strong>신용카드</strong></br>삼성카드</br>결제 금액: 92,000원</td>
                    </tr>
                    <tr class="row">
                        <td class="tableHead col-2" >예매 번호</td>
                        <td class="col-10 pb-2">db에서 가져오는 번호</td>
                    </tr>
                    <tr class="row">
                        <td class="tableHead col-2" >결제 일자</td>
                        <td class="col-10 pb-2">db에서 가져오는 날짜 or sysdate</td>
                    </tr>
                    <tr class="row">
                        <td class="tableHead col-2" ><br>예매 공연</td>
                        <td class="col-10 pb-2">공연 명: 존경하는 엘레나 선생님</br>공연장 이름: 디큐브 링크아트홀</br>공연 정보(날짜,시간, 좌석등급): 2024.05.17 20:00 R석</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


    <!-- footer -->
    <div
      class="tget_footer d-flex justify-content-evenly mt-2 p-4"
      style="border-top: 2px solid gray; background-color: lightgray"
    >
      <div class="overflow-hidden">
        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <!--회사 소개 및 링크 이동 -->
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          회사
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(3, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          지속가능경영
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          IR
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          이용약관
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          채용정보
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          광고/제휴/출점문의
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          편성기준
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          개인정보처리방침
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          법적고지
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          이메일주소무수집거부
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          윤리경영
        </a>

        <a
          class="icon-link icon-link-hover"
          style="--bs-icon-link-transform: translate3d(0, -0.125rem, 0)"
          href="#"
        >
          <!-- 이용약관 -->
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#clipboard"></use>
          </svg>
          사이버감사실
        </a>
        <div style="text-align: center">
          <br />
          <ul>
            <li style="list-style: none">
              (05717)서울 송파구 중대로 135 아이티벤처타워, 아이티벤처타워
              12층(가락동 78)
            </li>
            <!-- footer 및 이용약관 -->
            <li style="list-style: none">대표자: 8호선.</li>
            <li style="list-style: none">사업자는 아직 없습니다.</li>
            <li style="list-style: none">
              However, 총 깃아이디들을 올릴 것입니다.
            </li>
            <li style="list-style: none">© T-get. All Rights Reserved.</li>
          </ul>
        </div>
      </div>
    </div>

   
  </body>
</html>
