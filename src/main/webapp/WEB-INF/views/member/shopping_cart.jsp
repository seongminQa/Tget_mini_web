<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
    	// 총 결제금액을 계산하는 함수
    	function getTotalPrice() {
    		//체크되어 있는 놈의 금액을 누적
    		//누적된 금액을
    		//총 금액을 나타내는 span 태그에 넣기
    		console.log("getTotalPrice() 실행");
    		const checkboxes = document.querySelectorAll('input[name=tiket]:checked');
    	    var totalPrice = 0;
    	    
    	    checkboxes.forEach(checkbox => {
    	        totalPrice += parseInt(checkbox.value);
    	    });

    	    // 총 결제 금액을 화면에 표시
    	    document.getElementById('totalPrice').innerText = '총 결제 금액 : ' + totalPrice + '원';
    	}
		
		function updateTotalPrice() {
			const ch = document.querySelector('#checkAll');
			const checkboxes = document.querySelectorAll('input[name=tiket]');
			
			if(ch.checked){
				console.log("체크박스 전체 선택")
				for(const checkbox of checkboxes){
					if(checkbox.checked == false){
						checkbox.checked = true;
						totalPrice += parseInt(checkbox.value);
					}
				}
			}
			else{
				console.log("체크박스 전체 선택 해제")
				for(const checkbox of checkboxes){
					checkbox.checked = false;
					totalPrice = 0;
				}
			}
			
			getTotalPrice();
		}
		
		// 선택 체크박스에 대한 결제금액 보여주기
		function updateSelectPrice(cno, pprice) {
			// 전체 체크박스 태그 찾기
			const ch = document.querySelector('#checkAll');
			const checkboxes = document.querySelectorAll('input[name=tiket]');
			
			// 선택한 체크 박스 찾기
			const selectBox = document.getElementById('cartitem-'+cno);
			
			// 수량을 나타내는 input태그의 수량 값
			var oamountValue = document.getElementById('oamount-'+cno).value;
			
			// 이 카트 아이템의 값 계산하기
			var currentValue = pprice*oamountValue;
			
			// 선택한 체크박스가 체크된다면
			if(selectBox.checked){
				console.log(cno + "번 체크 됨");
				// 현재 체크박스를 선택했을 때, 전체 체크박스가 선택되어 있다면 전체 체크박스 상태를 true로 바꾸어주기
				var allChecked = true;
			    for (const checkbox of checkboxes) {
			        if (!checkbox.checked) {
			            allChecked = false;
			            break;
			        }
			    }
			    if (allChecked) {
			        ch.checked = true;
			    }
			}
			
			if(!selectBox.checked){
				// 전체 체크박스 체크 상태 해제하기
				ch.checked = false;
				console.log(cno + "번 체크 풀림");
			}
			
			getTotalPrice();
		}

		// -, + 클릭 시 ${cartItem.oamount}값 변경하기
		function amountPlus(cno, pprice) {
			// 수량을 나타내는 input태그 찾기
			var oamountTag = document.getElementById('oamount-'+cno);
			// 플러스 버튼을 누를 시 해당 input 태그의 수량 값을 +1 더하고, value 속성의 값을 변경시킨다.
			var oamountValue = parseInt(oamountTag.value) + 1;
			oamountTag.value = oamountValue;
			// 콘솔로 확인
			console.log("cno : " + cno, "oamountTag.value :" + oamountTag.value);
			// 체크 박스의 태그 찾기
			const inputbox = document.getElementById('cartitem-'+cno);
			// 수량만큼 상품의 결제값을 변경
			var itemResultPrice = pprice*oamountValue;
			inputbox.value = itemResultPrice;
			
			document.getElementById('itemResultPrice-'+cno).innerText = itemResultPrice + '원';

			getTotalPrice();
		}
		
		function amountMinus(cno, pprice) {
			// 수량을 나타내는 태그 찾기
			var oamountTag = document.getElementById('oamount-'+cno);
			// 체크박스 찾기
			const inputbox = document.getElementById('cartitem-'+cno);
			
			// 수량이 1보다 클 때만 마이너스 할 수 있음.
			if(oamountTag.value > 1) {
				// 수량이 1보다 클 때 버튼을 클릭한다면 (원래의 수량 - 1)
				var oamountValue = parseInt(oamountTag.value) - 1;
				// 변경된 수량을 '수량을 나타내는 태그의 value 속성값에 적용'
				oamountTag.value = oamountValue;
				// 콘솔로 확인
				console.log("cno : " + cno, "oamountTag.value :" + oamountTag.value);
				// 수량만큼 상품의 결제값을 변경
				var itemResultPrice = pprice*oamountValue;
				// 해당 체크박스의 value 속성값을 변경
				inputbox.value = itemResultPrice;
				//totalPrice -= itemResultPrice;
				document.getElementById('itemResultPrice-'+cno).innerText = itemResultPrice + '원';
			} else {
				alert("수량은 1보다 작을 수 없습니다.");
			}

			getTotalPrice();
		}

		
		// CartItem 업데이트  
		function updateCartItem(pno) {
			var amount = $("#amount"+pno).val();
			
			$.ajax({
				url: "updateCartItem",
				method: "post",
				data: {pno:pno, oamount:amount},
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
          <input onchange="updateTotalPrice()" id="checkAll" type="checkbox" name="" class="ms-2" style="zoom: 2;"/>
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
            	<!-- 목록 -->
            <c:forEach var="cartitem" items="${cartList}">
	            <tr class="cart_list_detail">
	              <td style="width: 3%">
	                <input id="cartitem-${cartitem.cno}" onchange="updateSelectPrice(${cartitem.cno}, ${cartitem.pprice})" type="checkbox" 
	                name="tiket" value="${cartitem.pprice}" style="zoom: 1.4;"/>
	              </td>
	              <td style="width: 10%">
	                <img src="attachProduct?pno=${cartitem.pno}" width="90" height="54">
	              </td>
	              <td style="text-align: start;">
	                <div>
	                <a href="${pageContext.request.contextPath}/product/detail?pno=${cartitem.pno}">주소 : ${cartitem.paddress} / ${cartitem.pplace}</a>
	                </div>
	                <div class="cart__list__smartstore">${cartitem.pkind}</div>
	                <div>제목 : ${cartitem.ptitle}</div>
	
	                <span>20%</span>
	                <!-- 가격 할인 표현하기 -->
	                <span style="text-decoration: line-through; color: lightgray"
	                  >가격 : <fmt:formatNumber value="${cartitem.pprice}" pattern="#,###" />원</span>
	                <div class="price" style="text-align: start">할인 후 가격 : <fmt:formatNumber value="${cartitem.pprice}" pattern="#,###" />원</div>
	              </td>
	              <td class="cart__list__option" style="width: 27%">
	                <span>>날짜 : <fmt:formatDate value="${cartitem.odate}" pattern="yyyy-MM-dd"/></span><br />
	                
	                <span>>시간 : 1시50분 특가</span><br />
	                <span>
	                	<span>${cartitem.cno}</span>
	                	<button type="button" onclick="amountMinus(${cartitem.cno}, ${cartitem.pprice})" class="btn btn-outline-secondary btn-sm">-</button>
	                	<%-- >수량 : ${cartitem.oamount}매 --%>
	                	<input type="text" id="oamount-${cartitem.cno}" value="${cartitem.oamount}" style="width:30px;" readonly="readonly"/>
	                	<button type="button" onclick="amountPlus(${cartitem.cno}, ${cartitem.pprice})" class="btn btn-outline-secondary btn-sm">+</button>
	                	<%-- <button onclick="amountPlus('plus', ${cartitem.cno})" class="btn btn-outline-secondary btn-sm">+</button> --%>
	                	<%-- <input type="number" id="amount${cartItem.pno}" value="${cartItem.oamount}" style="width:60px;" /> --%>
	                </span>
	                <br />
					<span class="seatGrade">${cartitem.oseatgrade}</span><br />
					<!-- 주문 수정 버튼 미구현 // 추후 어떻게 기능을 구현할 지 미정 -->
	                <a href="${pageContext.request.contextPath}/product/detail?pno=${cartitem.pno}" class="cart_list_optionbtn">주문 수정</a>
	              </td>
	              <!-- 상품 금액 표시 셀 -->
	              <td>
	                <span id="itemResultPrice-${cartitem.cno}" class="price"><fmt:formatNumber value="${cartitem.resultprice}" pattern="#,###" />원</span><br />
	              </td>
	              <!-- 취소 버튼 표시 // 미구현 -->
	              <td style="width: 15%">
	              		<a href="removeCartItem?cno=${cartitem.cno}">
	              			<img style="width:30%; height: 30%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/>
	              		</a>
	              	<!-- <div class="cart__list__cansel" style="border:none; background-color:transparent;">
	              	</div> -->
	              </td>
	            </tr>
           </c:forEach>
            
            <tr style="font-size: 20px;">
              <td colspan="6">
              		<!-- 자바스크립트로 구현** AJAX? -->
                	<span id="totalPrice">총 결제 금액 : ????</span>
              </td>
            </tr>
            
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
                  <a href="detail?pno=${product.pno}" class="product_link" style="padding: 0px; margin: 0px;">
                  <a href="#" class="product_link" style="padding: 0px; margin: 0px;">
                    <div class="product_imgbox">
                      <img src="attachProduct?pno=${product.pno}" alt="" class="product_img" style="width: 60%; height: 80%">
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
                  <!-- <button onclick="priceSort()" class="btn btn-outline-secondary">장바구니 추가</button> -->
                  <button onclick="updateCartItem(${product.pno})" class="btn btn-outline-secondary">장바구니 추가</button>
                </div>
              </li>
            </c:forEach>
          </ul>
        </div>
      </section>
    </section>
    <!-- footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
    
    <!-- 주문 모달 -->
    
  </body>
</html>