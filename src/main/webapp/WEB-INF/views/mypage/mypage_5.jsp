<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fl#our</title>
<link href="./css/style3.css" rel="stylesheet">  
<link href="./css/style_mypage.css" rel="stylesheet">  
  <script type="text/javascript" src="javascript/member.js"></script>  
</head>
<body>
<div class="container">
<%@ include file="../header.jsp" %> 
<div class="contentbody">
    <div class="body1 mypage">
     <form method="post" name="formm" action="mypage_5_delete">
       <input type="hidden" name="id" value="${loginUser.id }">
        <div class="my1Header">
          <h2>MyPage</h2>
          <ul class="mypagebar">
            <li class="m1"><a href="mypage_point">적립금조회</a></li>
            <li class="m2"><a href="mypage_2">주문조회</a></li>
            <li class="m3"><a href="mypage_3">1:1문의</a></li>
            <li class="m4"><a href="javascript:open_win('mypage_check_pass_form?id=${loginUser.id}','mcheck');">정보수정</a></li>
            <li class="m5" style="background-color: #c0bdbd;"><a href="mypage_5">&nbsp;탈퇴&nbsp;</a></li>
          </ul>
        </div>
       <div id="cancle">
         <p>정말 탈퇴 하시겠습니까?</p><br>
        <p>※아래 정보를 입력하신후 탈퇴버튼을 클릭하시면 탈퇴처리가 완료됩니다.</p>
        <div id="msg" style="color:red;"> ${message}</div>
          <div class="cancle_2"><label for="ID"><b>&nbsp;&nbsp;비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
          <input type="password"name="pass" placeholder="비밀번호를 입력하세요"><br>
          <label for="ID"><b>비밀번호 확인&nbsp;</b></label>
          <input type="password" name="pwdCheck" placeholder="비밀번호를 재입력 하세요"></div>
          <input type="button" class="ccbt" value="탈퇴" onclick="javascript:passdCheck();">
         </div>
      </form>
       </div>
    </div>
    </div>

<%@ include file="../footer.jsp" %>
</body>
</html>