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
		$("#mid").removeClass("border border-danger");
	} else {	
		$("#mid").addClass("border border-danger");
		totalResult = false;
	}

    //2)Password 검사 -------------------------------------------------
	var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
	var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
	if(mpasswordResult) {
		$("#mpassword").removeClass("border border-danger");
	} else {	
		$("#mpassword").addClass("border border-danger");
		totalResult = false;
	}

    //2-1)pwcheck 검사 -------------------------------------------------
	if($("#mpassword").val()===$("#pwcheck").val()) {
		$("#pwcheck").removeClass("border border-danger");
	} else {	
		$("#pwcheck").addClass("border border-danger");
		totalResult = false;
	}

    //3)이름 검사 -------------------------------------------------
	var mnamePattern = /^[가-힣]{2,12}$/;
	var mnameResult = mnamePattern.test($("#mname").val());
	if(mnameResult) {
		$("#mname").removeClass("border border-danger");
	} else {	
		$("#mname").addClass("border border-danger");
		totalResult = false;
	}

    //4)주민등록번호 검사 -------------------------------------------------
	var mssnPattern = /^\d{6}\-\d{7}$/;
	var mssnResult = mssnPattern.test($("#mssn").val());
	if(mssnResult) {
		$("#mssn").removeClass("border border-danger");
	} else {	
		$("#mssn").addClass("border border-danger");
		totalResult = false;
	}
	
	//5)Email 검사 -------------------------------------------------	
	var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var memailResult = memailPattern.test($("#memail").val());
	if(memailResult) {
		$("#memail").removeClass("border border-danger");
	} else {	
		$("#memail").addClass("border border-danger");
		totalResult = false;
	}
	

	//6)Phone 검사 ---------------------------------------------------
	var mphonePattern = /^010-\d{3,4}-\d{4}$/;
	var mphoneResult = mphonePattern.test($("#mphone").val());
	if(mphoneResult) {
		$("#mphone").removeClass("border border-danger");
	} else {	
		$("#mphone").addClass("border border-danger");
		totalResult = false;
	}
	
	//7) 전체 유효성 검사 결과가 true일 경우
	if(totalResult) {
		//수동으로 action 기능을 수행하도록 함
		$("#joinForm")[0].submit();
	}
}