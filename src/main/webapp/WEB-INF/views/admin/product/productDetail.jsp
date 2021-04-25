<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fl#our 상품상세보기</title>
<link rel="stylesheet" href="admin/css/admin.css" >
<script type="text/javascript" src="admin/javascript/product.js"></script>
	<script type="text/javascript" src="/javascript/js/jquery.min.js"></script>

	<style type="text/css">
	.admin .admin_list{
	font-family: '카페24 고운밤';
	font-size: 14pt;
	}
	</style>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
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
                <li><a href="admin_ask_list">공지사항관리</a></li>
            </ul>
        </div>
        <div class="admin_title">상품상세보기</div>
        <div class="admin_product_detail">
        <form name="frm" method="post">
        <input type="hidden" name="bestyn" value="${productVO.bestyn }">      
		<input type="hidden" name="useyn" value="${productVO.useyn }">   
            <table>
                <tr><th style="size: 30px;">대분류</th><td>${productVO.major }</td></tr>
                <tr><th>중분류</th><td>${productVO.medium }</td></tr>
                <tr><th>상품이름</th><td>${productVO.pName }</td></tr>
                <tr><th>가격</th><td>${productVO.price }</td></tr>
                <tr><th>상품설명</th><td>${productVO.content }</td></tr>
                <tr><th>상품이미지</th><td><img src="./images/${productVO.pic }"></td></tr>
                <tr>
	                <th>베스트상품</th>
	                <td>
		                <c:choose>
				   	 		<c:when test='${productVO.bestyn=="y"}'>y</c:when>
				   	 		<c:otherwise>n</c:otherwise>   	 		
				   	 	</c:choose>
			   	 	</td>
	                <th>사용유무</th>
	                <td>
	                	<c:choose>
				   	 		<c:when test='${productVO.useyn=="y"}'>y</c:when>
				   	 		<c:otherwise>n</c:otherwise>   	 		
				   	 	</c:choose>
	                </td>
                <tr>
                    <th colspan="4" style="background-color: white;">
                    <!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. --> 
                    <input class="btn"  type="button" value="수정" onClick="go_mod('${productVO.pNum}')">
                    <!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. --> 
                    <input class="btn"  type="button" value="목록" onClick="go_list()"> 
                    
                    <input class="btn"	type="button" value="삭제" onClick="go_del('${productVO.pNum}')">
                    </th>
                </tr> 
            </table>
        </form>
        </div>
    </section>
    
</body>
</html>