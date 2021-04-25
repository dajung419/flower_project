<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 윗부분 추가  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/member.css" rel="stylesheet" type="text/css">  
  <script type="text/javascript" src="./javascript/member.js"></script>   
<script src="./javascript/js/jquery.js"></script>
</head>
<body>
<!-- 헤더 윗부분 추가  -->
<div class="container">
<%@ include file="../header.jsp" %>  
		<div class="contentbody">
			<div class="login body1">
				<h1>로그인</h1>
				<form method="post" class="login_form" action="login" name="frm">
					<div class="idpw">
						<input type="text" class="id" name="id" placeholder="아이디" value="${id }">
					</div>
					<div class="idpw">
						<input type="password" class="pass" name="pass" placeholder="비밀번호">
					</div>
					<input type="submit" value="Login" class="loginBtn">
				</form>
				<ul class="loginMenu">
					<li class="join"><a href="join_form" title="회원가입" id="member-join">회원가입
					</a></li>
					<li class="idsearch"><a id="id-search" href="findIdForm">아이디 찾기 </a></li>
					<li class="pwsearch"><a id="pw-search" href="findpwForm"> 비밀번호 찾기</a></li>
				</ul>
			</div>
		</div>
	</div>
<%@ include file="../footer.jsp" %>     
