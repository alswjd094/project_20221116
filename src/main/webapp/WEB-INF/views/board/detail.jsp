<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오후 1:41
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
    <title>detail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
        <style>
            * {
                font-family: 'Jua', sans-serif;
                font-family: 'Noto Sans KR', sans-serif;
            }

            #detail-form{
                width: 450px;
                height: auto;
                background: #fff;
                outline: 1px solid #dfdfdf;
                border-radius: 20px 20px 20px 20px;
                margin-top: 40px;
                /*가운데 정렬 margin: auto*/
                margin-left: auto;
                margin-right: auto;
                align-items: center;
            }
        </style>
</head>
<body>
<jsp:include page="../layout/sidebars.jsp" flush="false"></jsp:include>
<div id="detail-form">
    <table class="table">
        <tr>
            <td>${board.boardWriter}</td>
                <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none " title="더보기" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </a>
            <c:if test="${sessionScope.loginEmail == board.boardWriter}">
                <ul class="dropdown-menu text-small shadow">
                    <li><a onclick="deleteFn()" class="dropdown-item">삭제하기</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a onclick="updateFn()" class="dropdown-item">수정하기</a></li>
                </ul>
            </c:if>
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
            <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
        </tr>
    </table>
</div>
</body>
<script>
    const deleteFn = () => {
        const id='${board.id}';
        location.href="/board/delete?id="+id;
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href="/board/update?id="+id;
    }
</script>
</html>
