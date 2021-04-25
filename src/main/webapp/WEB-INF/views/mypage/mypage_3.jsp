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
            <li class="m2"><a href="mypage_2">주문조회</a></li>
            <li class="m3" style="background-color: #c0bdbd;"><a href="mypage_3">1:1문의</a></li>
            <li class="m4"><a href="javascript:open_win('mypage_check_pass_form?id=${loginUser.id}','mcheck');">정보수정</a></li>
            <li class="m5"><a href="mypage_5">&nbsp;탈퇴&nbsp;</a></li>
          </ul>
        </div>
        <div id="ask">
        <form method="post" action="mypage_3_detail1" name="formm">
          <table class="type12">
            <thead>
              <tr class="ask1">
                <th scope="col">NO.</th>
                <th scope="col">CONTENT</th>
                <th scope="col">Reply</th>
                <th scope="col">DATE</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="ask" items="${askList }" varStatus="status">
              <c:choose>
              <c:when test="${status.count%2 ==0 }">
              <tr class="ask1">
                <th scope="row" class="even">${ask.qNum }</th>
                <td class="even"><a href="ask_detail?qNum=${ask.qNum }">${ask.q_title }</a></td>
                <td class="even">${ask.replyornot }</td>
                <td class="even">${ask.q_date }</td>
              </tr>
              </c:when>
              <c:otherwise>
              <tr class="ask1">
                <th scope="row">${ask.qNum }</th>
                <td><a href="ask_detail?qNum=${ask.qNum }">${ask.q_title }</a></td>
                <td>${ask.replyornot }</td>
                <td>${ask.q_date }</td>
              </tr>
              </c:otherwise>
              
              </c:choose>
              </c:forEach>
           </tbody>
          </table>
         <input type="button" value="등록하기" class="ask2" onclick="askForm()">
        </form>
                        
       </div>
      </div>  
</div>
</div>
<script type="text/javascript">
function askForm(){
	var url = "ask_write_form";
	  window.open( url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1300, height=900, top=20, left=50, ");
}
</script>
<%@ include file="../footer.jsp" %>