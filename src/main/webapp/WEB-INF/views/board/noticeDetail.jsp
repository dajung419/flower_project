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
</head>
<body>  
<div class="container">
<%@ include file="../header.jsp" %>      
  <div class="contentbody product_D">
    <div class="body1 product_D">
    <div id="itemdetail" >
        <table id="review_table">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 75%;">
                <col style="width: 10%;">
            </colgroup>
            <tr>
                <td colspan="3" class="rev_title">&ensp;${nVo.noti_title}</td>
            </tr>
            <tr>
                <td colspan="2" class="rev_name">&ensp;${nVo.id}</td>
                <td class="rev_name">${nVo.noti_date}</td>
            </tr>
            <tr><td colspan="3"  class="under_gray_Border1">
            </td></tr>
            <tr>
                <td colspan="3" class="noti_contents">&ensp;${nVo.noti_contents}</td>
            </tr>
	        <tr>
	            <td colspan="3">
	                <div class="btn_area">
	                <%-- 관리자일때 삭제 수정?
	                    <input type="button" value="삭제하기" class="btn1_style" onclick="go_delete()">
	                    <input type="button" value="수정하기" class="btn1_style" onclick="go_update()">
	                --%>
	                    <input type="button" value="목록으로" class="btn2_style" onclick="history.back()">
	                </div>
	            </td>
           </tr>
        </table>
       </div>
	</div>
</div>
<script type="text/javascript">
//리스트로 이동
function go_list() {
	
}
</script>
<%@ include file="../footer.jsp" %>    