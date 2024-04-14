// 아이디 값이 checkAll인 것을 찾아 ch 변수에 저장
const ch = document.getElementById('checkAll');
// ch 가 클릭 되었을 때 이벤트 함수 발생

ch.addEventListener('click', ()=>{
	
	const checkboxes = document.querySelectorAll('input[name=tiket]');
		if(ch.checked){
		for(const checkbox of checkboxes){
			checkbox.checked = true;
		}
	}
	else{
		for(const checkbox of checkboxes){
			checkbox.checked = false;
		}
	}
});