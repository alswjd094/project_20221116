<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>login.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <style>
    * {
      font-family: 'Jua', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
    }
    #login-form{
      width: 400px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 100px;
      border: solid 1px #dfdfdf;

    }
  </style>
</head>
<body>
<div class="container" id="login-form" style="text-align: center">
  <img src="/resources/image/instagram.jpg" width="175px" height="51px" alt="">
  <form action="/member/login" method="post" name="loginForm">
    <input type="text" name="memberEmail" placeholder="이메일 주소" class="form-control mt-4">
    <input type="password" name="memberPassword"  placeholder="비밀번호" class="form-control mt-2">
    <span id="password-check"></span>
    <div class="d-grid gap-2 mt-3">
      <input type="submit" value="로그인" class="btn btn-primary">
    </div>
    <p class="mt-5">계정이 없으신가요? <a href="/member/save">가입하기</a></p>
  </form>
</div>
</body>
</html>
