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
  <link href="./css/review.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/review.js"></script>   
</head>
<body>
  <div class="container">
<!-- 헤더 윗부분 추가  -->
<%@ include file="../header.jsp" %>  
<div class="contentbody review">
    <div class="body1 review">
    <table class="reviewP">
	  	<%-- begin = startList  end = endList --%>
	    <c:forEach var="reviewVO" items="${reviewList}" varStatus="status">
			<c:if test="${status.first }">
				<tr>
			</c:if>	   	    
		       	<td class="flower_rec"><div class="items">
		       	 <a href="review_detail?rev_num=${reviewVO.rev_num}">
		         <c:choose>
		         	<c:when test="${empty reviewVO.rev_pic}">
				       <img src='images/${reviewVO.p_pic}'>
		         	</c:when>
		         	<c:otherwise>
				       <img src='/flower/displayEditorFile/${reviewVO.rev_pic}'>
		         	</c:otherwise>
		         </c:choose>
		         <br>${reviewVO.rev_title}
		         <br>${reviewVO.rev_date}
		         <br>조회수(${reviewVO.rev_click})
		         </a></div>
		       	</td>
		    <c:if test="${status.count%3 == 0 }">
				</tr>
				<tr>
		    </c:if>
			<c:if test="${status.last }">
				</tr>
			</c:if>
		</c:forEach>
		<tr>
		<td colspan="3" class="page_area">
			<a href="review_list?page=${bPageVO.firstPageNum }&pageDataCount=${bPageVO.pageDataCount}">◀◀맨앞으로</a>&nbsp;&nbsp;
			<a href="review_list?page=${bPageVO.prevPageNum }&pageDataCount=${bPageVO.pageDataCount}">◀앞으로</a>&nbsp;&nbsp;
			<c:forEach var="i" begin="${bPageVO.startPageNum }" end="${bPageVO.endPageNum }" step="1">
			<c:choose>
			<c:when	test="${i eq bPageVO.currentPageNum }">
				<a style="font-weight: bold; border : 1px solid black; padding: 4px 7px 2px 7px;"
				href="review_list?page=${i}&pageDataCount=${bPageVO.pageDataCount}">${i}</a>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<a href="review_list?page=${i}&pageDataCount=${bPageVO.pageDataCount}">${i}</a>&nbsp;&nbsp;
			</c:otherwise>
			</c:choose>
 			</c:forEach>
			<a href="review_list?page=${bPageVO.nextPageNum }&pageDataCount=${bPageVO.pageDataCount}">뒤로▶</a>&nbsp;&nbsp;
			<a href="review_list?page=${bPageVO.lastPageNum }&pageDataCount=${bPageVO.pageDataCount}">맨뒤로▶▶</a>&nbsp;&nbsp;
			</td>
		</tr>
	  </table>
    </div>
    </div>
<%@ include file="../footer.jsp" %>     