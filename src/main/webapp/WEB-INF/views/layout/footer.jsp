<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>footer.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <style>
        * {
            background-color: white;
        }
        #foot-form{
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>
<footer class="py-2 my-1 border-top fixed-bottom">
    <div class="container" id="foot-form">
        <div class="d-flex flex-wrap justify-content-center align-items-center">
        <ul class="nav col-md-4 justify-content-center list-unstyled d-flex">
            <li class="ms-5"><a class="text-muted" href="/board/list"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="black" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z"/>
            </svg></a></li>
            <li class="ms-5"><a class="text-muted" href="/board/writing"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="black" class="bi bi-plus-square" viewBox="0 0 16 16">
                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
            </svg></a></li>
            <li class="ms-5"><a class="text-muted" href="/member/myPage"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="black" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/></svg></a>
            </li>
        </ul>
    </div>
    </div>
    </footer>
</body>
</html>
