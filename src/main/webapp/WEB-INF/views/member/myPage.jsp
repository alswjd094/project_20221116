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
    <title>myPage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
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
