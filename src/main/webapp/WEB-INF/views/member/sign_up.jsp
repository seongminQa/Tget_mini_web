<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>회원가입</title>
      
      <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
      <!-- Latest compiled and minified CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Latest compiled JavaScript -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      
      <!-- jQuery -->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
      
      <!-- sign_up.js -->
      <script src="${pageContext.request.contextPath}/resources/js/sign_up.js"></script>
      
      <!-- 사용자 정의 자바스크립트 -->
      <script>

      </script>
   <style>
        
        input { /* input 태그가 가진 기본적인 설정들을 지움 */
            outline: none;
            border:none;
            color: gray;
        }
        .div_form{
            width: 40%; /* 창 크기가 변경되어도 비율을 유지 */
            height:50px;
            border-bottom: 3px solid black;
            margin-top: 20px;
            white-space: nowrap; /* 창 크기가 변경되어도 줄바꿈을 하지 않는다. */
        }
        
        .div_form_checkbox,
        .submit_btn{
            width: 40%;
            height:60px;
            
        }
        .span_radio{
            display: inline;
            margin-top: 15px;
        }
        header,
        form {
            min-width: 1300px; /* 최소 창 가로폭 지정(더 줄어들면 아래에 스크롤바가 생김) */
        }


    </style>
</head>

<body>
    <!-- header -->
    <header class="container" style="border-bottom: 5px solid #D95B96">

        <div class="row d-flex align-items-center">
            <div class="col-4 d-flex justify-content-start">
                <a class="navbar-brand" href="${pageContext.request.contextPath}"><img src="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="height: 100px;" /></a>
            </div>
            <div class="col-4 d-flex justify-content-center mt-5" style="box-sizing: border-box;">
                <h4><strong>회원가입</strong></h4>
            </div>
            <div class="col-4">
            
            </div>

        </div>

    </header>
        <!-- <div class="d-flex justify-content-center mt-5" style="box-sizing: border-box;">
            <h4><strong>회원가입</strong></h4>
        </div> -->

        <form id="joinForm" name="joinForm" method="post" onsubmit="handleCheckData()" enctype="multipart/form-data" action="${pageContext.request.contextPath}/member/join" novalidate class="row d-flex flex-column align-items-center ms-5" style="margin-top: 50px; margin-bottom: 50px;">
            <div class="div_form row">
                <label for="mid" class="col-3 pt-3"><strong>아이디</strong></label>
                <!-- <input class="col-7" type="text" id="mid" name="mid" placeholder="6~20자 영문 숫자 포함" oninput="idUniqueCheck()"> -->
                <input class="col-9" type="text" id="mid" name="mid" oninput="midUniqueCheck()" placeholder="6~20자 영문 숫자 포함" />
                
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanId" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="mpassword" class="col-3 pt-3"><strong>비밀번호</strong></label>
                <input class="pwClazz col-8" type="password" oninput="mpwPatternCheck()" id="mpassword" name="mpassword" placeholder="8~12자 영문 대소문자 숫자 포함"/>
                <div class="pwEye col-1"><button type="button" style="border:none; background-color: transparent;"><img src="/Tget_mini_web/resources/image/project_image/eye.svg" style="width: 30px;"></button></div>
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanPw" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="pwcheck" class="col-3 pt-3"><strong>비밀번호 확인</strong></label>
                <input class="pwCheckClazz col-8" type="password" oninput="mpwCompareCheck()" id="pwcheck" name="pwcheck" placeholder="8~12자 영문 대소문자 숫자 포함"/>
                <div class="pwCheckEye col-1"><button type="button" style="border:none; background-color: transparent;"><img src="/Tget_mini_web/resources/image/project_image/eye.svg" style="width: 30px;"></button></div>
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanPwCheck" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="mname" class="col-3 pt-3"><strong>이름</strong></label>
                <input class="col-9" type="text" id="mname" oninput="mnameCheck()" name="mname" placeholder="ex. 홍길동" />
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanName" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="mssn" class="col-3 pt-3"><strong>주민등록번호</strong></label>
                <input class="col-9" type="text" id="mssn" oninput="mssnUniqueCheck()" name="mssn" placeholder="하이픈을 포함해주세요" style="color:grey"/>
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanSsn" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="memail" class="col-3 pt-3"><strong>이메일</strong></label>
                <input class="col-9" type="text" id="memail" oninput="memailCheck()" name="memail" placeholder="ex. tget0101@naver.com" />
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanEmail" style="display: inline;" class="d-flex mt-3"></span>
            </div>
   <!--          <div class="div_form row">
                <label for="maddress" class="col-3 pt-3"><strong>주소</strong></label>
                <input class="col-7" type="text" id="maddress" name="maddress" placeholder="ex. 서울특별시 종로구 대학로">
                <div class="col-2"><a><button type="button" class="btn" style="background-color: #D95B96; color: white;">우편번호</button></a></div>
            </div> -->
