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