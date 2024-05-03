<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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

    <!-- shopping_cart css -->
    <link rel="stylesheet" href="/Tget_mini_web/resources/css/shopping_cart.css"/>
    
    <!-- 체크박스 전체 선택 자바스크립트 참조 -->
    <!-- defer 속성은 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행됨을 명시 -->
	<!-- <script defer src="/Tget_mini_web/resources/js/shopping_cart.js"></script> -->
    
    <!-- 사용자 정의 자바스크립트 -->
    <script>
		 // 체크박스 전체 선택 or 전체 선택 해제 (자바스크립트)
		 function checkedAll() {
			 // 아이디 값이 checkAll인 것을 찾아 ch 변수에 저장
			 const ch = document.querySelector('#checkAll');
			 // ch 가 클릭 되었을 때 이벤트 함수 발생
			
			const checkboxes = document.querySelectorAll('input[name=tiket]');
			if(ch.checked){
				console.log("체크박스 전체 선택")
				for(const checkbox of checkboxes){
					checkbox.checked = true;
				}
			}
			else{
				console.log("체크박스 전체 선택 해제")
				for(const checkbox of checkboxes){
					checkbox.checked = false;
				}
			}
		}

		
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
			if(totalSum === 0){
				console.log("총 합계: " + totalSum);
				alert("구매할 상품을 체크해주세요!");
			} else {
				console.log("총 합계: " + totalSum);				
				alert("총 합계: " + totalSum);
			}
		};
		
		function updateCartItem(pno) {
			var amount = $("#amount"+pno).val();
			
			$.ajax({
				url: "updateCartItem",  // 요청 경로
				method: "post",
				data: {pno:pno, amount:amount},
				success: function(data) {
					console.log(data);
				}
			});
		}		

      </script>
    
    <!-- 테스트용 css -->
    <style>
		*{
			/* border:1px solid blue; */
		}
		a {
			text-decoration: none;
		}
		.list_price{
			font-size: 20px;
		}
		#shopping_button {
        background-color: white;
        border: 1px lightgray solid;
        width: 162px;
		}
		
		#shopping_button:hover {
		  background-color: skyblue;
		}
		
		#order_button,
		.cart_list_optionbtn {
		  background-color: #d95b96;
		  color: white;
		  border: none;
		}
		
		#order_button {
		  width: 162px;
		}
    </style>
  </head>
  <body>
  	<!-- header(헤더) -->
  	<%@include file="/WEB-INF/views/common/header.jsp"%>
    <!-- 장바구니 시작 -->
    <section class="container text-center mt-3 mb-5">
      <div class="cart_title">
        <div class="d-flex justify-content-start " style="color: #d95b96;">
          <input onclick="checkedAll()" id="checkAll" type="checkbox" name="" class="ms-2" style="zoom: 2;"/>
          <h1 class="m-3">장바구니</h1>
        </div>
      </div>

      <!-- 장바구니 테이블 시작 -->
      <table class="cart_list">
        <form>
          <!-- 장바구니 테이블 헤드 -->
          <thead class="text-center" style="font-size: 18px; font-weight: bold; background-color: #d95b96;">
            <tr>
              <td colspan="3">상품정보</td>
              <td>옵션</td>
              <td>상품금액</td>
              <td>취소</td>
            </tr>
          </thead>
          <!-- 장바구니 목록 리스트 시작 -->
          <tbody>
            <!-- 첫번째 목록 -->
            <tr class="cart_list_detail">
              <td style="width: 3%">
                <input onclick="" type="checkbox" name="tiket" value="40000" style="zoom: 1.4;"/>
              </td>
              <td style="width: 10%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/28/1709101716-39-3_wonbon_N_7_255x357_70_2.jpg"
                  alt="내일은 내일에게" style="width: 80%;"
                />
              </td>
              <td style="text-align: start;">
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>내일은 내일에게</a></div>

                <span>20%</span>
                <!-- 가격 할인 표현하기 -->
                <span style="text-decoration: line-through; color: lightgray"
                  >50,000원</span
                >
                <div class="price" style="text-align: start">40,000원</div>
              </td>
              <td class="cart__list__option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />
				
				<!-- 주문 수정 버튼 미구현 // 추후 어떻게 기능을 구현할 지 미정 -->
                <button class="cart_list_optionbtn">주문 수정</button>
              </td>
              <!-- 상품 금액 표시 셀 -->
              <td>
                <span class="price">40,000원</span><br />
              </td>
              <!-- 취소 버튼 표시 // 미구현 -->
              <td style="width: 15%">
              	<button class="cart__list__cansel" style="border:none; background-color:transparent;">
              		<img style="width:140%; height: 140%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/>
              	</button>
              </td>
            </tr>
            <!-- 두번째 목록 -->
            <tr class="cart_list_detail">
              <td style="width: 2%">
                <input type="checkbox" name="tiket" value=32000 style="zoom: 1.4;"/>
              </td>
              <td style="width: 13%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2021/05/21/1621550193-67-0_wonbon_N_7_255x357_70_2.jpg"
                  alt="너의 목소리가 들려" style="width: 80%;"
                />
              </td>
              <td style="text-align: start;">
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>너의 목소리가 들려</a></div>

                <span>20% </span>
                <span style="text-decoration: line-through; color: lightgray"
                  >40,000원</span
                >
                <div class="price" style="text-align: start">32,000원</div>
              </td>
              <td class="cart_list_option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />

                <button class="cart_list_optionbtn">주문 수정</button>
              </td>
              <td>
                <span class="price">32,000원</span><br/>
              </td>
              <td style="width: 15%"><button class="cart__list__cansel" style="border:none; background-color:transparent;"><img style="width:140%; height: 140%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/></button></td>
            </tr>
            <!-- 세번째 목록 -->
            <tr class="cart_list_detail">
              <td style="width: 2%">
                <input type="checkbox" name="tiket" value=30800 style="zoom: 1.4;"/>
              </td>
              <td style="width: 13%">
                <img
                  src="https://timeticket.co.kr/wys2/file_attach_thumb/2024/02/08/1707371922-53-3_wonbon_N_7_255x357_70_2.jpg"
                  alt="내일은 내일에게" style="width: 80%;"
                />
              </td>
              <td style="text-align: start;">
                <div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
                <div class="cart__list__smartstore">대학로인기연극</div>
                <div><a>내일은 내일에게</a></div>

                <span>20% </span>
                <span style="text-decoration: line-through; color: lightgray"
                  >38,000원</span
                >
                <div class="price">30,800원</div>
              </td>
              <td class="cart_list_option" style="width: 27%">
                <span>>날짜 : 4월13일</span><br />
                <span>>시간 : 1시50분 특가</span><br />
                <span>>수량 : 1매</span><br />

                <button class="cart_list_optionbtn">주문 수정</button>
              </td>
              <td>
                <span class="price">30,800원</span><br />
              </td>
              <td style="width: 15%"><button class="cart__list__cansel" style="border:none; background-color:transparent;"><img style="width:140%; height: 140%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/></button></td>
            </tr>
            <tr style="font-size: 20px;">
              <td colspan="6">
                	총 결제 금액 : ????
              </td>
            </tr>
            <!-- 연습 -->
            <%-- <c:forEach var="cartItem" items="${cart}">

				<tr class="cart__list__detail">
					<td style="width: 2%">
	                	<input type="checkbox" name="tiket" value=${cartItem.product.pprice} />
					</td>
					<td style="width: 13%">
						<img src="${cartItem.product.pimg}" alt="${cartItem.product.ptitle}"/>
					</td>
					<td>
						<div><a href="#">대학로 혜화역 코미디 연극 예매</a></div>
	                	<div class="cart__list__smartstore">대학로인기연극</div>
	                	<div><a>${cartItem.product.ptitle}</a></div>
	                	<span>20% </span>
	                	<span style="text-decoration: line-through; color: lightgray">38,000원</span>
	                	<div class="price" style="text-align: start">30,800원</div>
              		</td>
              		<td class="cart__list__option" style="width: 27%">
		                <span>>날짜 : 4월13일</span><br />
		                <span>>시간 : 1시50분 특가</span><br />
		                <span>>수량 : 1매</span><br />
						<input type="number" id="amount${cartItem.product.pno}" value="${cartItem.amount}" style="width:60px;" />
		                <button onclick="updateCartItem(${cartItem.cartItem.product.pno})" class="cart__list__optionbtn">주문 수정</button>
					</td>
					<td>
						<span class="price">${cartItem.product.pprice}원</span><br />
					</td>
					<td style="width: 15%"><button href="removeCartItem?pno=${cartItem.product.pno}" class="cart__list__cansel" style="border:none; background-color:transparent;"><img style="width:140%; height: 140%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/></button></td>
				</tr>						    	
	    	</c:forEach> --%>
            
          </tbody>

        </form>
      </table>
      <!-- 장바구니 사용 유의점 안내 -->
        <div class="cart_info" style="text-align: start; margin-top: 20px;">
            <ul>
              <li style="color: #d95b96;">장바구니 상품은 최대 90일간 저장됩니다.</li>
              <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
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
        
		
      <div class="cart__mainbtns mb-5">
        <button class="cart__bigorderbtn left"><a href="${pageContext.request.contextPath}/shopping/productList" style="text-decoration: none">쇼핑 계속하기</a></button>
        <button onclick="priceSum()" class="cart__bigorderbtn right">주문하기</button>
      </div>
      <!-- 추천 상품 목록 뿌리기 -->
      <!-- ul 리스트로 구현해보기 -->
      <section class="grid">
        <div class="d-flex justify-content-start align-items-center">
	      <h3>다른 상품 둘러보기</h3>
		</div>
		<hr/>
        <div class="grid other_product">
          <ul class="product_list">
            <!-- 상품 리스트 있는 만큼 반복 -->
            <c:forEach var="product" items="${productList}">
              <li class="product_grid_item text-center m-2" style="display: inline-block;">
                <div class="product_grid_unit">
                  <!-- 해당 상품 클릭시 상품 상세페이지로 전환 -->
                  <%-- <a href="detail?pno=${product.pno}" class="product_link" style="padding: 0px; margin: 0px;"> --%>
                  <a href="#" class="product_link" style="padding: 0px; margin: 0px;">
                    <div class="product_imgbox">
                      <img src="${product.pimg}" alt="" class="product_img" style="width: 60%; height: 80%">
                    </div>
                    <div class="cart_product_info">
                      <div class="list_price">
                      	<b>${product.pprice}원</b>
                      </div>
                      <div class="cart_sideinfo">
                        <span class="product_place">
                          ${product.pplace}
                        </span>
                        <br>
                        <span>
                        	${product.ptitle}
                        </span>
                      </div>
                      <!-- 상품 플래그가 필요할까? -->
                      <div class="product_flag">
                        <div class="flag_area"></div>
                      </div>
                    </div>
                  </a>
                  <button onclick="priceSort()" class="btn btn-outline-secondary">장바구니 추가</button>
                </div>
              </li>
            </c:forEach>
          </ul>
        </div>
      </section>
    </section>
    <!-- footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
  </body>
</html>