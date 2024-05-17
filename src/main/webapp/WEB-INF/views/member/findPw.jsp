
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 





<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<link rel="stylesheet" href="/Tget_mini_web/resources/css/lostid.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
		/*----모달창을 띄우기 위한 함수--- */
		function pwModify() {
	        const pwModal = new bootstrap.Modal("#pwModifyModal");
	        pwModal.show();		
		}
/*)--------------------------------유효성 검사-------------------------------------------------------  */

/*1)--------------------------------사용자 출력용-------------------------------------------------------  */
		function PWCheck(){
			var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
			var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
			
			//비밀번호가 빈 문자이면 span에 아무 글씨도 안 넣는다.
			if($("#mpassword").val() === ""){
				$("#spanPWL").removeClass("text-danger").html("");
			}else{
				// 빈문자가 아니면 유효성 검사에 따른 결과값 출력
				if(mpasswordResult) {
					   $("#spanPWL").removeClass("text-danger").html("알맞은 비밀번호 입니다.");
					} else {   
					   $("#spanPWL").addClass("text-danger").html("비밀번호가 양식에 맞지 않습니다.");
					   
					}
			}
			
		}
		
/*2)--------------------------------유효한 값을 제출 출력용-------------------------------------------------------  */
		//비밀번호 재확인
		function OkpwCheck(){
			// 비밀번호 확인이나  비밀번호 둘 중 하나가 빈 문자이면 span에 아무 글씨도 안 넣는다.
			if($("#okpwcheck").val()=== "" || $("#mpassword").val()=== ""){
				$("#spanokPwCheck").removeClass("text-danger").html("");
			}else {
				// null이 아니라면 비밀번호와 비교하여 일치하지 않는지를 확인한다.
				if($("#mpassword").val()===$("#okpwcheck").val()) {
					   $("#spanokPwCheck").removeClass("text-danger").html("비밀번호가 일치합니다.");
					} else {   
					   $("#spanokPwCheck").addClass("text-danger").html("비밀번호가 일치하지 않습니다.");
					}
				}
			}
/*)--------------------------------전체 제출방법 버튼이다 이자식아-------------------------------------------------------  */
		function lastCheckData() {
			   console.log("입력 데이터를 검사합니다.");
			   
			   //form 태그의 action 기능을 수행하지 않도록 함
			   event.preventDefault();
			   
			   //각 입력 양식의 데이터 검사
			   var totalResult = true;
			   var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
			   var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
			   
			   if($("#mpassword").val() === ""){
				   $("#spanPWL").addClass("text-danger").html("비밀번호를 입력해주세요.");
				   totalResult = false;
			   }else{
			       // 빈문자가 아니면 유효성 검사에 따른 결과값 출력
			       if(mpasswordResult) {
			           } else {   
			              totalResult = false;
			           }
			   }

			    //)pwcheck 검사 -------------------------------------------------
			   if($("#mpassword").val()===$("#okpwcheck").val()) {
				   
			   } else {   
			      totalResult = false;
			   }
			    
			    
			   if(totalResult) {
				      //수동으로 action 기능을 수행하도록 함
				      $("#lastForm")[0].submit();
				   }
				}

