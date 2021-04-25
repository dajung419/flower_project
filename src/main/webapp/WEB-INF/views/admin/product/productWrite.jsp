<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>fl#our 관리자페이지-상품등록</title>
	<link href="admin/css/admin.css?v=3" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="admin/javascript/product.js"></script>
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
                <li><a href="admin_ask_list">공지사항관리</a></li>
            </ul>
        </div>
        <div class="admin_title">상품등록</div>
        <div class="admin_product_write">
        <form name="frm" method="post" enctype="multipart/form-data"> 
            <table>
                <tr><th style="size: 30px;">대분류</th>
                    <td> 
	                    <select name="major">
					    <option value="">대분류</option>
                            <option value="꽃" >꽃</option>
							<option value="나무" >나무</option>
					  </select>      
					</td>
                </tr>
                <tr><th>중분류</th>
                    <td><select name="medium">
					    <option value="">중분류</option>
                            <option value="꽃다발" >꽃다발</option>
							<option value="꽃바구니" >꽃바구니</option>
							<option value="화환" >화환</option>
							<option value="꽃화분" >꽃화분</option>
							<option value="---" >----------</option>
							<option value="미니나무" >미니나무</option>
							<option value="소형나무" >소형나무</option>
							<option value="중형나무" >중형나무</option>
							<option value="기타" >기타</option>
					  </select>
                    </td>
                </tr>
                <tr><th>상품이름</th><td><input type="text" name="pName"></td></tr>
                <tr><th>가격</th><td><input type="text" name="price"> 원</td></tr>
                <tr><th>재고</th><td><input type="text" name="stock"> 개</td></tr>
                <tr><th>상품설명</th>
                    <td><textarea name="content" cols="50" rows="10"></textarea></td>
                </tr>
                <tr><th>상품이미지</th>
                    <td>
                        <input type="file" name="pic">
                    </td>
                </tr>
                <tr>
			    <th>베스트상품</th>
			    <td>
			          <input type="checkbox" name="bestyn" >
			    </td>        
			    
			    <th>사용유무</th>
			    <td>
			          <input type="checkbox" name="useyn" >
			    </td>
			  </tr>
                <tr>
                    <th colspan="2" style="background-color: white;">
                    <input class="btn"  type="button" value="상품등록" onClick="go_save()">
                    <input class="btn"  type="button" value="취소" onClick="go_mov()"> 
                    
                    </th>
                </tr>
            </table>
            </form>
        </div>
    </section>

</body>
</html>
