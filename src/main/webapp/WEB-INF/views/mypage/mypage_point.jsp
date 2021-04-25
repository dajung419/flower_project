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
     
        <div class="my1Header">
		<input type="hidden" value="">
          <h2>MyPage</h2>
          <ul class="mypagebar">
       
            <li class="m1" style="background-color: #c0bdbd;">
              <a href="mypage_point">적립금조회</a></li>
            <li class="m2"><a href="mypage_2">주문조회</a></li>
            <li class="m3"><a href="mypage_3">1:1문의</a></li>
            <li class="m4"><a href="javascript:open_win('mypage_check_pass_form?id=${loginUser.id}','mcheck');">정보수정</a></li>
            <li class="m5"><a href="mypage_5">&nbsp;탈퇴&nbsp;</a></li>
          </ul>
        </div>
       <div id="chunkuan">
         <ul>
         <li id="ck1">총 보유 적립금액</li>
        <li><div class="ck"><label id="ck">
        ${loginUser.point}<span>&nbsp;won</span></label></div>
       </li> 
      </ul> 
      <table class="type10">
        <thead>
        <tr>
            <th scope="col">DATE</th>
            <th scope="col">POINT</th>
            <th scope="col">DESCRIPTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="point" items="${pointList }" varStatus="status">
       <c:choose>
       <c:when test="${status.count%2 == 0 }">
        <tr>
            <th scope="row" class="even">
           <%--  <fmt:formatDate value="${point.orderDate}"/> --%>
           ${point.orderDate}
            </th>
            <td class="even">${point.o_price/10 } won</td>
            <td class="even">상품구매</td>
        </tr>
        </c:when>
        <c:otherwise>
        <tr>
            <th scope="row">
            <%-- <fmt:formatDate value="${point.orderDate}"/> --%>
            ${point.orderDate}
            </th>
            <td>${point.o_price/10 } won</td>
            <td>상품구매</td>
        </tr>
       </c:otherwise>
        
        
        </c:choose>
        </c:forEach>
        </tbody>
    </table>
      </div>
       </div>
      
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>