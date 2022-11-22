<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>myPage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <style>
        * {
            font-family: 'Jua', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<h2>${findByEmail.memberUserName}</h2>
<c:if test="${sessionScope.loginEmail == findByEmail.memberEmail}">
    <button onclick="profileUpdateFn()">프로필편집</button>
</c:if>
<div>
    게시물 팔로워 팔로우<br>
    <h3>${findByEmail.memberIntro}</h3>
</div>

</body>
<script>
    const profileUpdateFn = () => {
        location.href="/member/profileUpdate";
    }
</script>
</html>
