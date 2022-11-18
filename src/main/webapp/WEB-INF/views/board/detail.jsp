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
    <title>detail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
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
