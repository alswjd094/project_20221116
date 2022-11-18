<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%--폰트 적용--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>detail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
        <style>
            * {
                font-family: 'Jua', sans-serif;
                font-family: 'Noto Sans KR', sans-serif;
            }
        </style>
</head>
<body>
<div class="container">
    <table class="table table-striped table-hover text-center">
        <tr>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <td>${board.boardImage}</td>
        </tr>
        <tr>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <td><fmt:formatDate value="${findById.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
        </tr>
    </table>
</div>
</body>
</html>
