<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet"> 
  <link href="./css/style_mypage.css" rel="stylesheet">   
  <link href="./css/review.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/ask.js"></script>      
  <script type="text/javascript" src="./javascript/member.js"></script>      
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>  
  <style type="text/css">
  </style>
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
	<div class="askBody">
	<h2>1:1 문의</h2>
	<hr>
      <form  method="post" name="formm" action="ask_update">  
        <input type="hidden" name="id" value="${loginUser.id }">
        <c:if test="${!empty pVo}">
	    <input type="hidden" name="pNum" value="${pVo.pNum }">
        <table id="product_table">
        	<tr>
                <td rowspan="2" class="paddingZone"><img class="p_pic" src="./images/${pVo.pic}"/></td>
                <td>${pVo.pName}</td>
            </tr>
            <tr>
                <td>판매금액 : ${pVo.price}</td>
            </tr>
        </table>
        </c:if>
        <table id="product_table">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 30%;">
                <col style="width: 15%;">
                <col style="width: 40%;">
            </colgroup>
            <tr>
                <td>&ensp;Name&ensp;
                </td>
                <td>&ensp;
                	${loginUser.name }
                </td>
                <td>&ensp;Title&ensp;
                </td>
                <td>&ensp;
                	${askVO.q_title }
                </td>
            </tr>
            <tr>
                <td>&ensp;Category
                </td>
                <td>
                	${askVO.q_category }
                </td>
                <td>&ensp;Date
                </td>
                <td>
                	${askVO.q_date }
                </td>
            </tr>
            <tr><td colspan="4" class="under_gray_Border1">
            </td>
            </tr>
            <tr>
                <td>&ensp;Contents</td>
                <td colspan="3" class="paddingZone">
                	${askVO.q_contents }
                </td>
            </tr>
            <tr><td colspan="4" class="under_gray_Border1">
            </td>
            </tr>
            <tr>
            	<td>&ensp;Answer</td>
            	<td colspan="3" class="replyZ">
                	<input type="hidden" class="input_title" name="reply">
                	<div id="replyZone">
                	${askVO.reply}
                	</div>
            	</td>
            </tr>
            <tr><td colspan="4" class="under_gray_Border1">
            </td>
            </tr>
	        <tr>
	            <td colspan="4">
	                <div class="btn_area">
	                    <input type="button" value="수정하기" class="btn1_style" onclick="askUpForm()">
	                    <input type="button" value="삭제하기" class="btn1_style" onclick="deleteAsk()">
	                    <input type="button" value="목록으로" class="btn2_style" onclick="location.href='mypage_3'">
	                </div>
	            </td>
	        </tr>
        </table>
      </form>
      </div>
     </div>
	</div>
<script type="text/javascript">
function askUpForm(){
	var url = "ask_update_form?qNum=" + ${askVO.qNum};
	  window.open( url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1250, height=900, top=20, left=50, ");
}

function deleteAsk() {
	if(confirm("삭제하시겠습니까?")){
		document.formm.action = "ask_delete?qNum="+${askVO.qNum};
		document.formm.submit();
	}
}
</script>
<%@ include file="../footer.jsp" %>    