# 연극, 뮤지컬 티켓 판매 쇼핑몰 T-GET

<aside>
💡

# 목차

1. [프로젝트 개요](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [1.1 프로젝트 소개](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [1.2 인원 및 개발 기간](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [1.3 목표](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
2. [프로젝트 일정 및 역할](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [2.1 일정](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [2.2 팀원 및 역할](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
3. [프로젝트 설계](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [3.1 개발 환경](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [3.2 ERD 설계](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
4. [화면과 기능 구현](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.1 홈 페이지](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.2 로그인](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.3 회원가입](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.4 아이디 & 비밀번호 찾기](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.5 마이페이지](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.6 상품 목록](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.7 상품 상세 페이지](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.8 장바구니](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.9 게시판](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
    [4.10 관리자 페이지](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
    
5. [회고](https://www.notion.so/T-GET-109737435c49801b9536fa2162f0b894?pvs=21)
</aside>

## 1. 프로젝트 개요

---

### 1.1 프로젝트 소개

교육 기관의 Java, Spring Framework, Oracle, MyBatis, JSP 기술을 학습한 후 팀원과의 회의를 통해 주제 선정의 결과로 **연극과 뮤지컬에 대한 쇼핑몰 프로젝트**를 목표로 진행하게 되었습니다.

### 1.2 프로젝트 인원 및 기간

(팀장) 김성민, (팀원) 김명환, (팀원) 이재원, (팀원) 홍수민 등 총 4명

- 2024.05.03 ~ 2024.05.20 (총 17일)

### 1.3 프로젝트 목표

- 쇼핑몰 사이트의 구조 파악과 수행 경험
- 팀원과의 의사소통 능력과 개개인의 실력 향상

## 2. 프로젝트 일정 및 역할

---

### 2.1 프로젝트 일정

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/5a7dc461-58ce-47a5-b61e-18867c8bbbf5/image.png)

### 2.2 팀원 소개 및 역할

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/0ad198d5-6cfa-4a29-9a16-d7019618748e/image.png)

- 상품 리스트
    - 인기 상품 랭킹 캐러셀, 연극과 뮤지컬 상품으로 리스트 구성
- 장바구니
    - 전체 선택과 일부 선택에 따른 결제 금액 시각화
- 관리자 페이지
    - 회원, 상품 관리

(팀장) 김성민

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/52a2b84b-e46a-42bb-bff6-c39372e1f64c/image.png)

(팀원) 김명환

- 홈 페이지
    - Header, navbar, 캐러셀, 유튜브 영상 최신화, 일부 상품 리스트, 게시글로 구성
- 상품 상세 페이지
    - 공연정보, 관람후기, 판매정보를 나누어 시각화
    - 해당 상품의 데이터와 수량 데이터 전송
- 게시판
    - 자유게시글
    - 공지글
    - Q/A

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/f6778395-c234-4f86-aae9-3055447b3e6d/image.png)

(팀원) 이재원

- 로그인
    - security를 적용하여 관리자와 사용자 구분
    - 권한에 따른 관리자 페이지 접속
- 아이디 찾기
    - 아이디와 이름, 전화번호를 이용하여 새로운 비밀번호 변경 기능
    - 입력받는 비밀번호를 자바스크립트를 이용하여 사용자에게 보일 수 있도록 추가
- 마이페이지
    - 내가 쓴 후기
    - 구매 내역

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/e42ed56d-536b-4687-b669-125c880df50d/image.png)

(팀원) 홍수민

- 회원가입
    - 아이디, 비밀번호, 이메일, 휴대폰 번호, 닉네임 유효성 검사 및 중복 배제
- 마이페이지
    - 회원정보 수정
    - 회원 탈퇴

[프로젝트 기능 회의](https://www.notion.so/33df6fbb48a94c7994d7e4def85627a8?pvs=21) 

## 3. 프로젝트 설계

---

### 3.1 개발 환경

### Backend

- Spring Framework
- MyBatis
- Spring Security

### Frontend

- HTML
- JS
- CSS
- Bootstrap

### DataBase

- Oracle DB

### 3.2 ERD 설계

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/751f1d25-9f9d-4d7a-95b2-e94c53558b9f/image.png)

## 4. 화면과 기능 구현

---

### 4.1 홈 페이지

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/3b45825d-ebd0-485f-85d2-c42674dea02b/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/8b958ff6-2711-4bc5-8aa6-1490452cbf6b/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/fea245f3-de04-43cb-84c4-e99d35146da1/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/08f3c243-a3bd-4db2-a1fe-85fcce8111c7/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/a8e263b1-2ea3-4c8d-bdb2-05c069b5a731/image.png)

‘티켓링크’와 ‘인터파크’의 화면을 참고하였으며, 회의를 통해 시각적으로 흥미를 유발할 수 있도록 홈페이지를 구성하였습니다.

### 4.2 로그인

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/0121868a-97c7-445e-af42-5fdc91050e9b/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/9406e869-84b7-4f6f-b7bb-ceec5b7c80a1/image.png)

관리자 아이디로 로그인을 하지 않으면 관리자 페이지로 접속할 수 있는 ‘관리자’ 버튼이 나오지 않으며, 페이지 주소를 알아도 관리자 권한이 아니면 접속할 수 없도록 하였습니다.

### 4.3 회원가입

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/e158e678-3542-4b7c-b194-495c32faa7e4/image.png)

유효성 검사 규칙을 적용하였습니다.

- 아이디, 휴대폰 번호, 닉네임은 중복값 배제
- 회원가입으로 등록되는 아이디의 권한은 ‘ROLE_USER’

### 4.4 아이디 & 비밀번호 찾기

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/ef695c20-97b5-444b-8528-11ee4a6c36ba/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/67e7492d-7fc8-4f32-b5d1-0bff23d617ae/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/b57d4f18-ff16-42a1-b738-b589c327b1a5/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/09a965e6-82fb-46a8-92b1-a09eed15c843/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/f2496b28-64c8-4aa2-84f2-3534dd07fb67/image.png)

유효성 검사 규칙을 적용하였습니다.

- 이름, 주민번호, 전화번호가 일치할 경우 아이디를 화면에 보여주도록 하였습니다.
- 아이디, 이름, 주민번호가 일치할 경우 비밀번호 초기화 모달창을 구현하였습니다.

### 4.5 마이페이지

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/1516aa8a-3264-4af8-a4df-541360d76afd/image.png)

회원정보 수정시 아이디와 이름을 제외한 모든 정보를 수정할 수 있도록 구현하였습니다.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/376ea356-66f0-48f9-8d1f-fd825d9fd65f/image.png)

해당 아이디가 쓴 게시글을 볼 수 있도록 구현하였습니다.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/1c5c662d-c686-4682-916d-eed508e7cce3/image.png)

구매한 상품 내역을 볼 수 있는 화면을 구성하였습니다.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/835dee26-7f40-4995-ba1b-3b17f28632cf/image.png)

