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
<%--    드롭다운 사용시 필요--%>
    <script type="text/javascript"src="/resources/jsp/bootstrap.bundle.js"></script>
<%--    아이콘 적용--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<%--        jquery 적용--%>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
                /*모서리 둥글게*/
                border-radius: 20px 20px 20px 20px;
                margin-top: 100px;
                margin-bottom: 100px;
                /*가운데 정렬 margin: auto*/
                margin-left: auto;
                margin-right: auto;
                padding: 10px 35px;
            }
            #comment-write{
                width: 300px;
            }
            .fontSize-date{
                font-size: xx-small;
                color: rgba(0,0,0,0.28);
            }
            .heart-image{
                border: none;
                outline: none;
            }
        </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div id="detail-form">
    <table>
        <tr>
            <td>${board.boardWriter}</td>
            <div class="dropdown">
                <td><a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none " title="더보기" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black" class="bi bi-list" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </a>
            <c:if test="${sessionScope.loginUserName == board.boardWriter}">
                <ul class="dropdown-menu text-small shadow">
                    <li><a onclick="deleteFn()" class="dropdown-item">삭제하기</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a onclick="updateFn()" class="dropdown-item">수정하기</a></li>
                </ul>
            </c:if>
                </td>
            </div>
        </tr>
        <tr class="text-center">
            <c:if test="${board.boardImage != null}">
                <td><img src="${pageContext.request.contextPath}/upload/${board.boardImage}" alt="" width="376" height="470"></td>
            </c:if>
        </tr>
        <tr>
            <td>
                <div>
                    <br>
<%--                    <a href="/likes/heart" class="text-dark heart" style="text-decoration-line: none;">--%>
<%--                        <img id="heartImage" src="/resources/icon/heart.svg">--%>
<%--                    </a>--%>
                    <c:if test="${heart.heart==1}">
                        <button onclick="likesFn()" id="heart" class="heart-image"><img id="heartImages" src="/resources/icon/heart-fill.svg"></button>
                    </c:if>
                    <c:if test="${heart.heart==0}">
                    <button onclick="likesFn()" id="heart" class="heart-image"><img id="heartImage" src="/resources/icon/heart.svg"></button>
                    </c:if>
                 </div>
            </td>
        </tr>
        <tr>
            <td>${board.boardContents}</td>
        </tr>
        <tr class="fontSize-date">
            <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
        </tr>
        <tr>
            <td>
<div class="container mt-5 commentList-form" id="comment-list">
    <table class="table">
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td class="fontSize-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="comment-write" class="input-group" mb-3>
                    <input type="hidden" id="commentWriter" value="${sessionScope.loginUserName}">
                    <input type="text" id="commentContents" class="form-control" placeholder="댓글달기...">
                    <button id="comment-write-btn" class="btn btn-primary" onclick="commentWrite()">게시</button>
                </div>
            </td>
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
    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        //commentId값 넣기
        const id = '${board.id}';
        $.ajax({
            type:"post",
            url:"/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                //commentId값 넣기
                commentId: id
            },
            dataType:"json",
            success: function (commentList){
                console.log(commentList);
                let output = "<table class='table'>";

                for(let i in commentList){
                    output += "<tr>";
                    // output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    output += "<td class='fontSize-date'>"+moment(commentList[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function (){
                console.log("실패");
            }
        });
    }
    const likesFn = () => {
        const userId = '${heart.userId}';
        const imageId = '${heart.imageId}';
        const id = '${heart.id}';
        $.ajax ({
           url:"/likes/heart",
           type:"get",
           data:{
               userId: userId,
               imageId: imageId,
               id: id
           },
            dataType: "json",
            success: function (data){
               console.log(data);
                <c:if test="${sessionScope.loginUserName !=null}">
               if(data===1){
                       $('#heartImage').prop("src", "/resources/icon/heart-fill.svg");
               }else{
                   $('#heartImage').prop("src", "/resources/icon/heart.svg");
               }
                </c:if>
            },
            error: function (){
               console.log("실패");
            }
        });
    }
</script>
</html>
