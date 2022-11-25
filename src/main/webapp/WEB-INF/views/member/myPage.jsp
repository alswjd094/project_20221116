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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <%--    드롭다운 사용시 필요--%>
    <script type="text/javascript"src="/resources/jsp/bootstrap.bundle.js"></script>
    <style>
        * {
            font-family: 'Jua', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .mypage-form{
            /*margin-top: 100px;*/
            /*margin-left: auto;*/
            /*margin-right: auto;*/
            /*margin-bottom: 100px;*/
            margin: 100px auto 100px auto;
            display: block;
            width: 50%;
        }
        .box{
            float:left;

        }
        /*프로필 이미지 둥글게*/
        #profile-form{
            width: 150px;
            height: 150px;
            /*div 원모양*/
            border-radius: 70%;
            /*넘치는 부분 지우기*/
            overflow: hidden;
        }
        .profile{
            width: 100%;
            height: 100%;
            /*이미지와 같은 오브젝트 받아서 비율 그대로 유지*/
            object-fit: cover;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="mypage-form" >
    <div class="box" id="profile-form">
<c:if test="${findByEmail.memberProfile != null}">
        <img src="${pageContext.request.contextPath}/uploads/${findByEmail.memberProfile}" alt="" class="profile">
</c:if>
        <c:if test="${findByEmail.memberProfile == null}">
            <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="black" class="bi bi-person-circle profile" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg>
        </c:if>
    </div>
    <div class="box">
<h2>${findByEmail.memberUserName}</h2>
    </div>
    <div class="box">
<c:if test="${sessionScope.loginUserName == findByEmail.memberUserName}">
    <button onclick="profileUpdateFn()" class="btn btn-outline-secondary">프로필편집</button>
</c:if>
    </div>
<div class="dropdown box">
    <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none " title="더보기" data-bs-toggle="dropdown" aria-expanded="false">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-gear-wide" viewBox="0 0 16 16">
            <path d="M8.932.727c-.243-.97-1.62-.97-1.864 0l-.071.286a.96.96 0 0 1-1.622.434l-.205-.211c-.695-.719-1.888-.03-1.613.931l.08.284a.96.96 0 0 1-1.186 1.187l-.284-.081c-.96-.275-1.65.918-.931 1.613l.211.205a.96.96 0 0 1-.434 1.622l-.286.071c-.97.243-.97 1.62 0 1.864l.286.071a.96.96 0 0 1 .434 1.622l-.211.205c-.719.695-.03 1.888.931 1.613l.284-.08a.96.96 0 0 1 1.187 1.187l-.081.283c-.275.96.918 1.65 1.613.931l.205-.211a.96.96 0 0 1 1.622.434l.071.286c.243.97 1.62.97 1.864 0l.071-.286a.96.96 0 0 1 1.622-.434l.205.211c.695.719 1.888.03 1.613-.931l-.08-.284a.96.96 0 0 1 1.187-1.187l.283.081c.96.275 1.65-.918.931-1.613l-.211-.205a.96.96 0 0 1 .434-1.622l.286-.071c.97-.243.97-1.62 0-1.864l-.286-.071a.96.96 0 0 1-.434-1.622l.211-.205c.719-.695.03-1.888-.931-1.613l-.284.08a.96.96 0 0 1-1.187-1.186l.081-.284c.275-.96-.918-1.65-1.613-.931l-.205.211a.96.96 0 0 1-1.622-.434L8.932.727zM8 12.997a4.998 4.998 0 1 1 0-9.995 4.998 4.998 0 0 1 0 9.996z"/>
        </svg>
    </a>
    <ul class="dropdown-menu text-small shadow">
        <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
    </ul>
</div>
<div>
    <br>
    <br>
    <br>
   <p> 게시물 팔로워 팔로우</p>
    <h3>${findByEmail.memberIntro}</h3>
</div>
    <div>
        <c:if test="${post.boardImage!=null}">
            <td><img src="${pageContext.request.contextPath}/upload/${post.boardImage}" alt="" width="300" height="300"></td>
        </c:if>
    </div>
</div>
</body>
<script>
    const profileUpdateFn = () => {
        location.href="/member/profileUpdate";
    }
</script>
</html>
