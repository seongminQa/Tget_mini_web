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
   $(".pwCheckEye").click(function() {
      toggleView();
   });

   const pwType = document.querySelector(".pwCheckClazz");
   const pwEye = document.querySelector(".pwCheckEye");

   function toggleView() {
      if (pwType.type === "password") {
         pwType.type = "text";
      } else {
         pwType.type = "password";
      }
   }
});

//////////////////////////////////////////////////////////////
// form 중복 검사 및 유효성 검사(여기선 오류별로 span에 문구를 생성한다. form제출과 상관 없음, 입력값을 그때 그때 검사하기 위해 분리)
// Id검사------------------------------------------------------------------------
function idUniqueCheck(){
   console.log("idUniqueCheck 실행");

   var midPattern = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
   var midResult = midPattern.test($("#mid").val());
   
   //아이디가 빈 문자이면 span에 아무 글씨도 안 넣는다.
	if($("#mid").val() === ""){
		$("#spanId").removeClass("text-danger").html("");
	} else{
		// 빈문자가 아니면 유효성 검사 실행
		if(midResult) { // 아이디가 패턴 양식에 맞으면 
			   // 중복 아이디 검사 실행
			   $("#spanId").removeClass("text-danger").html("");
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
			        	   // 중복 값이 있다면
			               $("#spanId").addClass("text-danger").text("이미 있는 아이디 입니다.");
			               
			           }
			       }
			   });
		      
		   } else {   
			  // 아이디가 패턴 양식에 맞지 않으면
		      $("#spanId").addClass("text-danger").html("아이디가 양식에 맞지 않습니다.");
		      
		   }
	}
   
   
};

// pw검사----------------------------------------------------------------
function pwPatternCheck(){
	var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
	var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
	
	//비밀번호가 빈 문자이면 span에 아무 글씨도 안 넣는다.
	if($("#mpassword").val() === ""){
		$("#spanPw").removeClass("text-danger").html("");
	}else{
		// 빈문자가 아니면 유효성 검사에 따른 결과값 출력
		if(mpasswordResult) {
			   $("#spanPw").removeClass("text-danger").html("알맞은 비밀번호 입니다.");
			} else {   
			   $("#spanPw").addClass("text-danger").html("비밀번호가 양식에 맞지 않습니다.");
			   
			}
	}
	
}

 //2-1)pwcheck 검사 -------------------------------------------------
function pwCheck(){
	// 비밀번호 확인이나  비밀번호 둘 중 하나가 빈 문자이면 span에 아무 글씨도 안 넣는다.
	if($("#pwcheck").val()=== "" || $("#mpassword").val()=== ""){
		$("#spanPwCheck").removeClass("text-danger").html("");
	}else {
		// null이 아니라면 비밀번호와 비교하여 일치하지 않는지를 확인한다.
		if($("#mpassword").val()===$("#pwcheck").val()) {
			   $("#spanPwCheck").removeClass("text-danger").html("비밀번호가 일치합니다.");
			} else {   
			   $("#spanPwCheck").addClass("text-danger").html("비밀번호가 일치하지 않습니다.");
			}
		}
	}

//3)nameCheck 검사 -------------------------------------------------
function nameCheck(){
	
	//이름이 빈 문자이면 span에 아무 글씨도 안 넣는다.
	if($("#mname").val() === ""){
		$("#spanName").removeClass("text-danger").html("");
	}else{
		// 빈문자가 아니면 유효성 검사를 실행한다.
		var mnamePattern = /^[가-힣]{2,12}$/;
		   var mnameResult = mnamePattern.test($("#mname").val());
		   if(mnameResult) {
		      $("#spanName").removeClass("text-danger").html("알맞은 이름 입니다.");
		   } else {   
		      $("#spanName").addClass("text-danger").html("이름이 양식에 맞지 않습니다.");
		      
		   }
	}
	
	
}
//4)ssnCheck검사(중복검사 해야 한다.) ------------------------------------------------------------
function ssnUniqueCheck(){
	// ssn이 빈문자면 아무것도 출력하지 않는다.
	if($("#mssn").val() === ""){
		$("#spanSsn").removeClass("text-danger").html("");
	}else{
		// 빈문자가 아니면 유효성 검사 실행
		var mssnPattern = /^\d{6}\-\d{7}$/;
		   var mssnResult = mssnPattern.test($("#mssn").val());
		   if(mssnResult) {
			   
			// 중복 아이디 검사 실행
			   $("#spanSsn").removeClass("text-danger").html("");
			   const mssn = $('#mssn').val();
			   $.ajax({
			       url: 'uniquessn',
			       type: 'post',
			       data: {mssn:mssn},
			       success: function(data){
			          console.log("json객체의 count값"+data.count);
			           if(data.count == 0){
			               // 중복값이 없다면
			        	   $("#spanSsn").removeClass("text-danger").html("알맞은 주민등록번호 입니다.");
			           } else {
			        	   // 중복 값이 있다면
			               $("#spanSsn").addClass("text-danger").text("이미 가입한 회원 입니다.");
			               
			           }
			       }
			   });
			   
		      
		   } else {   
		      $("#spanSsn").addClass("text-danger").html("주민등록번호가 양식에 맞지 않습니다.");
		      
		   }
	}
	
	
}

