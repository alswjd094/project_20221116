<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%--폰트 적용--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <title>update.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <style>
    * {
      font-family: 'Jua', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
    }

      #update-form{
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
<div id="update-form">
  <form action="/board/update" method="post" name="updateForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${board.id}" class="form-control">
    <input type="text" name="boardWriter" value="${board.boardWriter}" class="form-control" readonly>
    <img src="${pageContext.request.contextPath}/upload/${board.boardImage}" alt="" width="376" height="470">
    <textarea name="boardContents" cols="30" rows="10" class="form-control">${board.boardContents}</textarea>
    <input type="button" value="완료" onclick="updateCheck()" class="btn btn-primary">
  </form>
</div>
</body>
<script>
  const updateCheck = () =>{
    document.updateForm.submit();
  }

</script>
</html>
