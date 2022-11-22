<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>modals.jsp</title>
    <style>
        .search-form{
            width: 500px;
        }
    </style>
</head>
<body>
<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-5 pt-0">
        <form class="search-form">
          <div class="form-floating mb-3">
            <input type="search" name="q" class="form-control rounded-3" id="search" placeholder="검색">
<%--            <label for="search">search,,</label>--%>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary">검색</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
