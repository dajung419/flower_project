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
<script type="text/javascript" src="admin/javascript/product.js"></script>
<script type="text/javascript" src="/javascript/js/jquery.min.js"></script>

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<style type="text/css">
.admin .admin_list{
font-family: '카페24 고운밤';
font-size: 14pt;
}
</style>
</head>

<body>
<form name="frm" method="post"> 
<input type="hidden" name="useyn" value="${productVO.useyn }"> 
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
        <div class="admin_title">상품리스트</div>
        <div class="admin_content">
            <table>
                <tr>
                <td width="842">
                	상품명 
                <input type="text" name="key" onkeypress="JavaScript:go_search();">
			     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
			     <input class="btn" type="button" name="btn_total" value="전체보기 " onClick="go_total()">
			     <input class="btn" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
                </td>
                </tr>
            </table>
        </div>
    
        <table class="productList">
                <tr>
                    <th>번호</th><th>대분류</th><th>중분류</th><th>상품이름</th><th>가격</th><th>재고</th><th>사용유무</th>
                </tr>
                
                <c:choose>
			    <c:when test="${productListSize<=0}">
			    <tr>
			      <td width="100%" colspan="7" align="center" height="23">
			        등록된 상품이 없습니다.
			      </td>      
			    </tr>
			    </c:when>
			    
				<c:otherwise>
				<c:forEach items="${productList}" var="productVO">
			    <tr>
			      <!-- 번호 -->
			      <td align="center">${productVO.pNum}</td> 
			      
			      <!-- 대분류 -->
			      <td>${productVO.major}</td>
			      
			      <!-- 중분류 -->
			       <td>${productVO.medium}</td>
			      
			      <!-- 상품이름 -->
			      <td style="text-align: left">
			      <a href="#" onClick="go_detail('${productVO.pNum}')">${productVO.pName}</a>
			      </td>
			   	  
			   	  <!-- 가격 -->
			   	   <td>${productVO.price}</td>
			      
			   	  <!-- 재고 -->
			   	   <td>${productVO.stock}</td>
			      
			   	  <!-- 사용유무 -->
			   	  <td>
			      		<c:choose>
				   	 		<c:when test='${productVO.useyn=="y"}'>사용</c:when>
				   	 		<c:otherwise>미사용</c:otherwise>   	 		
				   	 	</c:choose>
			   	  </td> 
			    </tr>
			    </c:forEach>
			    <tr>
			    	<td colspan="7" class="page_area" style="text-align: center;">
			    		<a href="admin_product_list?page=${bPageVO.firstPageNum }&pageDataCount=${bPageVO.pageDataCount}&key=${key}">◀◀맨앞으로</a>&nbsp;&nbsp;
						<a href="admin_product_list?page=${bPageVO.prevPageNum }&pageDataCount=${bPageVO.pageDataCount}&key=${key}">◀앞으로</a>&nbsp;&nbsp;
						<c:forEach var="i" begin="${bPageVO.startPageNum }" end="${bPageVO.endPageNum }" step="1">
						<c:choose>
						<c:when	test="${i eq bPageVO.currentPageNum }">
							<a style="font-weight: bold; border : 1px solid black; padding: 4px 7px 2px 7px;"
							href="admin_product_list?page=${i}&pageDataCount=${bPageVO.pageDataCount}&key=${key}">${i}</a>&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<a href="admin_product_list?page=${i}&pageDataCount=${bPageVO.pageDataCount}&key=${key}">${i}</a>&nbsp;&nbsp;
						</c:otherwise>
						</c:choose>
			 			</c:forEach>
						<a href="admin_product_list?page=${bPageVO.nextPageNum }&pageDataCount=${bPageVO.pageDataCount}&key=${key}">뒤로▶</a>&nbsp;&nbsp;
						<a href="admin_product_list?page=${bPageVO.lastPageNum }&pageDataCount=${bPageVO.pageDataCount}&key=${key}">맨뒤로▶▶</a>&nbsp;&nbsp;
			    	</td>
			    </tr>
				</c:otherwise>	
			</c:choose>  
       </table>
    </section>
</form>
</body>
</html>
