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
<%--폰트 적용--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>main.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <style>
        #main-form {
            /*border: 1px solid gray ;*/
            border-radius: 30px 30px 30px 30px;
        }
        *{
            font-family: 'Jua', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
    </style>

</head>
<body>
<jsp:include page="../layout/sidebars.jsp" flush="false"></jsp:include>
<%--sidebars로 적용--%>
<%--<button onclick="logoutFn()" class="btn btn-danger" >로그아웃</button>--%>
<%--<button onclick="writing()" class="btn btn-primary">새 게시물 만들기</button>--%>
<div class="container">
    <form>
        <table class="table table-borderless text-center" id="main-form">
            <c:forEach items="${boardList}" var="board">
                <tr>
            <td>${board.boardWriter}</td>
                </tr>
                <tr>

                <c:if test="${board.boardImage != null}">
                    <td><img src="${pageContext.request.contextPath}/upload/${board.boardImage}" alt="" width="376" height="470"></td>
                </c:if>
                </tr>


           <td> <a href="/board/detail?id=${board.id}">${board.boardContents}</a></td>

                </tr>
                <tr>
           <td> <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate><br></td>
                </tr>
    </c:forEach>
        </table>
    </form>
</div>
</body>
<script>
    // const logoutFn = () => {
    //     location.href="/member/logout";
    // }
    // const writing = () => {
    //     location.href="/board/writing";
    // }
</script>
</html>
