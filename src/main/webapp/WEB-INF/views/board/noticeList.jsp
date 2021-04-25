<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 윗부분 추가  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/notice.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/review.js"></script>   
</head>
<body>
  <div class="container">
<!-- 헤더 윗부분 추가  -->
<%@ include file="../header.jsp" %>  
<div class="contentbody">
    <div class="body1">
    <c:choose>
    	<c:when	test="${noti_true eq 'y'}">
    		<h2>공지사항</h2>
    	</c:when>
    	<c:otherwise>
    		<h2>자주 묻는 질문</h2>
    	</c:otherwise>
    </c:choose>
    <table class="notice_table">
    	<tr><th class="w10">글쓴이</th><th class="w70">제목</th><th class="w20">날짜</th></tr>
	    <c:forEach var="noticeVO" items="${noticeList}" varStatus="status">
			<tr class="notice_list">
		        <td class="w10">${noticeVO.id}</td>
		        <td style="cursor:pointer" class="w70">
		            <a href="notice_detail?notiNum=${noticeVO.notiNum }">
		            ${noticeVO.noti_title}</a>
		        </td>
		        <td class="w20">${noticeVO.noti_date}</td>
		    </tr>
		</c:forEach>
	</table>
    </div>
    </div>
<%@ include file="../footer.jsp" %>     