<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
		<style>
			.card-header {
				font-size: 20px;
				font-weight: bold;
				color: white;
				background-color: #D95B96;
			}
			ul {
				list-style: none;
			}
			a {
				text-decoration: none;
				color: #D95B96;
			}
			a:hover {
			  color : red;
			}
		</style>
		
		<script>
			// 파일 선택 시 바로 화면에 보여주기
			function previewFile(kind, pno) {
				if(kind == "new") {
					var input = event.target;
					console.log(input);
					var reader = new FileReader(); // FileReader객체 생성. 파일을 읽어 결과를 데이터 URL로 변환하는데 사용
					if(input.files && input.files[0]) { // 파일 입력 요소에 파일이 있는지 확인
						reader.onload = function() { // 파일을 성공적으로 읽으면 실행되는 함수
							var imgTag = document.getElementById('repimg-container'); // 이미지 태그 찾기
							imgTag.setAttribute("src", reader.result);
							console.log(imgTag);
						};
						reader.readAsDataURL(input.files[0]);
					} else {
						document.getElementById('repimg-container').src = "";
					}
				} 
				
				if(kind == "update"){
					var input = event.target;
					console.log(input);
					var reader = new FileReader();
					if(input.files && input.files[0]) {
						reader.onload = function() {
							var imgTag = document.getElementById('repimg-container-update-'+pno);
							imgTag.setAttribute("src", reader.result);
							console.log(imgTag);
						};
						reader.readAsDataURL(input.files[0]);
					} else {
						document.getElementById('repimg-container-update-'+pno).src = "";
					}
				}
			}
		</script>
