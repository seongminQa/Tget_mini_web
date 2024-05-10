// 비밀번호 보이게 하는 스크립트

$(function() { // html 문서 로드 이후 로드하는 스크립트
   // 문서보다 먼저 로드 되면 해당 클래스를 인식할 수 없기에 문서로드 제이쿼리 안에 작성한다.

   // 버튼을 누르면 비밀번호확인 보여주는 함수 실행
   $(".pwEye").click(function() {
      toggleView();
   });

   // 객체 찾아서 변수에 담기
   const pwType = document.querySelector(".pwClazz");
   const pwEye = document.querySelector(".pwEye");

   // input 타입 변환하는 함수
   function toggleView() {
      if (pwType.type === "password") {
         pwType.type = "text";
      } else {
         pwType.type = "password";
      }
   }
});

$(function() {
   // 버튼을 누르면 비밀번호확인 보여주는 함수 실행
   $(".pwEyeCheck").click(function() {
      toggleView();
   });

   const pwType = document.querySelector(".pwClazzCheck");
   const pwEye = document.querySelector(".pwEyeCheck");

   function toggleView() {
      if (pwType.type === "password") {
         pwType.type = "text";
      } else {
         pwType.type = "password";
      }
   }
});

////////////////////////////////////////////////////////////////
// id 중복 검사(
function idUniqueCheck(){
   console.log("idUniqueCheck 실행");

   const mid = $('#mid').val();
   $.ajax({
       url: 'uniqueid',
       type: 'post',
       data: {mid:mid},
       success: function(data){
          console.log("json객체의 count값"+data.count);
           if(data.count == 0){
               // 중복값이 없다면
               $("#spanId").removeClass("text-danger").text("사용 가능한 아이디 입니다.");
           } else {
               $("#spanId").addClass("text-danger").text("이미 있는 아이디 입니다.");
               
           }
       }
   });
};

//////////////////////////////////////////////////////////////////////////////////////
// form 유효성 검사

function handleCheckData() {
   console.log("입력 데이터를 검사합니다.");
   
   //form 태그의 action 기능을 수행하지 않도록 함
   event.preventDefault();
   
   //각 입력 양식의 데이터 검사
   var totalResult = true;
   
   //1)ID 검사 -------------------------------------------------            
   var midPattern = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
   var midResult = midPattern.test($("#mid").val());
   if(midResult) {
      $("spanId").removeClass("text-danger").html("");
   } else {   
      $("#spanId").addClass("text-danger").html("아이디가 양식에 맞지 않습니다.");
      totalResult = false;
   }

    //2)Password 검사 -------------------------------------------------
   var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
   var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
   if(mpasswordResult) {
      $("#spanPw").removeClass("border border-danger");
   } else {   
      $("#spanPw").addClass("text-danger").html("비밀번호가 양식에 맞지 않습니다.");
      totalResult = false;
   }

    //2-1)pwcheck 검사 -------------------------------------------------
   if($("#mpassword").val()===$("#pwcheck").val()) {
      $("#spanPwCheck").removeClass("border border-danger");
   } else {   
      $("#spanPwCheck").addClass("text-danger").html("비밀번호가 일치하지 않습니다.");
      totalResult = false;
   }

    //3)이름 검사 -------------------------------------------------
   var mnamePattern = /^[가-힣]{2,12}$/;
   var mnameResult = mnamePattern.test($("#mname").val());
   if(mnameResult) {
      $("#spanName").removeClass("border border-danger");
   } else {   
      $("#spanName").addClass("text-danger").html("이름이 양식에 맞지 않습니다.");
      totalResult = false;
   }

    //4)주민등록번호 검사 -------------------------------------------------
   var mssnPattern = /^\d{6}\-\d{7}$/;
   var mssnResult = mssnPattern.test($("#mssn").val());
   if(mssnResult) {
      $("#spanSsn").removeClass("border border-danger");
   } else {   
      $("#spanSsn").addClass("text-danger").html("주민등록번호가 양식에 맞지 않습니다.");
      totalResult = false;
   }
   
   //5)Email 검사 -------------------------------------------------   
   var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   var memailResult = memailPattern.test($("#memail").val());
   if(memailResult) {
      $("#spanEmail").removeClass("border border-danger");
   } else {   
      $("#spanEmail").addClass("text-danger").html("이메일이 양식에 맞지 않습니다.");
      totalResult = false;
   }
   

   //6)Phone 검사 ---------------------------------------------------
   var mphonePattern = /^010-\d{3,4}-\d{4}$/;
   var mphoneResult = mphonePattern.test($("#mphone").val());
   if(mphoneResult) {
      $("#spanPhone").removeClass("border border-danger");
   } else {   
      $("#spanPhone").addClass("text-danger").html("휴대폰 번호가 양식에 맞지 않습니다.");
      totalResult = false;
   }
   
   //7)체크박스 검사 -------------------------------------------------
   if ($('#necessaryBox').is(':checked')) {
       // 체크되어 있음
       //console.log('체크되어 있음');
       $("#necessaryBoxSpan").removeClass("text-danger");
   } else {
       // 체크되어 있지 않음
      totalResult = false;
       //console.log('체크되어 있지 않음');
       $("#necessaryBoxSpan").addClass("text-danger");
   }
   
   //8)전체 유효성 검사 결과가 true일 경우
   if(totalResult) {
      //수동으로 action 기능을 수행하도록 함
      $("#joinForm")[0].submit();
   }
}