<!--             <div class="div_form row">
                <label for="mdetail_address" class="col-3 pt-3"><strong>상세 주소</strong></label>
                <input class="col-9" type="text" id="mdetail_address" name="mdetail_address" placeholder="ex. 두산아트센터 연강홀 B1">
            </div> -->
            <div class="div_form row">
                <label for="mphone" class="col-3 pt-3"><strong>전화번호</strong></label>
                <input class="col-9" type="text" id="mphone" oninput="mphoneUniqueCheck()" name="mphone" placeholder="하이픈을 포함해주세요" />
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanPhone" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row">
                <label for="mnickname" class="col-3 pt-3"><strong>닉네임(선택)</strong></label>
                <input class="col-9" type="text" id="mnickname" oninput="mnicknameUniqueCheck()" name="mnickname" placeholder="ex. 연뮤덕" />
            </div>
            <div class="row" style="width: 40%;">
                <span id="spanNickname" style="display: inline;" class="d-flex mt-3"></span>
            </div>
            <div class="div_form row"style="margin-bottom:15px">
                <label for="mprofileImg" class="col-5 pt-3"><strong>프로필 이미지(선택)</strong></label>
                <input class="col-7"  type="file" id="mprofileImg" name="mprofileImg">
            </div>
            <div class="div_form_checkbox row">
                <input class="col-1" type="checkbox" style="width: 20px;">
                <span class="span_radio col-11" >SMS로 상품 및 이벤트 정보를 받겠습니다.(선택)</span>
            </div>
            <div class="div_form_checkbox row">
                <input id="necessaryBox" class="col-2" type="checkbox" style="width: 20px;">
                <span id="necessaryBoxSpan" class="span_radio col-10" >14세 미만입니다.(필수)</span>
            </div>
            <div class="row" style="width: 40%; height: 60px;">
                <span style="display: inline;" class="d-flex justify-content-center mt-3">만 14세 미만 회원은 법정 대리인(부모님) 동의를 받은 경우만 회원가입이 가능합니다.</span>
            </div>
            <hr style="width: 40%; margin-top: 15px">
            <div class="div_form_checkbox mt-2"><span>(선택)추천받고 싶은 장르를 선택해 주세요</span></div>
            <div class=" div_form_checkbox">
                <div class="row">
                    <div class="col">
                        <input type="radio" name="mprefergenre" value="romance">
                        <span>로맨스</span>
                    </div>
                   <div class="col">
                       <input type="radio" name="mprefergenre" value="thrill">
                       <span>스릴</span>
                   </div>
                   <div class="col">
                       <input type="radio" name="mprefergenre" value="healing">
                       <span>힐링</span>
                   </div>
                   <div class="col">
                       <input type="radio" name="mprefergenre" value="comic">
                       <span>코믹</span>
                   </div>
                   <div class="col">
                       <input type="radio" name="mprefergenre" value="Immersive">
                       <span>이머시브</span>
                   </div>
                </div>
            </div>
            <button type="submit" class="submit_btn btn" style="background-color: #D95B96; color: white;">가입 완료</button>
        </form>

<!-- footer 하단고정-->
   
   <%@include file="/WEB-INF/views/common/footer.jsp"%>



</body>

</html>
    