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
  <link href="./css/review.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/review.js"></script>
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>      
</head>
<body>  
<div class="container">
<%@ include file="../header.jsp" %>      
  <div class="contentbody product_D">
    <div class="body1 product_D">
    <div id="itemdetail" >
      <form  method="post" name="formm" action="review_rev">  
        <input type="hidden" name="rev_num" value="${reviewVO.rev_num}">
        <input type="hidden" name="id" value="${loginUser.id}">
        <input type="hidden" name="writer" value="${reviewVO.id}">
        <input type="hidden" name="pass" value="${reviewVO.rev_pass}">
        <input type="hidden" id="pre_rev" name="pre_rev" value="${reviewVO.rev_rev}">
        <table id="review_table">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 75%;">
                <col style="width: 10%;">
            </colgroup>
            <tr>
                <td colspan="3" class="rev_title">&ensp;${reviewVO.rev_title}</td>
            </tr>
            <tr>
                <td class="rev_name">&ensp;${reviewVO.id}</td>
                <td class="rev_name">${reviewVO.rev_update}</td>
                <td class="rev_name">${reviewVO.rev_click}</td>
            </tr>
            <tr><td colspan="3"  class="under_gray_Border1">
            </td></tr>
            <tr>
                <td rowspan="2" class="paddingZone"><img class="p_pic" src="./images/${pVo.pic}"/></td>
                <td colspan="2">${pVo.pName}</td>
            </tr>
            <tr>
                <td colspan="2">판매금액 : ${pVo.price}</td>
            </tr>
            <tr><td colspan="3"  class="under_gray_Border1">
            </td></tr>
            <tr>
                <td colspan="3" class="paddingZone">&ensp;${reviewVO.rev_contents}</td>
            </tr>
            <tr><td colspan="3" class="under_gray_Border1">
            </td></tr>
            <tr>
            	<td colspan="3" class="rev_score">&emsp;별점 :
            		 &ensp; 
                <c:forEach var="star" begin="1" end="5" varStatus="status">
                	<c:if test="${reviewVO.rev_score - status.count >= 0}">
                		★
                	</c:if>
                	<c:if test="${reviewVO.rev_score - status.count < 0}">
                		☆
                	</c:if>
                </c:forEach>
            	</td>
            </tr>
            <tr><td colspan="3" class="under_gray_Border1">
            </td></tr>
            <tr>
                <td colspan="3" class="rev_score">&ensp;
                <c:choose>
            	<c:when test="${empty reviewVO.rev_rev}">
	            	0개의 댓글이 있습니다.          	
				</c:when>
				<c:otherwise>
		           	${fn:length(rev_list)}개의 댓글이 있습니다.
	           		<hr>
	           		<c:forEach var="revlist" items="${rev_list}" varStatus="status">
	           			<div id="line_li">
	           			<c:set var="id" value="${fn:split(revlist,'#i@d!')[1]}"/>
	           			<c:set var="content" value="${fn:split(revlist,'#i@d!')[0]}"/>
		           		&emsp;<span class="rev_id">${id}</span>
		           		&emsp;|&emsp;
		           		<span class="rev_con">${content}</span>&emsp;
		           		<c:if test="${id == loginUser.id }">
		           		<span class="rev_delete">x</span>
		           		</c:if>
	           			</div>
		           		<hr>
	           		</c:forEach>
				</c:otherwise>
            	</c:choose>
                </td>
            </tr>
            <c:choose>
            	<c:when test="${empty sessionScope.loginUser}">
	            <tr>
	                <td colspan="3" class="rev_rev">&ensp;로그인 하셔야 댓글을 등록하실 수 있습니다.</td>
	            </tr>            	
				</c:when>
				<c:otherwise>
	            <tr>
	                <td colspan="3">&ensp;&ensp; 
	                    <textarea class="rev_area" name="rev_rev" rows="5" cols="110"></textarea>
	                    &ensp;&ensp;<input type="submit" class="btn1_style" value="답글등록">
	                </td>
	            </tr>
	            <tr><td colspan="3" class="under_gray_Border1">
	            </td></tr>
	            <tr>
	                <td colspan="3">
	                    <div class="btn_area">
	                        <input type="button" value="삭제하기" class="btn1_style" onclick="go_update('delete')">
	                        <input type="button" value="수정하기" class="btn1_style" onclick="go_update('update')">
	                    </div>
	                </td>
	            </tr>
				</c:otherwise>
            </c:choose>
        </table>
          <div class="btn_area">
              <input type="button" value="이전으로" class="btn2_style" onclick="go_prev(${reviewVO.rev_num})">
              <input type="button" value="다음으로" class="btn2_style" onclick="go_next(${reviewVO.rev_num})">
              <input type="button" value="목록으로" class="btn2_style" onclick="go_list()">
          </div>
      </form>
       </div>
	</div>
</div>
<script type="text/javascript">
$(".rev_delete").on("click", function() {
	if (confirm('삭제할까요?')) {
        // Yes or no click
        var str = $("#pre_rev").val();
        var deleteSTR = $(this).parent().find(".rev_con").text().trim() + "#i@d!" +
        $(this).parent().find(".rev_id").text().trim() + "#e@n!d~";
		var reStr = str.replace(deleteSTR, "");
        $("#pre_rev").val(reStr.trim());
        
		document.formm.action = "review_rev_delete";
		document.formm.submit();
   } else {
       // no click
   }
});
</script>
<%@ include file="../footer.jsp" %>    