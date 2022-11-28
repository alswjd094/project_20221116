<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>profileUpdate.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <style>
<%--글꼴--%>
    * {
      font-family: 'Jua', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
    }
    /*프로필편집 폼*/
    .update-form{
      width: 500px;
      margin-top: 100px;
      margin-left: auto;
      margin-right: auto;
    }
    /*첨부파일 미리보기 이미지와 유저네임 나란히*/
    .box11{
      float: left;
    }
    .box22{
      float: left;
    }
    /*프로필사진바꾸기 클릭하면 파일첨부기능 폼*/
    .input-file-form{
      color: #0095F6;
      font-size: 14px;
      font-weight: bolder;
      text-align: end;
    }
  </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="update-form">
  <div class="box11">
    <img id="preview" width="50" height="50" alt="">
    <c:if test="${findByEmail.memberProfile != null}">
      <img src="${pageContext.request.contextPath}/uploads/${findByEmail.memberProfile}" alt="" width="50" height="50">
    </c:if>
  </div>
  <div class="box22">
    <h3>${findByEmail.memberUserName}</h3>
  </div>
  <br>
  <br>
  <%--    프로필 사진 바꾸기 클릭하면 파일 첨부기능--%>
  <label class="input-file-form" for="inputFile">
  프로필 사진 바꾸기
  </label>
  <br>
  <br>
  <form action="/member/profileUpdate" method="post" name="updateForm" enctype="multipart/form-data">
    <input type="file" id="inputFile" name="memberFile" style="display: none" value="${findByEmail.memberProfile}" onchange="readURL1(this)" class="form-control">
      <input type="hidden" name="id" value="${findByEmail.id}" class="form-control">
     <b>이름</b><input type="text" name="memberName"  value="${findByEmail.memberName}" class="form-control" readonly>
     <b>사용자이름</b><input type="text" name="memberUserName" value="${findByEmail.memberUserName}" class="form-control" readonly>
    <b>소개</b><textarea name="memberIntro"  cols="30" rows="10" class="form-control">${findByEmail.memberIntro}</textarea>
      <input type="hidden" name="memberEmail" value="${findByEmail.memberEmail}">
      <input type="hidden" name="memberPassword" value="${findByEmail.memberPassword}">
      <input type="button" value="제출" class="btn btn-primary mt-3" onclick="updateMypage()">
  </form>
</div>
</body>
<script>
  const updateMypage = () => {
    document.updateForm.submit();
  }
  //첨부파일 미리보기
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
