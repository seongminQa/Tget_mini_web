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
    <script defer>
       // 총 결제금액을 계산하고 텍스트에 보여주는 함수
       function getTotalPrice() {
          //체크되어 있는 태그들을 찾아 금액을 누적
          //누적된 금액을 더하고 총 금액을 나타내는 span 태그에 넣기
          console.log("getTotalPrice() 실행");
          // input태그 중 name이 tiket이고 check가 되어있는 태그들을 찾아 checkboxes 변수에 저장
          const checkboxes = document.querySelectorAll('input[name=tiket]:checked');
          // 총 합을 위한 변수 선언과 초기화
           var totalPrice = 0;
           // 체크된 태그들을 foreach문을 돌려 해당 value(금액)들을 합한다.
           checkboxes.forEach(checkbox => {
               totalPrice += parseInt(checkbox.value);
           });
   
           // 총 결제 금액을 화면에 표시
           document.getElementById('totalPrice').innerText = '총 결제 금액 : ' + totalPrice + '원';
       }
      
       // 전체 체크박스의 태그를 찾고
       // 각 체크박스들을 찾아 전체 체크와 체크된 상품의 가격을 합산한다.
      function updateTotalPrice() {
          // 전체 선택 체크박스 태그를 찾아 ch변수에 저장
         const ch = document.querySelector('#checkAll');
         // input태그 중 name이 tiket이고 check가 되어있는 태그들을 찾아 checkboxes 변수에 저장
         const checkboxes = document.querySelectorAll('input[name=tiket]');
         // 전체 선택 체크박스가 체크되어 있다면 실행
         if(ch.checked){
            // for 반복문을 이용하여 체크가 안된 태그들을 체크해준다.
            for(const checkbox of checkboxes){
               if(checkbox.checked == false){
                  checkbox.checked = true;
               }
            }
         }
         else{
            // 전체 체크 박스가 해제된다면 모든 체크박스 선택 해제
            for(const checkbox of checkboxes){
               checkbox.checked = false;
            }
         }
         
         getTotalPrice();
      }
      
      // 선택 체크박스에 대해서 실시간 결제금액 보여주기
      function updateSelectPrice(cno, pprice) {
         // 전체 체크박스 태그 찾기
         const ch = document.querySelector('#checkAll');
         const checkboxes = document.querySelectorAll('input[name=tiket]');
         
         // 선택한 체크 박스 찾기
         const selectBox = document.getElementById('cartitem-'+cno);
         
         // 수량을 나타내는 input태그의 수량 값
         var oamountValue = document.getElementById('oamount-'+cno).value;
         
         // 이 카트 아이템의 값 계산하고 태그의 value값 변경
         var currentValue = pprice*oamountValue;
         selectBox.value = currentValue;
         
         // 선택한 체크박스가 체크된다면
         if(selectBox.checked){
            // 현재 체크박스를 선택했을 때, 전체 체크박스가 선택되어 있다면 전체 체크박스 상태를 true로 바꾸어주기
            var allChecked = true; // flag 역할
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
            // 전체 체크박스 체크 상태 해제
            ch.checked = false;
         }
         getTotalPrice();
      }
   
      // + 클릭 시 ${cartItem.oamount}값 변경하기
      function amountPlus(cno, pprice) {
         // 수량을 나타내는 input태그 찾기
         var oamountTag = document.getElementById('oamount-'+cno);
         // 플러스 버튼을 누를 시 해당 input 태그의 수량 값을 +1 더하고, value 속성의 값을 변경시킨다.
         var oamountValue = parseInt(oamountTag.value) + 1;
         oamountTag.value = oamountValue;
         // 콘솔로 확인
         console.log("cno : " + cno, "oamountTag.value :" + oamountTag.value);
         // 체크 박스의 태그 찾기
         const checkbox = document.getElementById('cartitem-'+cno);
         // 수량만큼 상품의 결제값을 변경
         var itemResultPrice = pprice*oamountValue;
         // 해당 체크박스의 value 속성값을 변경
         checkbox.value = itemResultPrice;
         // 해당 상품금액을 보여주는 td셀의 text 변경
         document.getElementById('itemResultPrice-'+cno).innerText = itemResultPrice + '원';
   
         getTotalPrice();
         
         // AJAX 요청 보내기
          $.ajax({
              url: "updateCartItem", // 요청을 보낼 URL
              method: "POST", // HTTP 메서드 설정
              data: { cno: cno, amount: oamountValue }, // 전송할 데이터 설정 // 최종 결제금액은 orderInfo에 따로 보낸다.
              success: function(response) {
                  // 성공적으로 응답을 받았을 때 처리할 내용
                  // 예를 들어, 다른 페이지로 리다이렉트하거나 메시지를 표시할 수 있다.
                  console.log("주문 정보를 성공적으로 전송했습니다.");
              },
              error: function(xhr, status, error) {
                  // 요청이 실패했을 때 처리할 내용
                  console.error("주문 정보 전송에 실패했습니다.");
                  // 실패 메시지를 표시하거나 다시 시도할 수 있다.
              }
          });
      }
      
      // - 클릭 시 ${cartItem.oamount}값 변경하기
      function amountMinus(cno, pprice) {
         // 수량을 나타내는 태그 찾기
         var oamountTag = document.getElementById('oamount-'+cno);
         // 체크박스 찾기
         const checkbox = document.getElementById('cartitem-'+cno);
         
         // 수량이 1보다 클 때만 마이너스 할 수 있다.
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
            checkbox.value = itemResultPrice;
            // 해당 상품금액을 보여주는 td셀의 text 변경
            document.getElementById('itemResultPrice-'+cno).innerText = itemResultPrice + '원';
         } else {
            alert("수량은 1보다 작을 수 없습니다.");
         }
   
         getTotalPrice();
         
         // AJAX 요청 보내기
          $.ajax({
              url: "updateCartItem", // 요청을 보낼 URL
              method: "POST", // HTTP 메서드 설정
              data: { cno: cno, amount: oamountValue }, // 전송할 데이터 설정
              success: function(response) {
                  // 성공적으로 응답을 받았을 때 처리할 내용
                  // 예를 들어, 다른 페이지로 리다이렉트하거나 메시지를 표시할 수 있다.
                  console.log("주문 정보를 성공적으로 전송했습니다.");
              },
              error: function(xhr, status, error) {
                  // 요청이 실패했을 때 처리할 내용
                  console.error("주문 정보 전송에 실패했습니다.");
                  // 실패 메시지를 표시하거나 다시 시도할 수 있다.
              }
          });
      }
   
      // 주문하기 버튼을 클릭하여 선택된 체크박스의 값 수집
      /* function order() {
         // 체크된 cno찾기
         const checkboxes = document.querySelectorAll("input[name=tiket]");
         
         const form = document.createElement('form');
           form.setAttribute('method', 'post');
           form.setAttribute('action', 'temporder');
         for (const checkbox of checkboxes) {
              if (checkbox.checked) {
                 console.log(checkbox.id.substr(9));
                 const input = document.createElement('input');
                 input.setAttribute('name', 'cno');
                 input.setAttribute('value', parseInt(checkbox.id.substr(9)));
                 form.appendChild(input);
              }
          }
         document.body.appendChild(form);
           form.submit();
      } */
        
        // 주문하기 버튼을 눌렀을 때
        // 체크된 상품들의 정보와 총 결제금액을 비동기적으로 모달창에 정보를 전달하고 실행하기 위해 사용
        function order() {
            // 체크된 cno 찾기
            const checkboxes = document.querySelectorAll("input[name=tiket]");
            // 체크된 cno값들을 찾아 cno[] 배열에 값을 저장한다.
            var cno = [];
            // 체크된 박스가 있는지 확인
            var length = 0;
         	// 체크된 input 태그들을 찾아 cno값을 구하고, cno[] 배열에 저장
            for (const checkbox of checkboxes) {
                if (checkbox.checked) {
                    console.log(checkbox.id.substr(9));
                    cno.push(parseInt(checkbox.id.substr(9)));
                    console.log(cno);
                    length++;
                }
            }
         	if(length > 0) {
	         	// 모달의 id를 이용하여 주문하기 버튼을 눌렀을 때 실행할 수 있도록 해당 모달태그를 찾음
	            const previousOrderModal = document.getElementById('previousOrderModal');
	            
	            // AJAX 요청 보내기
	            $.ajax({
	                url: "temporder", // 임시로 데이터를 보낼 URL인 "temporder"
	                method: "POST",
	                contentType: "application/json", // cno[](JSON 데이터형식)를 보내기위해 사용. contentType이 명시되지 않으면 기본값인 application/x-www-form-urlencoded가 사용
	                data: JSON.stringify(cno), // 전송할 데이터 설정
	                success: function(response) {
	                    // 성공적으로 응답을 받았을 때 처리할 내용
	                    console.log("주문 정보를 성공적으로 전송했습니다.");
	                    console.log(response); // 서버 응답 데이터 확인
	                   // tempDtoList를 'temporder' 컨트롤러에서 응답받은 JSON 객체 값을 저장 
	                    const tempDtoList = response.tempDtoList;
	                    const ordertotalPrice = response.ordertotalPrice;
	               
	                    // 응답이 성공했다면 실행
	                    if (response.result === "success") {
	   
	                       // tempDtoList를 이용하여 모달창에서 HTML 업데이트
	                       // 주문 모달창의 Body 부분의 태그를 찾아 innerHTML로 화면을 꾸며준다.
	                       const oderModalBody = document.getElementById('oderModalBody');
	                       oderModalBody.innerHTML = ""; // 초기화
	                       oderModalBody.innerHTML = `
	                           <div class="row w-100">
	                               <div class="col-6">
	                                   <img src="attachProduct?pno=`
	                                         + tempDtoList[0].pno +
	                                         `" style="width:90%; height:370px"/>
	                               </div>
	                               <div class="col-6 ps-3 pt-3">
	                                   <h4 class="ps-3">
	                                       <strong>`
	                                       + tempDtoList[0].pkind +
	                                       ` - `
	                                       + tempDtoList[0].ptitle +
	                                       ` <br>포함 총 ` + tempDtoList.length + `건</strong>
	                                   </h4>
	   
	                                   <ul id="tempItemList">
	                                   </ul>
	                                   
	                                   <div class="ps-3 pt-4" >
	                                       <table width="100%" style="text-align: center;">
	                                           <th style="background-color: #D95B96; color: white">합계</th>
	                                           <tr id="ordertotalPriceRow">
	                                               <td style="border: 1px solid #D95B96; font-weight: bold; font-size: 30px;">`
	                                               + ordertotalPrice + ` 원</td>
	                                           </tr>
	                                       </table>
	                                   </div>
	                               </div>
	                           </div>
	                       `;
	                       
	                  function formatDate(inputString) {
	                      // 주어진 문자열을 공백을 기준으로 나누어 배열로 저장
	                      const parts = inputString.split(" ");
	                  
	                      // 배열에서 연도, 월, 일 정보 추출
	                      const year = parts[5];
	                      const monthStr = parts[1];
	                      const day = parts[2];
	                  
	                      // 월을 숫자로 변환
	                      const months = {
	                          "Jan": "01",
	                          "Feb": "02",
	                          "Mar": "03",
	                          "Apr": "04",
	                          "May": "05",
	                          "Jun": "06",
	                          "Jul": "07",
	                          "Aug": "08",
	                          "Sep": "09",
	                          "Oct": "10",
	                          "Nov": "11",
	                          "Dec": "12"
	                      };
	                      const month = months[monthStr];
	                      
	                      console.log(year);
	                      console.log(month);
	                      console.log(day);
	                  
	                      // YYYY-MM-DD 형식의 날짜 문자열 반환
	                      return year.toString() + " / " + month.toString() + " / " + day.toString();
	                  }
	   
	                       // tempItemList에 항목 추가
	                       const tempItemList = document.getElementById('tempItemList');
	                       tempDtoList.forEach(tempItem => {
	                           const listItem = document.createElement('li');
	                           //const date = new Date(tempItem.odate); // Date 객체로 변환
	                           console.log(tempItem.odate);
	                           console.log(typeof tempItem.odate); // string 형식.
	                           
	                           // tempItem.odate를 먼저 '2024-05-20' 형식으로 변환해주어야 한다. 
	                           // date형식으로 변환해야 한다.
	   
	                           listItem.innerHTML = `
	                              ` + formatDate(tempItem.odate) + ` – ` + tempItem.ptitle + ` (` + tempItem.oamount + `매)
	                           `;
	                           tempItemList.appendChild(listItem);
	                       });
	   
	                       $(previousOrderModal).modal('show'); // 모달을 띄우기.
	                   } else {
	                       console.error("Error in response: ", response);
	                   }
	                      
	                   },
	                   error: function(xhr, status, error) {
	                       // 요청이 실패했을 때 처리할 내용
	                       console.error("주문 정보 전송에 실패했습니다.");
	                       // 실패 메시지를 표시하거나 다시 시도할 수 있습니다.
	                   }
	               });
         	  } else {
         		  alert("선택된 상품이 없습니다! 상품 선택 후 진행해주세요!");
         	  }
           }
         
         // 모달 초기화
         $(document).ready(function() {
             const previousOrderModal = document.getElementById('previousOrderModal');
             previousOrderModal.addEventListener('shown.bs.modal', () => {
                 previousOrderModal.focus();
             });
         });
   

      </script>
    
    <!-- 테스트용 css -->
    <style>
      *{
         /* border:1px solid blue; */
      }
      a {
         text-decoration: none;
         color: black;
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
          
			<c:if test="${empty cartList}">
			    <tr>
			        <td colspan="6" style="text-align: center;">
			            <img class="mt-5 mb-5" src="/Tget_mini_web/resources/image/shoppingcart/emptyCart.svg" alt="No items in cart" />
			            <p style="font-size: 2em;">장바구니에 담긴 상품이 없습니다.</p>
			        </td>
			    </tr>
			</c:if>
          
            <!-- 목록 -->
            <c:forEach var="cartitem" items="${cartList}" varStatus="i">
               <input id="pno${cartitem.cno}" type="hidden" value="${cartitem.pno}" />
               <input id="odate${cartitem.cno}" type="hidden" value="${cartitem.odate}" />
               
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
                     <a href="${pageContext.request.contextPath}/product/detail?pno=${cartitem.pno}" style="font-size:1.5em;"><b>제목 : ${cartitem.ptitle}</b></a>
                   </div>
                   <div class="cart__list__smartstore">${cartitem.pkind}</div>
                   <a>주소 : ${cartitem.paddress} / ${cartitem.pplace}</a><br>
                   <!-- 가격 할인 표현하기 -->
                   <span style="text-decoration: line-through; color: lightgray"
                     >가격 : <fmt:formatNumber value="${cartitem.pprice}" pattern="#,###" />원</span>
                   <div class="price" style="text-align: start">상품 가격 : <fmt:formatNumber value="${cartitem.pprice}" pattern="#,###" />원</div>
                 </td>
                 <td class="cart__list__option" style="width: 27%">
                   <span style="font-size: 1.2em"><b>>날짜 : <fmt:formatDate value="${cartitem.odate}" pattern="yyyy-MM-dd"/></b></span><br/>
                   <span>
                      <button type="button" onclick="amountMinus(${cartitem.cno}, ${cartitem.pprice})" class="btn btn-outline-secondary btn-sm rounded-circle"><b>-</b></button>
                      <input type="text" id="oamount-${cartitem.cno}" value="${cartitem.oamount}" style="width:30px;" readonly="readonly"/>
                      <button type="button" onclick="amountPlus(${cartitem.cno}, ${cartitem.pprice})" class="btn btn-outline-secondary btn-sm rounded-circle"><b>+</b></button>
                      <%-- <button onclick="amountPlus('plus', ${cartitem.cno})" class="btn btn-outline-secondary btn-sm">+</button> --%>
                      <%-- <input type="number" id="amount${cartItem.pno}" value="${cartItem.oamount}" style="width:60px;" /> --%>
                   </span><br>
                   <span class="seatGrade" style="font-size: 1.2em"><b>${cartitem.oseatgrade}</b></span>
                 </td>
                 <!-- 상품 금액 표시 셀 -->
                 <td>
                   <span id="itemResultPrice-${cartitem.cno}" class="price"><fmt:formatNumber value="${cartitem.resultprice}" pattern="#,###" />원</span><br />
                 </td>
                 <!-- 취소 버튼 표시 // 미구현 -->
                 <td style="width: 15%">
                       <a href="removeCartItem?cno=${cartitem.cno}" style="width:30%;">
                          <img style="width:30%; height: 30%;" src="/Tget_mini_web/resources/image/shoppingcart/trash.svg"/>
                       </a>
                    <!-- <div class="cart__list__cansel" style="border:none; background-color:transparent;">
                    </div> -->
                 </td>
               </tr>
           </c:forEach>
            
            <!-- 자바스크립트로 구현** AJAX? -->
            <c:if test="${!empty cartList}">
	            <tr style="font-size: 20px;">
	              <td colspan="6">
	                   <span id="totalPrice">총 결제 금액 : 0원 </span>
	              </td>
	            </tr>
            </c:if>
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
        <button class="cart__bigorderbtn left"><a href="${pageContext.request.contextPath}/product" style="text-decoration: none">쇼핑 계속하기</a></button>
        <!-- <button type="button" class="cart__bigorderbtn right" data-bs-toggle="modal" data-bs-target="#previousOrderModal">
           주문하기
      </button> -->
        <button onclick="order()" class="cart__bigorderbtn right">주문하기</button>
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
   <div class="modal fade" id="previousOrderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-xl">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header text-center">
           <h4 class="modal-title">선택 상품 결제하기</h4>
           <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body" style="height:500px">
         <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
         <!-- <form method="post" action="productSignUp" enctype="multipart/form-data"> -->
            
              <div id="oderModalBody" class="container d-flex" style="width:100%; height:80%">
                  <!-- 자바 스크립트 innerHTML 사용 -->
              </div>
              
              <div style="text-align: center; margin-top: 30px;" >
                  <button onclick="payment()" class="btn btn-sm" style="background-color: #D95B96; width:100%; color:white;">결제 하기</button>
              </div>
                
         <!-- </form> -->
         <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->      
         </div>
   
       </div>
     </div>
   </div>
   
   
  </body>
</html>