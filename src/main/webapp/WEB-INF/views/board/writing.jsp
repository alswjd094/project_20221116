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
    <style>
    .box1{
        border: 1px solid #dfdfdf;
        margin-left: 100px;
        margin-top: 80px;
        /*나란히 붙이기*/
        float: left;
    }
    .box2{
        /*border: 1px solid #dfdfdf;*/
        margin-top: 80px;
        float: left;
    }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="container">
    <form action="/board/writing" method="post" name="writingForm" id="writing-form" enctype="multipart/form-data">
        <div class="box1">
<%-- 업로드 이미지 미리보기--%>
        <img id="preview" width="350" height="370">
        </div>
        <div class="box2">
        <input type="text" name="boardWriter" value="${sessionScope.loginUserName}" class="form-control" readonly>
        <div class="right-side">
        <textarea name="boardContents" cols="30" rows="10" placeholder="문구 입력" class="form-control"></textarea>
        </div>
        <input type="file" name="boardFile" placeholder="사진선택" onchange="readURL(this)" class="form-control">
        <input type="button" value="공유하기" onclick="writingFn()" class="btn btn-primary">
        </div>
    </form>
</div>
</body>
<script>
    const writingFn = () => {
        if(document.writingForm.boardFile.value===""){
            alert("사진을 선택해주세요");
            return false;
        }
        document.writingForm.submit();
    }
    function readURL(input){
        if(input.files && input.files[0]){
            var reader = new FileReader();
            reader.onload=function (e){
                document.getElementById("preview").src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }else{
            document.getElementById("preview").src="";
        }
    }
</script>
</html>
