<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Insert title here</title>

    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="/Tget_mini_web/resources/css/shopping_cart.css"/>
    
    <!-- 체크박스 전체 선택 자바스크립트 참조 -->
    <!-- defer 속성은 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행됨을 명시 -->
	<script defer src="/Tget_mini_web/resources/js/shopping_cart.js"></script>
    
    <!-- 사용자 정의 자바스크립트 -->
    <script>
		 // 체크박스 전체 선택 or 전체 선택 해제 (자바스크립트)
		 function checkedAll() {
			console.log("체크박스 클릭")
			
			// 아이디 값이 checkAll인 것을 찾아 ch 변수에 저장
			const ch = document.querySelector('#checkAll');
			// ch 가 클릭 되었을 때 이벤트 함수 발생
			ch.addEventListener('click', function(){
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
		}  
		
		// 체크박스 전체 선택 or 전체 선택 해제 (제이쿼리 사용)
		/* $(document).ready(function () {
		 $("#checkAll").change(function () {
		   if ($("#checkAll").is(":checked")) {
		     console.log("체크박스 전체 선택");
		     $("input[name=tiket]").prop("checked", true);
		   } else {
		     console.log("체크박스 전체 선택 해제");
		     $("input[name=tiket]").prop("checked", false);
		   }
		 });
		}); */
      
		// 체크된 상품들의 가격 정보 받아오기
		
		function priceSum() {
			const checkboxes = document.querySelectorAll('input[name=tiket]');
			console.log(checkboxes);
			console.log(checkboxes.length);

			var totalSum = 0;
			for(var i=0; i<checkboxes.length; i++){
				if(checkboxes[i].checked){
					totalSum = totalSum + parseInt(checkboxes[i].value);
				}
			}
			console.log("총 합계: " + totalSum);
		};

      </script>
    <!-- 내부 css 적용 (테스트용) -->
    <style>

    </style>
  </head>
  <body>
  	<!-- header(헤더) -->
  	<%@include file="/WEB-INF/views/common/header.jsp"%>
    <!-- 장바구니 시작 -->
    <section class="container">
      <div class="cart__title">
        <button class="sort__shopping__basket__btn">장바구니</button>
      </div>

      <!-- 장바구니 테이블 시작 -->
      <table class="cart__list">
        <form>
          <!-- 장바구니 테이블 헤드 -->
          <thead>
            <tr>
              <td style="width: 2%">
                <input onclick="checkedAll()" id="checkAll" type="checkbox" name="" />
              </td>
              <td colspan="2">상품정보</td>
              <td>옵션</td>
              <td>상품금액</td>
              <td>-</td>
            </tr>
          </thead>
          <!-- 장바구니 목록 리스트 시작 -->
          <tbody>
            <!-- 첫번째 목록 -->
            <tr class="cart__list__detail">
              <td style="width: 2%">
                <input onclick="" type="checkbox" name="tiket" value=40000 />
              </td>
              <td style="width: 10%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/28/1709101716-39-3_wonbon_N_7_255x357_70_2.jpg"
                  alt="내일은 내일에게"
                />
              </td>
              <td>
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>내일은 내일에게</a></div>

                <span>20% </span>
                <span style="text-decoration: line-through; color: lightgray"
                  >50,000원</span
                >
                <div class="price" style="text-align: start">40,000원</div>
              </td>
              <td class="cart__list__option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />

                <button class="cart__list__optionbtn">주문 수정</button>
              </td>
              <td>
                <span class="price">40,000원</span><br />
              </td>
              <td style="width: 15%"><button class="cart__list__cansel">X</button></td>
            </tr>
            <!-- 두번째 목록 -->
            <tr class="cart__list__detail">
              <td style="width: 2%">
                <input type="checkbox" name="tiket" value=32000 />
              </td>
              <td style="width: 13%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2021/05/21/1621550193-67-0_wonbon_N_7_255x357_70_2.jpg"
                  alt="너의 목소리가 들려"
                />
              </td>
              <td>
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>너의 목소리가 들려</a></div>

                <span>20% </span>
                <span style="text-decoration: line-through; color: lightgray"
                  >40,000원</span
                >
                <div class="price" style="text-align: start">32,000원</div>
              </td>
              <td class="cart__list__option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />

                <button class="cart__list__optionbtn">주문 수정</button>
              </td>
              <td>
                <span class="price">32,000원</span><br/>
              </td>
              <td style="width: 15%"><button class="cart__list__cansel">X</button></td>
            </tr>
            <!-- 세번째 목록 -->
            <tr class="cart__list__detail">
              <td style="width: 2%">
                <input type="checkbox" name="tiket" value=30800 />
              </td>
              <td style="width: 13%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/08/1707371922-53-3_wonbon_N_7_255x357_70_2.jpg"
                  alt="내일은 내일에게"
                />
              </td>
              <td>
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>내일은 내일에게</a></div>

                <span>20% </span>
                <span style="text-decoration: line-through; color: lightgray"
                  >38,000원</span
                >
                <div class="price" style="text-align: start">30,800원</div>
              </td>
              <td class="cart__list__option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />

                <button class="cart__list__optionbtn">주문 수정</button>
              </td>
              <td>
                <span class="price">30,800원</span><br />
              </td>
              <td style="width: 15%"><button class="cart__list__cansel">X</button></td>
            </tr>
          </tbody>

        </form>
      </table>
      <!-- 장바구니 유의점 안내 -->
        <div class="cart__info" style="margin-top: 20px">
            <ul>
              <li >장바구니 상품은 최대 90일간 저장됩니다.</li>
              <li>
			                가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.
              </li>
              <li>
			                오늘출발 정보는 판매자가 설정한 정보에 의해 제공되며, 물류위탁
			                상품인 경우 물류사의 사정에 따라 실제와 다를 수 있습니다.
              </li>
              <li>
			                일부 상품의 경우 카드 할부기간이 카드사 제공 기간보다 적게
			                제공될 수 있습니다.
              </li>
            </ul>
        </div>
      
      <div class="cart__mainbtns">
        <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
        <button onclick="priceSum()" class="cart__bigorderbtn right">주문하기</button>
      </div>
    </section>
    <!-- footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
  </body>
</html>