<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-16
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <style>
        #index-form{
            width: 300px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 100px;
            border: solid 1px #dfdfdf;
        }
    </style>
</head>
<body>
<div class="container" id="index-form" style="text-align: center">
    <img src="/resources/image/instagram.jpg" width="175px" height="51px" alt="">
    <form action="/member/login" method="post" name="loginForm">
       <input type="text" name="memberUserName" placeholder="사용자 이름" class="form-control mt-4">
       <input type="password" name="memberPassword" placeholder="비밀번호" class="form-control mt-2">
        <div class="d-grid gap-2 mt-3">
        <input type="submit" value="로그인" class="btn btn-primary">
        </div>
        <p class="mt-5">계정이 없으신가요? <a href="/member/save">가입하기</a></p>
    </form>
</div>
</body>
</html>