</head>
<body>

	<div class="container d-flex flex-column "><!-- viewport height -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1 m-2">
			<div class="d-flex row">
				<div class="col-lg-2">
					<%@include file="/WEB-INF/views/common/menu.jsp"%>				
				</div>
				
				<div class="col-lg-10">
					<!-- 유저 1 -->
					<div class="card">
						<div class="card-header">상품 관리</div>
						<div class="card-body">
							<table class="table table-hover text-center">
								<thead>
									<tr style="font-size: 18px;">
										<th>상품 번호</th>
										<th>분류</th>
										<th>포스터</th>
										<th>제목</th>
										<th>장소</th>
										<th>공연기간</th>
										<th>가격</th>
										<th>-</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="product" items="${productList}">
										<tr>
											<td>${product.pno}</td>
											<td>${product.pkind}</td>
											<td><img src="attachProduct?pno=${product.pno}" width="90" height="54"></td>
											<td><a href="${pageContext.request.contextPath}/product/detail?pno=${product.pno}">${product.ptitle}</a></td>
											<td>${product.pplace}</td>
											<td>
												<fmt:formatDate value="${product.pdatestart}" pattern="yyyy-MM-dd"/> ~ <br> 
												<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd"/>
												<%-- ${product.pdatestart} ~ <br> 
												${product.pdateend} --%>
											</td>
											<td>${product.pprice}</td>
											<td>
												<button type="button" class="btn btn-outline-secondary"
							 						data-bs-toggle="modal" data-bs-target="#productModify${product.pno}">
													수정
												</button>
												
												<!-- 상품 수정 및 삭제 Modal -->
												 <div class="modal fade" id="productModify${product.pno}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-lg">
												    <div class="modal-content">
												
												      <!-- Modal Header -->
												      <div class="modal-header text-center">
												        <h4 class="modal-title">상품 수정 및 삭제 페이지</h4>
												        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
												      </div>
												
												      <!-- Modal body -->
												      <div class="modal-body">
												      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
														<form method="post" action="productModify" enctype="multipart/form-data">
															<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
														   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
														   
															    <div class="container fluid" style="width:100%">
															      <div class="row" style="height: 100%;">
															        <div id="pictures" class="col" style="width:40%">
															          	<img id="repimg-container-update-${product.pno}" src="attachProduct?pno=${product.pno}" alt="" style="width:100%; height:100%">
															        </div>
															        <div class="col d-flex flex-column" style="width:60%">
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 번호 :
															                </span>
															              </div>
															              <input id="pno" type="number" name="pno" class="form-control"
															              	value="${product.pno}" readOnly>
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">분류 : 
															                </span>
															              </div>
															              <select class="form-control" id="" name="pkind">
															              	<c:if test="${product.pkind == '연극'}">
															              		<option value="${product.pkind}" selected="selected">${product.pkind}</option>
															              		<option value="뮤지컬">뮤지컬</option>
															              	</c:if>
															              	<c:if test="${product.pkind == '뮤지컬'}">
															              		<option value="${product.pkind}" selected="selected">${product.pkind}</option>
															                	<option value="연극">연극</option>
															              	</c:if>
															              </select>
															            </div>
															            
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">제목 :
															                </span>
															              </div>
															              <input id="ptitle" type="text" name="ptitle" class="form-control"
															              	value="${product.ptitle}">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">장소 :
															                </span>
															              </div>
															              <input id="pplace" type="text" name="pplace" class="form-control"
															              	value="${product.pplace}">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">가격 :
															                </span>
															              </div>
															              <input id="pprice" type="number" name="pprice" class="form-control"
															              	value="${product.pprice}">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 컨텐츠 :
															                </span>
															              </div>
															              <%-- <input id="pcontent" type="file" name="pcontentattach" class="form-control"
															              	value="${product.pcontent}"> --%>
															              <input id="pcontent" type="file" name="pcontentattach" class="form-control">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 포스터 :
															                </span>
															              </div>
															              <input id="pposter" type="file" name="pposterattach" class="form-control" accept="image/*" onchange="previewFile('update', ${product.pno})">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 판매 시작일 :
															                </span>
															              </div>
															              <input type="date" id="pdatestart" name="pdatestart" 
															              	value="<fmt:formatDate value="${product.pdatestart}" pattern="yyyy-MM-dd"/>"/>
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 판매 종료일 :
															                </span>
															              </div>
															              <input type="date" id="pdateend" name="pdateend"
															              	value="<fmt:formatDate value="${product.pdateend}" pattern="yyyy-MM-dd"/>"/>
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">좌석 등급 :
															                </span>
															              </div>
															              <select class="form-control" id="pseatgrade" name="pseatgrade">
															              	<c:if test="${product.pseatgrade eq '일반석'}">
															              		<option value="${product.pseatgrade}" selected="selected">${product.pseatgrade}</option>
															              		<option value="로얄석">로얄석</option>
															              	</c:if>
															              	<c:if test="${product.pseatgrade eq '로얄석'}">
															              		<option value="${product.pseatgrade}" selected="selected">${product.pseatgrade}</option>
															                	<option value="일반석">일반석</option>
															              	</c:if>
															              </select>
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">좌석 수 :
															                </span>
															              </div>
															              <input id="pseatscnt" type="number" name="pseatscnt" class="form-control"
															              	value="${product.pseatscnt}">
															            </div>
															
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">공연장 상세주소 :
															                </span>
															              </div>
															              <input id="paddress" type="text" name="paddress" class="form-control"
															              	value="${product.paddress}">
															            </div>
															            
															            <div class="input-group">
															              <div class="input-group-prepend">
															                <span class="input-group-text">상품 장르 :
															                </span>
															              </div>
															              <input id="pgenre" type="text" name="pgenre" class="form-control"
															              	value="${product.pgenre}">
															            </div>
																										
															            <div class="mt-3 text-end">
															              <button type="submit" class="btn btn-outline-secondary mt-2">수정</button>
															              <a href="productDelete?pno=${product.pno}" class="btn btn-outline-danger mt-2">삭제</a>
															            </div>
															        </div>
															      </div>
															    </div>
															    
														</form>
														<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
												      </div>
												
												    </div>
												  </div>
												</div>

											</td>
										</tr>
									</c:forEach>
								
									<tr>
										<td colspan="8" class="text-center">
										
							               <div>
							                  <a class="btn btn-outline-primary btn-sm" href="productReader?pageNo=1">처음</a>
							                  <c:if test="${pager.groupNo>1}">
							                     <a class="btn btn-outline-info btn-sm" href="productReader?pageNo=${pager.startPageNo-1}">이전</a>
							                  </c:if>
							                  
							                  <!-- 번호가 들어가는 부분 -->
							                  <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							                     <c:if test="${pager.pageNo != i}">
							                        <a class="btn btn-outline-success btn-sm" href="productReader?pageNo=${i}">${i}</a>
							                     </c:if>
							                     <c:if test="${pager.pageNo == i}">
							                        <a class="btn btn-danger btn-sm" href="productReader?pageNo=${i}">${i}</a>
							                     </c:if>
							                  </c:forEach>
							                  
							                  <c:if test="${pager.groupNo<pager.totalGroupNo}">
							                     <a class="btn btn-outline-info btn-sm" href="productReader?pageNo=${pager.endPageNo+1}">다음</a>
							                  </c:if>
							                  <a class="btn btn-outline-primary btn-sm" href="productReader?pageNo=${pager.totalPageNo}">맨끝</a>
							               </div>

										</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
					<!-- 등록 버튼 -->
					<!-- 대기** -->
					<div class="d-flex justify-content-end m-3">
						<button type="button" class="btn btn-outline-secondary me-2"
							data-bs-toggle="modal" data-bs-target="#productSignUpModal">
							상품 등록
						</button>
					</div>
 
				</div>
			</div>
		</div> 
	</div>

	<!-- 상품 등록 Modal -->
	<div class="modal fade" id="productSignUpModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header text-center">
	        <h4 class="modal-title">상품 등록</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<form method="post" action="productSignUp" enctype="multipart/form-data">
				<!-- 시큐리티의 위조 방지를 위한 토큰번호. -->
			   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			   
				    <div class="container fluid" style="width:100%">
				      <div class="row" style="height: 100%;">
				        <div id="pictures" class="col" style="width:40%">
				          <img id="repimg-container" src="" alt="" style="width:100%; height:100%">
				        </div>
				        <div class="col d-flex flex-column" style="width:60%">
				            <%-- <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 번호 :
				                </span>
				              </div>
				              <input id="pno" type="number" name="pno" class="form-control" value="${product.pno}">
				            </div> --%>
				
				            <div class="input-group mt-2">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 분류 :
				                </span>
				              </div>
				              <select class="form-control" id="pkind" name="pkind">
				              	<option value="" selected disabled hidden>카테고리</option>
				                <option value="연극">연극</option>
				                <option value="뮤지컬">뮤지컬</option>
				              </select>
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">제목 :
				                </span>
				              </div>
				              <input id="ptitle" type="text" name="ptitle" class="form-control">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">장소 :
				                </span>
				              </div>
				              <input id="pplace" type="text" name="pplace" class="form-control">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">가격 :
				                </span>
				              </div>
				              <input id="pprice" type="number" name="pprice" class="form-control">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 컨텐츠 :
				                </span>
				              </div>
				              <input id="pcontent" type="file" name="pcontentattach" class="form-control">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 포스터 :
				                </span>
				              </div>
				              <input id="pposter" type="file" name="pposterattach" class="form-control" accept="image/*" onchange="previewFile('new')">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 판매 시작일 :
				                </span>
				              </div>
				              <input type="date" id="pdatestart" name="pdatestart"/>
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 판매 종료일 :
				                </span>
				              </div>
				              <input type="date" id="pdateend" name="pdateend"/>
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">좌석 등급 :
				                </span>
				              </div>
				              <select class="form-control" id="pseatgrade" name="pseatgrade">
				                <option value="일반석" selected="selected">일반석</option>
				                <option value="로얄석">로얄석</option>
				              </select>
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">좌석 수 :
				                </span>
				              </div>
				              <input id="pseatscnt" type="number" name="pseatscnt" class="form-control">
				            </div>
				
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">공연장 상세주소 :
				                </span>
				              </div>
				              <input id="paddress" type="text" name="paddress" class="form-control">
				            </div>
				            
				            <div class="input-group">
				              <div class="input-group-prepend">
				                <span class="input-group-text">상품 장르 :
				                </span>
				              </div>
				              <input id="pgenre" type="text" name="pgenre" class="form-control">
				            </div>
				
				            <div class="mt-3 text-end">
				              <button type="submit" class="btn btn-outline-secondary mt-2">등록</button>
				            </div>
				        </div>
				      </div>
				    </div>
				    
			</form>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
	      </div>
	
	    </div>
	  </div>
	</div>

</body>
</html>