<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>writing.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body>
<div class="container">
    <form action="/board/writing" method="post" name="writingForm">
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" class="form-control" readonly>
        <input type="file" name="boardFile" placeholder="사진선택" class="form-control">
        <textarea name="boardContents" cols="30" rows="10" placeholder="문구 입력" class="form-control"></textarea>
        <span id="contents-input-check"></span>
        <input type="button" value="공유하기" onclick="writingFn()" class="btn btn-primary">
    </form>
</div>
</body>
<script>
    const writingFn = () => {
        if(document.writingForm.boardContents.value===""){
            const contentsCheck = document.getElementById("contents-input-check");
            contentsCheck.innerHTML="문구를 입력해주세요";
            contentsCheck.style.color="red";
            return false;
        }
        document.writingForm.submit();
    }
</script>
</html>