/*----------------------------비밀번호 보이게하는것--------------------------------------------  */
			$(function() { // html 문서 로드 이후 로드하는 스크립트
   			// 문서보다 먼저 로드 되면 해당 클래스를 인식할 수 없기에 문서로드 제이쿼리 안에 작성한다.
			
			   // 버튼을 누르면 비밀번호확인 보여주는 함수 실행
			   $(".seepw").click(function() {
			      toggleView();
			   });
			
			   // 객체 찾아서 변수에 담기
			   const seepwType = document.querySelector(".seepwClazz");
			   const seeEye = document.querySelector(".seepw");
			
			   // input 타입 변환하는 함수
			   function toggleView() {
			      if (seepwType.type === "password") {
			    	  seepwType.type = "text";
			      } else {
			    	  seepwType.type = "password";
			      }
			   }
			});
			
			$(function() {
			   // 버튼을 누르면 비밀번호확인 보여주는 함수 실행
			   $(".reseeEye").click(function() {
			      toggleView();
			   });
			
			   const seepwType  = document.querySelector(".reseeClazz");
			   const seepw = document.querySelector(".reseeEye");
			
			   function toggleView() {
			      if (seepwType.type === "password") {
			    	  seepwType.type = "text";
			      } else {
			    	  seepwType.type = "password";
			      }
			   }
			});
		</script>
	</head>
	<body>
	<!-- 헤더 -->
	 <%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	
		<!--  중앙에 가로로 정렬시키기 위해(화면창을 줄이건 늘려도 가운대로 하기위해) 스타일은 너무 위로 치우쳐 있어서 마진탑 10%로 줌 -->
	 	<div class="d-flex justify-content-center"style="margin-top:5%;">  
         	<div class="login-wrapper">
         <!-- 가운데 이미지 티겟을 설정하기위해 text-align -->
      			<div style="text-align : center;">  
         <!--  이미지 크기를 맟주기 위해 높이와 너비를 줌 -->
      				 <a class="navbar-brand" href="/Tget_mini_web">
       
      					<div><h3 class="mb-5"><b>변경하시겠습니까?</b></h3></div> 
 
      				 </a>   
		        <form method="post" action="${pageContext.request.contextPath}/member/findPw" id="login-form" novalidate>
		        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
		    			<div style="height:100px"> <!--비밀번호 값만 넘겨주고 싶으면 사용가능= 비밀번호 : ${mpassword} -->
		    				 <button  style="" type="button" onclick="pwModify()"class="btn btn-outline-dark btn-lg">
							  변경하기    </button>			
		    			</div> 
		            		<input type="submit" value="완료"  style="background-color:  #D95B96; color:white;">
		            <div class="link">
		              <p>	
		              <!-- 링크는 각각 아이디찾기, 비밀번호 찾기, 회원가입 페이지로 이동할수 있도록 구현한 링크이다. -->
		              	<a href="/Tget_mini_web/member/login">로그인</a> | 
		              	<a href="/Tget_mini_web/member/lost_pw">비밀번호 찾기</a> | 
		              	<a href="/Tget_mini_web/member/sign_up">회원가입</a> 
		              </p>
		            </div>
		        </form>
		            
		        </div>
		    </div>
		</div>

	    <!-- footer 하단고정-->
	     <div class="fixed-bottom"> 
    <%@include file="/WEB-INF/views/common/footer.jsp"%>	
	    </div>
	    
	      <!-- modal(pw) -->
			<div class="modal" tabindex="-1" id="pwModifyModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- modal header -->
						<div class="modal-header">
							<h5 class="modal-title">비밀번호  변경</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<!-- modal body -->
						<div class="modal-body">
							<form class="p-3" method="post" action="ChangePw" onsubmit="lastCheckData()" id="lastForm">
							<!--정보를 넘겨서 값을 받을때 아이디 표시를 안보이게 하기위해 input type="hidden" 사용 -->
								<input type="hidden" name="mid" value="${mid}"> 
								<div class="div_form row">
									<label for="pw" class="col-3"><strong>새 비밀번호</strong></label> <input
										class="seepwClazz col-7 mb-3" type="password" id="mpassword" name="mpassword" oninput="PWCheck()"
										placeholder="8~12자 영문, 숫자" />
								
									<div class="seepw col-2">
									
										<button type="button"
											style="border: none; background-color: transparent">
											<img src="/Tget_mini_web/resources/image/project_image/eye.svg"
												style="width: 30px"/>
										</button>
					
									</div>
										<span id="spanPWL" style="margin-bottom: 20px"></span>
							
									
								</div>
								<div class="div_form row">
									<label for="pwcheck" class="col-3"><strong>새 비밀번호확인</strong></label> 
									<input class="reseeClazz  col-7 mb-3" type="password" id="okpwcheck" oninput="OkpwCheck()"name="pwcheck" placeholder="8~12자 영문, 숫자" />
									<div class="col-2">
										<div class="reseeEye"><button type="button"
											style="border: none; background-color: transparent">
											<img src="/Tget_mini_web/resources/image/project_image/eye.svg"
												style="width: 30px" />
										</button></div>
									</div>
										<span id="spanokPwCheck" style="margin-bottom: 20px"></span>
								</div>
						<!-- modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn" 
										style="background-color: #d95b96; color: white"  >수정 완료</button>
								</div>
							</form>
						</div>
						<!--모달 폼을 감싸서 값을 보내주기위해 -->
					</div>
				</div>
			</div>		
		<!--ㅡmodal  -->
	


		
	</body>
</html>