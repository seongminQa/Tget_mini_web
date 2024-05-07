<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <meta charset="UTF-8" />
        <title>결제</title>
        <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
        <!-- Latest compiled and minified CSS -->
        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
        />
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <body>
    <div style="width:580px">
        <div class="d-flex">
            <div class="">
                <img src="${pageContext.request.contextPath}/resources/image/product_image/시카고.gif" width="200px"/>
            </div>
            <div class="ps-3 pt-5">
                <h4 class="ps-3"><strong>뮤지컬 시카고 외 2건...</strong></h4>

                <ul >
                    <li>
                        5/9 20:00 – 뮤지컬 시카고 (1매)
                    </li>
                    <li>
                        5/12 14:00 – 뮤지컬 그레이트 코멧 (2매)
                    </li>
                    <li>
                        6/20 20:00 – 뮤지컬 영웅 (2매)
                    </li>
                </ul>
                <div class="ps-3 pt-4" >
                    <table width="100%" style="text-align: center;">
                        <th style="background-color: #D95B96; color: white">합계</th>
                        <tr>
                            <td style="border: 1px solid #D95B96;">324,000원</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin-top: 30px;" >
            <button class="btn" style="background-color: #D95B96; width:100%; color:white;">결제 하기</button>
        </div>
        </div>

    </body>
</html>