<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8" />
   <title>회원정보 수정</title>
   <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
   <!-- Latest compiled and minified CSS -->
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet" />
   <!-- Latest compiled JavaScript -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- jQuery -->
   <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
   
   
   <script>
         function pwModify() {
           const pwModal = new bootstrap.Modal("#pwModifyModal");
           pwModal.show();
         }
   
         function nickModify() {
           const pwModal = new bootstrap.Modal("#nickModifyModal");
           pwModal.show();
         }
   
         function emailModify() {
           const pwModal = new bootstrap.Modal("#emailModifyModal");
           pwModal.show();
         }
         function addressModify() {
           const pwModal = new bootstrap.Modal("#addressModifyModal");
           pwModal.show();
         }
   
         function phoneModify() {
           const pwModal = new bootstrap.Modal("#phoneModifyModal");
           pwModal.show();
         }
       </script>
   
   <style>
   input {
      /* input 태그가 가진 기본적인 설정들을 지움 */
      outline: none;
      border: none;
      color: gray;
   }
   
   .div_form {
      height: 50px;
      border-bottom: 3px solid lightgray;
      margin-top: 20px;
      white-space: nowrap; /* 창 크기가 변경되어도 줄바꿈을 하지 않는다. */
   }
   
   .div_form_checkbox, .submit_btn {
      height: 60px;
   }
   
   .span_radio {
      display: inline;
      margin-top: 15px;
   }
   
   header, .content, .tget_footer {
      min-width: 500px; /* 최소 창 가로폭 지정(더 줄어들면 아래에 스크롤바가 생김) */
   }
   
   a:hover {
      color: #d95b96;
   }
   /* 나중에 수정하기 */
   </style>
   
   <link rel="stylesheet" href="/resources/css/home.css" />
   
   </head>

   <body>
      <!-- header -->
      <%@ include file="/WEB-INF/views/common/header.jsp"%>
      <!-- context -->
      <div class="content" style="background-color: white; width: 100%">
         <div class="row justify-content-center ">
            <div class="pt-3 pb-3 row align-items-stretch" style="width: 45%">
               <div class="col-3 mt-1">
                  <div style="background-color: white; border-radius: 10px;"
                     class="pt-3 pb-3">
                     <div>
                        <img src="imgProfileDownload?mid=${memberDto.mid}" width="150" />
                     </div>
                     <h4 class="ms-3">
                        <strong>${memberDto.mname}</strong>님의 <br />마이페이지
                     </h4>
                     <hr />
                     <%@ include file="/WEB-INF/views/common/myPageList.jsp"%>
                  </div>
               </div>
               <div class="col-9 ps-5 pe-5"
                  style="background-color: white; border-radius: 10px;">
                  <h5 class="ps-2 pt-5">
                     <strong>회원 정보 수정</strong>
                  </h5>
                  <hr style="border-top: 4px solid black" />
                  <form method="post"
                     class="row d-flex flex-column align-items-center ps-3 pe-3 pb-3">
                     <div class="div_form row">
                        <div class="col-3">
                           <strong>아이디</strong>
                        </div>
                        <div class="col-8">${memberDto.mid}</div>
                     </div>
                     <div class="div_form row">
                        <div class="col-3">
                           <strong>비밀번호</strong>
                        </div>
                        <div class="col-7"></div>
                        <div class="col-2">
                           <button type="button" class="btn"
                              style="background-color: #d95b96; color: white"
                              onclick="pwModify()">수정</button>
                        </div>
                     </div>
   
                     <div class="div_form row">
                        <div class="col-3">
                           <strong>이름</strong>
                        </div>
                        <div class="col-8">${memberDto.mname}</div>
                     </div>
                     <div class="div_form row">
                        <div class="col-3">
                           <strong>닉네임</strong>
                        </div>
                        <div class="col-7">${memberDto.mnickname}</div>
                        <div class="col-2">
                           <button type="button" class="btn"
                              style="background-color: #d95b96; color: white"
                              onclick="nickModify()">수정</button>
                        </div>
                     </div>
                     <div class="div_form row">
                        <div class="col-3">
                           <strong>이메일</strong>
                        </div>
                        <div class="col-7">${memberDto.memail}</div>
                        <div class="col-2">
                           <button type="button" class="btn"
                              style="background-color: #d95b96; color: white"
                              onclick="emailModify()">수정</button>
                        </div>
                     </div>
   
