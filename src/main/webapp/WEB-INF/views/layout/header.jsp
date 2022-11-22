<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <style>
    *{
      background-color: white;
    }
    #search-form{
      margin: auto;
      width: 50%;
    }
  </style>
</head>
<body>
<header class="p-2 mb-2 border-bottom fixed-top">
  <div class="container" id="search-form">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/board/list" class="d-flex mb-2 mb-lg-0 text-dark text-decoration-none">
        <img src="/resources/image/instagram.jpg" width="110" height="40">
      </a>
      <form action="/board/search" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <input type="search" name="q" class="form-control" placeholder="검색" aria-label="Search">
      </form>

    </div>
  </div>
</header>
</body>
</html>
