<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>main.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body>
<button onclick="logoutFn()" class="btn btn-danger" >로그아웃</button>
<button onclick="writing()" class="btn btn-primary">새 게시물 만들기</button>
<div class="container">
            <c:forEach items="${boardList}" var="board">
            <tr>
            ${board.boardWriter}<br>
                <c:if test="${board.boardImage != null}">
                    <img src="${pageContext.request.contextPath}/upload/${board.boardImage}" alt="" width="50" height="50">
                </c:if>
            <a href="/board?id=${board.id}">${board.boardContents}</a><br>
            <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate><br>
            </tr>
    </c:forEach>
</div>
</body>
<script>
    const logoutFn = () => {
        location.href="/member/logout";
    }
    const writing = () => {
        location.href="/board/writing";
    }
</script>
</html>
