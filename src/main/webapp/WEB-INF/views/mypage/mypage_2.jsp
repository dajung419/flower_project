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
          <h2>MyPage</h2>
          <ul class="mypagebar">
       
            <li class="m1"><a href="mypage_point">적립금조회</a></li>
            <li class="m2" style="background-color: #c0bdbd;"><a href="mypage_2">주문조회</a></li>
            <li class="m3"><a href="mypage_3">1:1문의</a></li>
            <li class="m4"><a href="javascript:open_win('mypage_check_pass_form?id=${loginUser.id}','mcheck');">정보수정</a></li>
            <li class="m5"><a href="mypage_5">&nbsp;탈퇴&nbsp;</a></li>
          </ul>
        </div>
       <div id="order">
       <form method="post" action="mypage_2" name="formm">
        <table class="type11">
          <thead>
          <tr>
              <th scope="col">NO.</th>
              <th scope="col">DATE</th>
              <th scope="col">ORDER NO.</th>
              <th scope="col">PRODUCT</th>
              <th scope="col">PRICE</th>
              <th scope="col">DETAILE</th>
              <th scope="col">DELIVERY</th>
              <th scope="col">REVIEW</th>
              
          </tr>
          </thead>
          <tbody>
         <c:forEach var="cartList" items="${cartList }" varStatus="status">
          <tr>
              <th scope="row">${status.count }</th>
              <td>${cartList.orderDate }</td>
              <td>${cartList.orderNum }</td>
              <td>${cartList.pName }</td>
              <td>${cartList.o_price }</td>
              <td><a href="javascript:open_win1('mypage_2_detail?id=${loginUser.id}&orderNum=${cartList.orderNum }','orderdetail');">
              <img src="images/mypage/datail.png"></a></td>
              <td><a href="javascript:open_win2('delivery')"><img src="images/mypage/datail.png"></a></td>
              <td><a href="javascript:open_win3('review_write_form?pNum=${cartList.pNum }&orderNum=${cartList.orderNum }','reviewWrite');">
              <img src="images/mypage/review.png"></a></td>
          </tr>
          </c:forEach>
          
          </tbody>
      </table>
      </form>
         </div>
       </div>
      
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>