<!--                      <div class="div_form row">
                        <div class="col-3">
                           <strong>주소</strong>
                        </div>
                        <div class="col-7">대학로 유니 플렉스</div>
                        <div class="col-2">
                           <button type="button" class="btn"
                              style="background-color: #d95b96; color: white"
                              onclick="addressModify()">수정</button>
                        </div>
                     </div> -->
   
                     <div class="div_form row" style="margin-bottom: 15px">
                        <div class="col-3">
                           <strong>전화번호</strong>
                        </div>
                        <div class="col-7">${memberDto.mphone}</div>
                        <div class="col-2">
                           <button type="button" class="btn"
                              style="background-color: #d95b96; color: white"
                              onclick="phoneModify()">수정</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   
      <!-- footer -->
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   
      <!-- modal(pw) -->
      <div class="modal" tabindex="-1" id="pwModifyModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <!-- modal header -->
               <div class="modal-header">
                  <h5 class="modal-title">비밀번호 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <!-- modal body -->
               <div class="modal-body">
                  <form class="p-3" method="post">
                     <div class="div_form row">
                        <label for="pw" class="col-3"><strong>비밀번호</strong></label> <input
                           class="col-7 mb-5" type="password" id="pw" name="pw"
                           placeholder="8~12자 영문, 숫자" />
                        <div class="col-2">
                           <button type="button"
                              style="border: none; background-color: transparent">
                              <img src="/Tget_mini_web/resources/image/project_image/eye.svg"
                                 style="width: 30px" />
                           </button>
                        </div>
                     </div>
                     <div class="div_form row">
                        <label for="pwcheck" class="col-3"><strong>비밀번호
                              확인</strong></label> <input class="col-7 mb-5" type="password" id="pwcheck"
                           name="pwcheck" placeholder="8~12자 영문, 숫자" />
                        <div class="col-2">
                           <button type="button"
                              style="border: none; background-color: transparent">
                              <img src="/Tget_mini_web/resources/image/project_image/eye.svg"
                                 style="width: 30px" />
                           </button>
                        </div>
                     </div>
                  </form>
               </div>
               <!-- modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-bs-dismiss="modal">닫기</button>
                  <button type="submit" class="btn"
                     style="background-color: #d95b96; color: white">수정 완료</button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- modal(nickname) -->
      <div class="modal" tabindex="-1" id="nickModifyModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <!-- modal header -->
               <div class="modal-header">
                  <h5 class="modal-title">닉네임 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <!-- modal body -->
               <div class="modal-body">
                  <form class="p-3" method="post">
                     <div class="div_form row">
                        <label for="nickname" class="col-3"><strong>닉네임</strong></label>
                        <input class="col-9 mb-5" type="text" id="nickname"
                           name="nickname" placeholder="닉네임 중복 불가능" />
                     </div>
                  </form>
               </div>
               <!-- modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-bs-dismiss="modal">닫기</button>
                  <button type="submit" class="btn"
                     style="background-color: #d95b96; color: white">수정 완료</button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- modal(emailname) -->
      <div class="modal" tabindex="-1" id="emailModifyModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <!-- modal header -->
               <div class="modal-header">
                  <h5 class="modal-title">이메일 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <!-- modal body -->
               <div class="modal-body">
                  <form class="p-3" method="post">
                     <div class="div_form row">
                        <label for="email" class="col-3"><strong>이메일</strong></label> <input
                           class="col-9 mb-5" type="text" id="email" name="email"
                           placeholder="ex. tget0101@naver.com" />
                     </div>
                  </form>
               </div>
               <!-- modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-bs-dismiss="modal">닫기</button>
                  <button type="submit" class="btn"
                     style="background-color: #d95b96; color: white">수정 완료</button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- modal(addressname) -->
      <div class="modal" tabindex="-1" id="addressModifyModal">
         <div class="modal-dialog modal-l">
            <div class="modal-content">
               <!-- modal header -->
               <div class="modal-header">
                  <h5 class="modal-title">주소 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <!-- modal body -->
               <div class="modal-body">
                  <form class="p-3" method="post">
                     <div class="div_form row">
                        <label for="address" class="col-3"><strong>주소</strong></label> <input
                           class="col-9 mb-5" type="text" id="address" name="address"
                           placeholder="ex. 대학로 예그린씨어터" />
                     </div>
                     <div class="div_form row">
                        <label for="address" class="col-3"><strong>상세주소</strong></label>
                        <input class="col-9 mb-5" type="text" id="address" name="address"
                           placeholder="ex. 1층" />
                     </div>
                     <button type="button" class="btn mt-2"
                        style="background-color: #d95b96; color: white; width: 100%">
                        주소입력</button>
                  </form>
               </div>
               <!-- modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-bs-dismiss="modal">닫기</button>
                  <button type="submit" class="btn"
                     style="background-color: #d95b96; color: white">수정 완료</button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- modal(phonename) -->
      <div class="modal" tabindex="-1" id="phoneModifyModal">
         <div class="modal-dialog modal-l">
            <div class="modal-content">
               <!-- modal header -->
               <div class="modal-header">
                  <h5 class="modal-title">전화번호 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <!-- modal body -->
               <div class="modal-body">
                  <form class="p-3" method="post">
                     <div class="div_form row">
                        <label for="phone" class="col-3"><strong>전화번호</strong></label> <input
                           class="col-9 mb-5" type="text" id="phone" name="phone"
                           placeholder="ex. 010-1111-2222" />
                     </div>
                  </form>
               </div>
               <!-- modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-bs-dismiss="modal">닫기</button>
                  <button type="submit" class="btn"
                     style="background-color: #d95b96; color: white">수정 완료</button>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>