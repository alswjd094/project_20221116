<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>profileUpdate.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <style>
    .update-form{
      width: 500px;
      margin-left: auto;
      margin-right: auto;
    }
  </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="update-form">
  <form action="/member/profileUpdate" method="post" name="updateForm" enctype="multipart/form-data">
    <h3>${findByEmail.memberUserName}</h3>
    <img id="preview" width="50" height="50">
    <input type="file" name="memberFile"  value="${findByEmail.memberProfile}" onchange="readURL1(this)" class="form-control">
      <input type="hidden" name="id" value="${findByEmail.id}" class="form-control">
      이름 <input type="text" name="memberName" value="${findByEmail.memberName}" class="form-control">
      사용자이름 <input type="text" name="memberUserName" value="${findByEmail.memberUserName}" class="form-control">
      소개 <textarea name="memberIntro" cols="30" rows="10" class="form-control">${findByEmail.memberIntro}</textarea>

    <input type="button" value="제출" class="btn btn-primary" onclick="updateMypage()">
  </form>
</div>
</body>
<script>
  const updateMypage = () => {
    document.updateForm.submit();
  }
  function readURL1(input){
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
