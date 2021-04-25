<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>fl#our 관리자페이지</title>
	<link rel="stylesheet" href="admin/css/admin.css" >
	<script type="text/javascript" src="/javascript/js/jquery.min.js"></script>
	
	<style type="text/css">
	.admin .admin_list{
	font-family: '카페24 고운밤';
	font-size: 14pt;
	}
	</style>
</head>
<script>
function replycheck(){
	var theForm = document.frm;
	
	if(theForm.reply.value==''){
		alert('답변을 입력하세요.');
		theForm.reply.focus();
		}
	if(confirm('답변을 등록하시겠습니까?')){
		theForm.action="admin_ask_save";
		theForm.submit();
	}
	
}
function asklist(){
	var theForm = document.frm;
	theForm.action = "admin_ask_list";
	theForm.submit();
}
</script>
<body>

    <div class="container">
        <header class="navi">
        <div class = "title">
            <a href="index"><img class="title-img" src="admin/images/LOGONEW.png"></a>
        </div>
            <div id="topM">
                <ul>
                    <li>
                   	<a href="#" onClick="location.href='admin_logout'">로그아웃</a>	
                    </li>
                </ul>
            </div>
        </header>  
    </div>
    
    <section class="admin">
        <div class="admin_list">
            <ul>
                <li><a href="admin_product_list">상품리스트</a></li>
                <li><a href="admin_order_list">주문리스트</a></li>
                <li><a href="admin_member_list">회원리스트</a></li>
                <li><a href="admin_ask_list">1:1문의현황</a></li>
                <li><a href="admin_ask_list">공지사항관리</a></li>
            </ul>
        </div>
        <div class="admin_title">1:1문의현황 [ ${askVO.q_title} ]</div>
  	 <form name="frm" method="post"> 
    <input type="hidden" name="qNum" value="${askVO.qNum }">
    <div class="admin_ask_list">
        <table class="askdetail_table">
        
                <tr>
                    <th>문의글제목</th>
                    <td>${askVO.q_title}</td>
                </tr>
                <tr>
                    <th>회원아이디</th>
                    <td>${askVO.id}</td>
                </tr>
                <tr>
                    <th>문의상품</th>
                    <td>${askVO.pNum}</td>
                    <th>상품분류</th>
                    <td>${askVO.q_category}</td>
                </tr>
                <tr>
                    <th >문의일자</th>
                    <td><fmt:formatDate value="${askVO.q_date}"/></td> 
                </tr>
                <tr id="contents">
                    <th>문의내용</th>
                    <td colspan="3">${askVO.q_contents}</td>
                </tr>
				
				<c:choose>
					<c:when test="${askVO.replyornot == 'y'}">
						<tr>
							<th id="reply">답변내용</th>
							<td colspan="3"><textarea name="reply"
							rows="9" cols="80">${askVO.reply}</textarea></td>
						</tr> 
						<tr>
						<td></td>
							<td colspan="3">
							<input class="btn" type="button" value="답변수정" onClick="replycheck()" >
							<input class="btn" type="button" value="목록" onClick="asklist()">
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th id="reply">답변</th>
							<td colspan="3"><textarea name="reply"
							rows="9" cols="80"></textarea></td>
						</tr> 
						<tr>
						<td></td>
							<td colspan="3">
							<input class="btn" type="button" value="답변등록" onClick="replycheck()" >
							<input class="btn" type="button" value="목록" onClick="asklist()">
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
        </table>
   	 </div>
    </form>
    </section>

</body>
</html>
