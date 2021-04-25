<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script type="text/javascript">
  function go_search()
  {
     document.frm.action="admin_ask_list";
     document.frm.submit();
  }
</script>
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
                <li><a href="admin_notice_list">공지사항관리</a></li>
            </ul>
        </div>
        <div class="admin_title">1:1문의현황</div>
		<div class="admin_content">
	
  <!--    <table>
                <tr>
                <td width="842">문의일자 <input type="text" name="key">
                <input class="btn" type="button" name="btn_search" value="검색" onclick="go_search()">
                </td>
                </tr>
        </table>-->    
        </div>
        <form name="frm" method="post"> 
        <table class="productList">
                <tr>
                    <th>문의글번호</th><th>문의상품</th><th>카테고리</th><th>문의글제목</th><th>회원아이디</th><th>문의일자</th><th>답변여부</th>
                </tr>
                <c:forEach items="${askList}" var="askVO">
			    	 
					<tr>
						<td>${askVO.qNum}</td>
					    <td>${askVO.pNum}</td>
					    <td>${askVO.q_category}</td>
					    <td><a href="admin_ask_detail?qNum=${askVO.qNum}">${askVO.q_title}</a></td>
					    <td>${askVO.id}</td> 
					    <td><fmt:formatDate value="${askVO.q_date}"/></td> 
					    <td>${askVO.replyornot}</td>
					</tr>
				</c:forEach>
        </table>
	</form>
    </section>

</body>
</html>