소프트 딜리트 구현 보완

### 4.6 상품 목록

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/bf4af893-c481-4e94-84f6-0495409c252e/image.png)

결제 시스템 미완료. 따라서 조회수 또는 장바구니에 담겨있는 수를 이용하여 랭킹 시스템 도입

전체보기, 연극, 뮤지컬 분류와 인기,최저가,최고가 비동기 작업 진행 중

### 4.7 상품 상세 페이지

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/3178550e-989d-4f8e-a83f-1e9bbb7aee20/image.png)

공연정보와 판매정보는 타 사이트를 참고하여 이미지로 게시하였습니다.

관람후기는 댓글달기 기능을 이용하였습니다.

### 4.8 장바구니

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/ca5acbac-4621-4dcb-8e07-66c2b8c1e5a2/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/fed437d8-4e7d-4378-8a5f-1dfdadf69a56/image.png)

상품의 전체 선택과 일부 선택을 할 수 있도록 구현하였습니다.

체크된 상품의 수량에 따라 최종 결제금액을 사용자에게 보여주기 위해 AJAX를 활용하여 비동기 방법으로 구현하였습니다.

주문하기 버튼을 클릭할 시 임시적으로 TempDTO를 이용하여 선택한 상품의 정보를 모달창으로 시각화하였습니다.

결제하기 버튼을 누를 시 결제 금액에 대한 정보를 저장하는 것은 구현 중입니다.

### 4.9 게시판

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/a07257d2-51da-44be-a9ae-b50ac6722b1c/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/d807e00c-209b-4682-ac2b-b84a1976a8b4/image.png)

게시글의 번호를 내림차순으로 나열하였고, 10개의 게시물마다 페이지를 구현하였습니다.

게시물의 글쓴이와 관리자에게는 수정, 삭제 버튼을 사용할 수 있도록 구현하였습니다.

### 4.10 관리자 페이지

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/c63d0a05-7505-4737-ab35-27999eadf5ba/image.png)

회원관리 부분입니다.

관리자는 회원의 계정을 함부로 삭제할 수 없도록 하였고, 현재 회원 등급의 수정만 가능하도록 구현하였습니다.(수정)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/8e0624e4-3309-4d3a-9e01-f6bb6b07c1b0/image.png)

상품관리 부분입니다.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/778b5bc2-66ba-4ffe-a3ac-e091868b316d/image.png)

상품을 등록을 할 때마다 Oracle의 시퀀스를 이용하여 상품 번호가 매겨지도록 하였고, 이 상품 번호를 이용하여 상품의 금액과 갯수를 접근할 수 있도록 하였습니다.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/8205e95e-b487-4037-a07a-7019ab286587/image.png)

게시글 관리 부분입니다.

게시글을 구현한 기능을 이용하였으며 하였습니다. 

음란, 욕설 게시글에 대한 신고 기능은 미완료 상태입니다.

## 5. 프로젝트 회고

---

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/5ca6d0db-796c-4381-8603-83b639f39cc2/2bfa7c45-ed86-4ece-b2ab-c112e1b5511e/image.png)
