<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <form method="post" class="row d-flex flex-column align-items-center ms-5" style="margin-top: 50px; margin-bottom: 50px;">
            <div class="div_form row">
                <label for="id" class="col-3 pt-3"><strong>아이디</strong></label>
                <input class="col-9" type="text" id="id" name="id" placeholder="6~20자 영문, 숫자">
            </div>
            <div class="div_form row">
                <label for="pw" class="col-3 pt-3"><strong>비밀번호</strong></label>
                <input class="pwClazz col-8" type="password" id="pw" name="pw" placeholder="8~12자 영문, 숫자">
                <div class="pwEye col-1"><button type="button" style="border:none; background-color: transparent;"><img src="/Tget_mini_web/resources/image/project_image/eye.svg" style="width: 30px;"></button></div>
            </div>
            <div class="div_form row">
                <label for="pwcheck" class="col-3 pt-3"><strong>비밀번호 확인</strong></label>
                <input class="pwClazzCheck col-8" type="password" id="pwcheck" name="pwcheck" placeholder="8~12자 영문, 숫자">
                <div class="pwEyeCheck col-1"><button type="button" style="border:none; background-color: transparent;"><img src="/Tget_mini_web/resources/image/project_image/eye.svg" style="width: 30px;"></button></div>
            </div>
            <div class="div_form row">
                <label for="name" class="col-3 pt-3"><strong>이름</strong></label>
                <input class="col-9" type="text" id="name" name="name" placeholder="ex. 홍길동">
            </div>
            <div class="div_form row">
                <label for="email" class="col-3 pt-3"><strong>이메일</strong></label>
                <input class="col-9" type="text" id="email" name="email" placeholder="ex. tget0101@naver.com">
            </div>
            <div class="div_form row">
                <label for="nickname" class="col-3 pt-3"><strong>닉네임</strong></label>
                <input class="col-9" type="text" id="nickname" name="nickname" placeholder="ex. 연뮤덕">
            </div>
            <div class="div_form row">
                <label for="birth" class="col-3 pt-3"><strong>생년월일</strong></label>
                <input class="col-9" type="date" id="birth" name="birth" placeholder="연도-월-일" style="color:grey">
            </div>
            <div class="div_form row">
                <label for="address" class="col-3 pt-3"><strong>주소</strong></label>
                <input class="col-7" type="text" id="address" name="address" placeholder="ex. 서울특별시 종로구 대학로">
                <div class="col-2"><a><button type="button" class="btn" style="background-color: #D95B96; color: white;">우편번호</button></a></div>
            </div>
            <div class="div_form row">
                <label for="detail_address" class="col-3 pt-3"><strong>상세 주소</strong></label>
                <input class="col-9" type="text" id="detail_address" name="detail_address" placeholder="ex. 두산아트센터 연강홀 B1">
            </div>
            <div class="div_form row"style="margin-bottom:15px">
                <label for="phone" class="col-3 pt-3"><strong>전화번호</strong></label>
                <input class="col-9" type="text" id="phone" name="phone" placeholder="ex. 010-1111-2222">
            </div>
            <div class="div_form_checkbox row">
                <input class="col-1" type="checkbox" style="width: 20px;">
                <span class="span_radio col-11" >SMS로 상품 및 이벤트 정보를 받겠습니다.(선택)</span>
            </div>
            <div class="div_form_checkbox row">
                <input class="col-2" type="checkbox" style="width: 20px;">
                <span class="span_radio col-10" >14세 미만입니다.</span>
            </div>
            <div class="row" style="width: 40%; height: 60px;">
                <span style="display: inline;" class="d-flex justify-content-center mt-3">만 14세 미만 회원은 법정 대리인(부모님) 동의를 받은 경우만 회원가입이 가능합니다.</span>
            </div>
            <hr style="width: 40%; margin-top: 15px">
            <div class="div_form_checkbox mt-2"><span>(선택)추천받고 싶은 장르를 선택해 주세요</span></div>
            <div class=" div_form_checkbox">
                <div class="row">
                    <div class="col">
                        <input type="radio" name="genre" value="romance">
                        <span>로맨스</span>
                    </div>
	                <div class="col">
	                    <input type="radio" name="genre" value="thrill">
	                    <span>스릴</span>
	                </div>
	                <div class="col">
	                    <input type="radio" name="genre" value="healing">
	                    <span>힐링</span>
	                </div>
	                <div class="col">
	                    <input type="radio" name="genre" value="comic">
	                    <span>코믹</span>
	                </div>
	                <div class="col">
	                    <input type="radio" name="genre" value="Immersive">
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
    