//5)emailCheck검사 ------------------------------------------------------------
function emailCheck(){
	
	// ssn이 빈문자면 아무것도 출력하지 않는다.
	if($("#memail").val() === ""){
		$("#spanEmail").removeClass("text-danger").html("");
	}else{
		// 빈문자가 아니면 유효성 검사 실행한다.
		var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   var memailResult = memailPattern.test($("#memail").val());
		   if(memailResult) {
		      $("#spanEmail").removeClass("text-danger").html("알맞은 이메일 입니다.");
		   } else {   
		      $("#spanEmail").addClass("text-danger").html("이메일이 양식에 맞지 않습니다.");
		      totalResult = false;
		   }
	}
	
	
}

//6)phoneCheck검사(중복검사 해야한다.) ------------------------------------------------------------
function phoneUniqueCheck(){
	
	// email이 빈문자면 아무것도 출력하지 않는다.
	if($("#mphone").val() === ""){
		$("#spanPhone").removeClass("text-danger").html("");
	}else{
		// 빈문자가 아니면 유효성 검사 실행
		var mphonePattern = /^010-\d{3,4}-\d{4}$/;
		   var mphoneResult = mphonePattern.test($("#mphone").val());
		   if(mphoneResult) { // 문자열 형식이 맞으면
			   
			// 중복 아이디 검사 실행
			   $("#spanPhone").removeClass("text-danger").html("");
			   const mphone = $('#mphone').val();
			   $.ajax({
			       url: 'uniquephone',
			       type: 'post',
			       data: {mphone:mphone},
			       success: function(data){
			          console.log("json객체의 count값"+data.count);
			           if(data.count == 0){
			               // 중복값이 없다면
			        	   $("#spanPhone").removeClass("text-danger").html("알맞은 휴대폰 번호 입니다.");
			           } else {
			        	   // 중복 값이 있다면
			               $("#spanPhone").addClass("text-danger").text("이미 가입한 회원 입니다.");
			               
			           }
			       }
			   });
		      
		   } else {   
		      $("#spanPhone").addClass("text-danger").html("휴대폰 번호가 양식에 맞지 않습니다.");
		      totalResult = false;
		   }
	}
	
	
}

//7)nicknameCheck검사(중복검사 해야 한다.)---------------------------------------------------


function nicknameUniqueCheck(){
	
	// nickname이 빈문자면 아무것도 출력하지 않는다.
	if($("#mnickname").val() === ""){
		$("#spanNickname").removeClass("text-danger").html("");
	} else {// 빈문자가 아니면 
		
		// 중복 아이디 검사 실행
		   $("#spanNickname").removeClass("text-danger").html("");
		   const mnickname = $('#mnickname').val();
		   $.ajax({
		       url: 'uniquenickname',
		       type: 'post',
		       data: {mnickname:mnickname},
		       success: function(data){
		          console.log("json객체의 count값"+data.count);
		           if(data.count == 0){
		               // 중복값이 없다면
		        	   $("#spanNickname").removeClass("text-danger").html("사용할 수 있는 닉네임 입니다.");
		           } else {
		        	   // 중복 값이 있다면
		               $("#spanNickname").addClass("text-danger").text("이미 사용하고 있는 닉네임 입니다.");
  
		           }
		       }
		   });
		
	}
}
//////////////////////////////////////////////////////////////////////////////////////
// form 제출관련 유효성 검사

