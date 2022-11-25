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
    <%--icon link--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <title>main.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
<%--jquery--%>
    <script src="/resources/js/jquery.js"></script>
    <style>
        #main-form {
            width: 450px;
            height: auto;
            background: #fff;
            outline: 1px solid #dfdfdf;
            border-radius: 20px 20px 20px 20px;
            margin-top: 65px;
            margin-bottom: 65px;
            /*가운데 정렬 margin: auto*/
            margin-left: auto;
            margin-right: auto;
            /*사용자이름,콘텐츠 등 가운데로 조정*/
            padding: 10px 35px;
        }
        * {
            font-family: 'Jua', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #fontSizeWriter{
            font-size: small;

        }
        #fontSizeDate{
            font-size: xx-small;
            color: rgba(0,0,0,0.28);
        }
    </style>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<%--상세조회에서 적용--%>
<%--<button onclick="logoutFn()" class="btn btn-danger" >로그아웃</button>--%>
<%--<button onclick="writing()" class="btn btn-primary">새 게시물 만들기</button>--%>
<div id="main-form">
        <table>
            <c:forEach items="${boardList}" var="board">
                <tr class="text-sm-start" id="fontSizeWriter">
            <td>${board.boardWriter}</td>
                </tr>
                <tr>
                <c:if test="${board.boardImage != null}">
                    <td><img src="${pageContext.request.contextPath}/upload/${board.boardImage}" alt="" width="376" height="470"></td>
                </c:if>
                </tr>
                <tr>
           <td>${board.boardContents}</td>
                </tr>
                <tr>
                    <td>
                        <a href="/board/detail?id=${board.id}" style="color:#8E8E8E ">댓글 보기</a>
                    </td>
                </tr>
                <tr class="text-sm-start" id="fontSizeDate">
           <td> <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"  ></fmt:formatDate><br><br><br><br><br></td>
                </tr>
    </c:forEach>
        </table>
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
