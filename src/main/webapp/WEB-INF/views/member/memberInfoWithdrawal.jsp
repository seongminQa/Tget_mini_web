<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원 탈퇴</title>
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

    <script>
  	
    
    //8)체크박스 검사 -------------------------------------------------
    function withdrawalSubmit(){
    	
    	//form 태그의 action 기능을 수행하지 않도록 함
        event.preventDefault();

        //각 입력 양식의 데이터 검사
        var totalResult = true;
    	if ($('#withdrawalCheckBox').is(':checked')) {
            // 체크되어 있음
            //console.log('체크되어 있음');
            $("#agreeSign").removeClass("text-danger");
        } else {
            // 체크되어 있지 않음
           totalResult = false;
            //console.log('체크되어 있지 않음');
            $("#agreeSign").addClass("text-danger");
        }
        
        //8)전체 유효성 검사 결과가 true일 경우
        if(totalResult) {
           //수동으로 action 기능을 수행하도록 함
           $("#withdrawalForm")[0].submit();
        }
    }
    
    </script>

    <style>
      input {
        /* input 태그가 가진 기본적인 설정들을 지움 */
        outline: none;
        border: none;
        color: gray;
      }
      .div_form {
        height: 50px;
        border-bottom: 3px solid lightgray;
        margin-top: 20px;
        white-space: nowrap; /* 창 크기가 변경되어도 줄바꿈을 하지 않는다. */
      }
      .div_form_checkbox,
      .submit_btn {
        height: 60px;
      }
      .span_radio {
        display: inline;
        margin-top: 15px;
      }

      header,
      .content,
      .tget_footer {
        min-width: 500px; /* 최소 창 가로폭 지정(더 줄어들면 아래에 스크롤바가 생김) */
      }
      /* 나중에 수정하기 */
    </style>

    <link rel="stylesheet" href="/resources/css/home.css" />
  </head>

  <body>
    <!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <!-- context -->
    <div class="content" style="background-color: white; width: 100%">
      <div class="row justify-content-center ">
        <div class="pt-3 pb-3 row align-items-stretch" style="width: 45%">
          <div class="col-3 mt-1">
            <div style="background-color: white; border-radius: 10px;" class="pt-3 pb-3">
            <div>
           	 <c:if test="${empty memberDto.mprofileImgData}">
               <img src="${pageContext.request.contextPath}/resources/image/project_image/circle_user.svg" width="150" style="margin-bottom: 20px"/>
            </c:if>
            <c:if test="${not empty memberDto.mprofileImgData}">
               <img src="imgProfileDownload?mid=${memberDto.mid}" width="150" style="border-radius: 70%; margin-bottom: 20px; border:3px solid black;" />
            </c:if>
           </div>
              <h4 class="ms-3"><strong>${memberDto.mname}</strong>님의 <br />마이페이지</h4>
              <hr />
              <%@ include file="/WEB-INF/views/common/myPageList.jsp"%>
            </div>
          </div>
          <div class="col-9" style="background-color: white; border-radius: 10px;">
            <h5 class="ps-5 pt-5"><strong>회원 탈퇴</strong></h5>
            <hr style="border-top: 4px solid black" />
            <div class="ms-5 me-5">
                <p><strong>탈퇴 안내</strong></p>
                <p>탈퇴 시 주의사항</p>
                <p><font color="red">적립금/혜택 소멸 및 재가입시 복구 불가</font><br>
                    회원 탈퇴 시, 회원님 아이디에 등록된 적립금과 각종 혜택은 모두 소멸되어, 재가입하더라도 복구되지 않습니다. (T-Point, 영화/공연/문화 예매권, 할인쿠폰 등)</p>

                    <p><font color="red">유료회원 서비스 TOPING 이용 및 복구 불가</font><br>
                    회원 탈퇴 시, 유료회원 서비스인 TOPING 서비스 이용이 불가하며, 재가입하더라도 복구되지 않습니다.
                    따라서 인터파크 회원 탈퇴 이전에 반드시 TOPING 회원 탈퇴를 먼저 진행하시기 바랍니다.</p>

                    <p><font color="red">계법령에 따른 주문번호는 회원 탈퇴 후 5년간 보존</font><br>
                    전자상거래 등에서의 소비자 보호에 관한 법률 제6조(거래기록의 보존 등)에 의거, 주문정보는 회원 탈퇴 후 5년간 보존됩니다.
                    티켓 예매 후 탈퇴 시에 공연 관람은 가능하나 예매번호, 예매내역을 볼 수 없으며, 예매취소 및 배송지 변경은 예매번호를 가지고 고객센터를 통해서만 진행가능합니다.</p>
                    
                    <p><font color="red">탈퇴 처리 및 재가입 제한 정책 안내</font>
                    회원 탈퇴 시, 즉시 탈퇴 처리되며 탈퇴 후 7일간 휴대전화번호/이메일주소/개인식별정보(CI/DI)가 보관됩니다.
                    탈퇴 후, 7일간 신규 계정에 동일한 명의로 본인인증 진행이 불가합니다. 본인인증이 진행되지 않는 경우 인터파크 티켓의 모든 예매 서비스를 이용하실 수 없습니다.</p>
                    <hr/>
                    
                    <p style="font-size: 1.5rem;">게시글 안내사항</p>

                    <p style="color: grey;">상품리뷰와 1:1 문의와 같은 게시판형 서비스에 등록된 게시물은 탈퇴 후에도 자동 삭제 되지 않습니다. 탈퇴 후에는 회원정보 삭제로 인해 작성자 본인 여부를 확인할 수 없으므로, 게시글 편집 및 삭제 처리가 원천적으로 불가능합니다. 삭제를 원하는 게시글이 있을 경우, 먼저 해당 게시글을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</p>
                    <hr/>
                    <form id="withdrawalForm" method="post" action="memberWithdrawal" onsubmit="withdrawalSubmit()">
	                    <div class="row d-flex pt-3 pb-3">
	                        <div class="col-2"></div>
	                        <input class="col-1" id="withdrawalCheckBox" type="checkbox" name="withdrawal">
	                        <div id="agreeSign" class="col-8" style="font-size: 1.1em; font-weight: bold;">상기 사항을 모두 확인하였습니다.(필수)</div>
	                    </div>
	                    <div class="row mb-5 mt-4">
	                        <button class="col btn me-3" style="background-color: white; color: #d95b96; border: 1px solid#d95b96;">취소</button>
	                        <button class="col btn" style="background-color: #d95b96; color: white;">회원 탈퇴</button> 
	                    </div>
                    </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </body>
</html>