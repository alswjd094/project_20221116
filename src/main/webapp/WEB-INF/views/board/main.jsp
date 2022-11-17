<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main.jsp</title>
</head>
<body>
<button onclick="logoutFn()" class="btn  btn-danger" >로그아웃</button>
</body>
<script>
    const logoutFn = () => {
        location.href="/member/logout";
    }
</script>
</html>