function handleCheckData() {
   console.log("입력 데이터를 검사합니다.");
   
   //form 태그의 action 기능을 수행하지 않도록 함
   event.preventDefault();
   
   //각 입력 양식의 데이터 검사
   var totalResult = true;
   
   //1)ID 검사 ------------------------------------------------- 
   //id 중복 검사 및 유효성 검사(form 제출용 검사)
   var midPattern = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
   var midResult = midPattern.test($("#mid").val());
   
   if($("#mid").val()===""){
	   $("#spanId").addClass("text-danger").html("아이디는 필수 값입니다.");
	   totalResult = false;
   }else{
	   if(midResult) { // 아이디가 패턴 양식에 맞으면 
		   // 중복 아이디 검사 실행
		   const mid = $('#mid').val();
		   $.ajax({
			   url: 'uniqueid',
			   type: 'post',
			   data: {mid:mid},
			   success: function(data){
				   if(data.count == 0){
					   // 중복값이 없다면
				   } else {
					   // 중복 값이 있다면
					   totalResult = false;
				   }
			   }
		   });
		   
	   } else {
		   // 패턴에 맞지 않으면
		   totalResult = false;
	   }
	   
   }

    //2)Password 검사 -------------------------------------------------
   var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
   var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
   
   if($("#mpassword").val() === ""){
	   $("#spanPw").addClass("text-danger").html("비밀번호는 필수 값입니다.");
	   totalResult = false;
   }else{
       // 빈문자가 아니면 유효성 검사에 따른 결과값 출력
       if(mpasswordResult) {
           } else {   
              totalResult = false;
           }
   }

    //2-1)pwcheck 검사 -------------------------------------------------
   if($("#mpassword").val()===$("#pwcheck").val()) {
	   
   } else {   
      totalResult = false;
   }

    //3)이름 검사 -------------------------------------------------
   var mnamePattern = /^[가-힣]{2,12}$/;
   var mnameResult = mnamePattern.test($("#mname").val());
   if($("#mname").val() === ""){
	   // 아무값도 없으면 제출 막기
	   $("#spanName").addClass("text-danger").html("이름은 필수 값입니다.");
	   totalResult = false; 
   }
   if(mnameResult) {
      
   } else {   
      totalResult = false;
   }

    //4)주민등록번호 검사 -------------------------------------------------
   var mssnPattern = /^\d{6}\-\d{7}$/;
   var mssnResult = mssnPattern.test($("#mssn").val());
   
   if($("#mssn").val() === ""){
	   $("#spanSsn").addClass("text-danger").html("주민등록번호는 필수 값입니다.");
	   totalResult = false; // 빈 값이라면
   }else{
	   // 빈 값이 아니라면
	   if(mssnResult) {
		   // 양식 유효성 검사 실시
		   // 중복 아이디 검사 실행
           $("#spanSsn").removeClass("text-danger").html("");
           const mssn = $('#mssn').val();
           $.ajax({
               url: 'uniquessn',
               type: 'post',
               data: {mssn:mssn},
               success: function(data){
                  console.log("json객체의 count값"+data.count);
                   if(data.count == 0){
                       // 중복값이 없다면
                       
                   } else {
                       // 중복 값이 있다면
                	   totalResult = false;
                       
                   }
               }
           }); 
	   } else {
		   // 양식이 맞지 않다면
		   totalResult = false;
	   }
   }
   
   
   //5)Email 검사 -------------------------------------------------   
   var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   var memailResult = memailPattern.test($("#memail").val());
   
   if($("#memail").val() === ""){
	   $("#spanEmail").addClass("text-danger").html("이메일은 필수 값 입니다.");
	   totalResult = false;
   }else{
	   // 빈 값이 아니라면 유효성 검사 실행
	   if(memailResult) {
		   $("#spanEmail").removeClass("border border-danger");
	   } else {   
		   $("#spanEmail").addClass("text-danger").html("이메일이 양식에 맞지 않습니다.");
		   totalResult = false;
	   }
   }
   
   

   //6)Phone 검사 ---------------------------------------------------
   var mphonePattern = /^010-\d{3,4}-\d{4}$/;
   var mphoneResult = mphonePattern.test($("#mphone").val());
   
   if($("#mphone").val() === ""){
	   $("#spanPhone").addClass("text-danger").html("휴대폰 번호는 필수 값 입니다.");
	   totalResult = false;
   }else{
	   // 빈 값이 아니라면 유효성 검사 실행
	   if(mphoneResult) {
		   $("#spanPhone").removeClass("border border-danger");
		// 양식에 맞으면 중복 휴대폰 번호 검사 실행
           $("#spanPhone").removeClass("text-danger").html("");
           const mphone = $('#mphone').val();
           $.ajax({
               url: 'uniquephone',
               type: 'post',
               data: {mphone:mphone},
               success: function(data){
                  console.log("json객체의 count값"+data.count);
                   if(data.count == 0){
                       // 중복값이 없다면
                       
                   } else {
                       // 중복 값이 있다면
                       
                       totalResult = false;
                       
                   }
               }
           });
		   
	   } else {   
		   
		   totalResult = false;
	   }
   }
   
   //7)nickname 중복이면 제출 막기 -------------------------------------------
   
// 중복 검사 실행
   $("#spanNickname").removeClass("text-danger").html("");
   const mnickname = $('#mnickname').val();
   $.ajax({
       url: 'uniquenickname',
       type: 'post',
       data: {mnickname:mnickname},
       success: function(data){
          console.log("json객체의 count값"+data.count);
           if(data.count == 0){
               // 중복값이 없다면
        	   
           } else {
               // 중복 값이 있다면
        	   totalResult = false;

           }
       }
   });
   
   
   //8)체크박스 검사 -------------------------------------------------
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

