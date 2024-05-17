
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		
		<link rel="stylesheet" href="/Tget_mini_web/resources/css/login.css">
		
	<!-- 사용자 정의 자바스크립트 -->
		<script>
	 	/* function handleCheckData() {
            
            event.preventDefault();
            
            //각 입력 양식의 데이터 검사
            var totalResult = true;
            //하나의 숫자와 하나의 소문자 알파벳을 포함하고, 총 7에서 11개의 문자로 이루어진 문자열을 나타냅니다.
            var uidPattern =    /^(?=.*\d)(?=.*[a-z]).{7,11}$/; 
            var uidResult = uidPattern.test( $("#uid").val());
            if(!uidResult) {
               totalResult = false;
               alert('아이디를 다시 한 번 확인해주세요!')
            }
            
               
            //Password검사하기
            //하나의 숫자, 소문자 알파벳, 대문자 알파벳, 특수문자를 포함하고, 총 10에서 15개의 문자로 이루어진 문자열을 나타야됨.
            var passwordPattern =  /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/; 
            var passwordResult = passwordPattern.test($("#upassword").val());
            if(!passwordResult) {
               totalResult = false;
               alert('비밀번호를 다시 한 번 확인해주세요!')
            }
            
            //전체 유효성 검사결과가 true일 경우
            if(totalResult) {
               $("#login-form")[0].submit();
               
            }                                
         }  */
       
         /* 다른 로그인 유효성검사 */
          function joinCheck() {
        	  
        	 var id =document.join.mid.value;
        	 var password=document.join.mpassword.value;
        	 
        	 
        	 if(id=null||id == "" ){
        		 alert('아이디를 다시 한번 확인해주세요');
        		 document.join.mid.focus();
        		 retrun;
        	 }
           	 if(password=null||password =="" ){
        		 alert('비밀번호를 다시 한번 확인해주세요');
        		 document.join.mpassword.focus();
        		 retrun;
        	 }
           	 document.join.submit();
        	 
         } 
         
       
		</script>
	</head>
	<body>
	

	
		<!--  중앙에 가로로 정렬시키기 위해(화면창을 줄이건 늘려도 가운대로 하기위해) 스타일은 너무 위로 치우쳐 있어서 마진탑 10%로 줌 -->
	 	<div class="d-flex justify-content-center"style="margin-top:5%;">  
        	 <div class="login-wrapper">
 
		         <!-- 가운데 이미지 티겟을 설정하기위해 text-align -->
		    	  <div style="text-align : center;">  
		         <!--  이미지 크기를 맟주기 위해 높이와 너비를 줌 -->
		       <a class="navbar-brand" href="/Tget_mini_web"> <img src ="/Tget_mini_web/resources/image/project_image/t_get_logo.svg" style="width:200px ; height: 145px;"></a>   
		        <form method="post" action="${pageContext.request.contextPath}/login" id="login-form" name="join">
		     
      <%--      <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
             <div class="alert alert-danger mb-2" role="alert">
                <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
                     	 아이디 또는 비밀번호가 틀립니다.
                </c:if>
             </div>
          </c:if> --%>
        	<!-- placeholder 사용한이유는 아이디와 비밀호를 입력을하는 필드라는것을 알려주기 위해 사용 -->
              <!-- 체크박스를 가운데로 정렬하기 위하여 -->
            <input type="text" id="mid" name="mid" placeholder="id" class="check" >  
            
            <input type="password" id="mpassword" name="mpassword" placeholder="Password">
            	
             	<div style="margin-right:50%;">	 
             		<label for="remember-check" class="d-flex justify-content-center">
	            		<input type="checkbox" id="remember-check" class="m-1">아이디 저장하기  	         	             	
          			<!-- 	<div>
	             	<input type="checkbox" id="remember-check" class="m-1">자동 로그인             	
             	</div> -->
             		</label>
             	</div> 
            <!-- 버튼을 생성하는 입력요소 form 타입 sumbit은 제출버튼 동작으로 지정하여  value 값을 로그인으로 지정하였습니다.
            사용자가 입력한 데이터를 서버로 제출하기위해서 사용함 (서버 전송버튼)-->
            <!-- 로그인 버튼이지만 클릭을 할경우 입력한 아이디와 비밀번호 정보가 서보로 전송될 수있도록 사용 -->
			            <input type="submit" value="Login" onclick="joinCheck()"> <!--onclick="joinCheck()"  -->
			            <div class="link">
			              <p>	
			              <!-- 링크는 각각 아이디찾기, 비밀번호 찾기, 회원가입 페이지로 이동할수 있도록 구현한 링크이다. -->
			              <a href="/Tget_mini_web/member/lost_id">아이디 찾기</a> | 
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
		
	</body>
</html>