<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <script src="/resources/js/jquery.js"></script>
  <style>
    #save-form{
      width: 400px;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container" id="save-form">
  <img src="/resources/image/instagram.jpg" width="175px" height="51px" alt="">
  <form action="/member/save" method="post" name="saveForm">
    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" onblur="emailDuplicateCheck()" class="form-control mt-4">
    <span id="email-input-check"></span>
    <input type="text" name="memberName" placeholder="이름" class="form-control mt-2">
    <span id="name-input-check" ></span>
    <input type="text" name="memberUserName" id="memberUserName" placeholder="사용자 이름" onblur="userNameDuplicateCheck()" class="form-control mt-2">
    <span id="userName-input-check" ></span>
    <input type="text" name="memberMobile" placeholder="휴대폰 번호" class="form-control mt-2">
    <span id="mobile-input-check" ></span>
    <input type="password" name="memberPassword" placeholder="비밀번호" class="form-control mt-2">
    <span id="password-input-check" ></span>
    <div class="d-grid gap-2 mt-3">
    <input type="button" value="가입" onclick="saveFn()" class="btn btn-primary">
    </div>
    <div class="mt-3">
    <p>계정이 있으신가요? <a href="/member/login">로그인</a></p>
    </div>
  </form>
</div>
</body>
<script>
  const saveFn = () => {
    console.log("saveFn 함수호출");
    const exp = /^(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,12}$/;

    if(document.saveForm.memberEmail.value === ""){
      const emailCheck = document.getElementById("email-input-check");
      emailCheck.innerHTML="이메일을 입력해주세요";
      emailCheck.style.color="red";
      return false;
    } else if(document.saveForm.memberName.value === ""){
      const nameCheck = document.getElementById("name-input-check");
      nameCheck.innerHTML="이름을 입력해주세요";
      nameCheck.style.color="red";
      return false;
    }else if(document.saveForm.memberUserName.value === ""){
      const userNameCheck = document.getElementById("userName-input-check");
      userNameCheck.innerHTML="사용자이름을 입력해주세요";
      userNameCheck.style.color="red";
      return false;
    }else if(document.saveForm.memberMobile.value === ""){
      const mobileCheck = document.getElementById("mobile-input-check");
      mobileCheck.innerHTML="휴대폰번호를 입력해주세요";
      mobileCheck.style.color="red";
      return false;
    }else if(document.saveForm.memberPassword.value === ""){
      const passwordCheck = document.getElementById("password-input-check");
      passwordCheck.innerHTML="비밀번호를 입력해주세요";
      passwordCheck.style.color="red";
      return false;
    }else if(!document.saveForm.memberPassword.value.match(exp)){
      const passwordCheck =document.getElementById("password-input-check");
      passwordCheck.innerHTML="영문 소문자와 숫자를 이용하여 8~12자 이내로 입력하세요";
      passwordCheck.style.color="red";
      return false;
    }
    document.saveForm.submit();
  }
  const emailDuplicateCheck = () => {
    const email = document.getElementById("memberEmail").value;
    console.log("입력한 이메일",email);
    const checkEmail = document.getElementById("email-input-check");

    $.ajax({
      type:"post",
      url:"/member/duplicate-check-email",
      data: {
        memberEmail: email
      },
      dataType: "text",
      success:function (result){
        if(result === "ok"){
          checkEmail.innerHTML="";
        }else{
          checkEmail.innerHTML="이미 사용중인 이메일입니다.";
          checkEmail.style.color="red";
        }
      },
      error: function (){
        console.log("실패");
      }
    });
  }
  const userNameDuplicateCheck = () => {
    const userName = document.getElementById("memberUserName").value;
    const checkUserName = document.getElementById("userName-input-check");

    $.ajax({
      type:"post",
      url:"/member/duplicate-check-userName",
      data: {
        memberUserName: userName
      },
      dataType:"text",
      success:function (result2){
        if(result2 === "ok"){
          checkUserName.innerHTML="사용할 수 있는 사용자 이름입니다.";
          checkUserName.style.color="blue";
        }else{
          checkUserName.innerHTML="이미 사용중인 사용자 이름입니다.";
          checkUserName.style.color="red";
        }
      },
      error:function (){
        console.log("실패");
      }
    });
  }
</script>
</html>
