<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>fl#our 관리자페이지-상품수정</title>
	<link href="admin/css/admin.css?v=3" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="admin/javascript/product.js"></script>
  <script type="text/javascript" src="./javascript/js/jquery.js"></script>  
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>  
	<style type="text/css">
.admin .admin_list {
	font-family: '카페24 고운밤';
	font-size: 14pt;
}

.btn-file {
	display: none;
	text-align: right;
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
        <div class="admin_title">상품수정</div>
        <div class="admin_product_write">
        
<form name="frm" method="post"enctype="multipart/form-data"> 
<input type="hidden" name="pNum" value="${productVO.pNum}">     
<input type="hidden" name="nonmakePic" value="${productVO.pic }">	
            <table>
            <tr>
            <th style="size: 30px;">대분류</th>
                    <td><select name="major">
					    <option value="${productVO.major }">${productVO.major }</option>
					    <option value="---" >----------</option>
                            <option value="꽃" >꽃</option>
							<option value="나무" >나무</option>
					  </select>      
					</td>
             </tr>
                
             <tr><th>중분류</th>
                    <td><select name="medium">
					    <option value="${productVO.medium }">${productVO.medium }</option>
					    <option value="---" >----------</option>
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
                <tr><th>상품이름</th><td><input type="text" name="pName" value="${productVO.pName }"></td></tr>
                <tr><th>가격</th><td><input type="text" name="price" value="${productVO.price }"> 원</td></tr>
                <tr><th>재고</th><td><input type="text" name="stock" value="${productVO.stock }"> 개</td></tr>
                
                
                
                <tr><th>상품설명</th>
                    <td><textarea name="content" cols="50" rows="10">${productVO.content }</textarea></td>
                </tr>
                <tr><th>상품이미지</th>
                    <td><img src="./images/${productVO.pic }">
                    <br><input type="file" name="pic" id="btn-file" class="btn-file">
                    <input type="button" class="Fbtn" value="파일선택" onclick="fileActive()">
                    <label id="pNL">${productVO.pic }</label>
                    &ensp;(상품이미지 변경시에만 선택)</td>
                    
                </tr>
                <tr>
                
               <tr>
			    <th>베스트상품</th>
			    <td>
					<c:choose>
						<c:when test='${productVO.bestyn=="y"}'>
							<input type="checkbox" name="bestyn" checked="checked" value="y">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="bestyn" value="n" >
						</c:otherwise>   	 		
					</c:choose>
			   	</td>
			
			    <th>사용유무</th>
			     <td>
					<c:choose>
						<c:when test='${productVO.useyn=="y"}'>
							<input type="checkbox" name="useyn" checked="checked" value="y">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="useyn" value="n" >
						</c:otherwise>   	 		
					</c:choose>
			   	</td>
			  </tr>
                <tr>
                    <th colspan="2" style="background-color: white;">
                    <input class="btn"  type="button" value="수정" onClick="go_mod_save('${productVO.pNum}')">
                    <input class="btn"  type="button" value="취소" onClick="go_mov()"> 
                    </th>
                </tr>
            </table>
            </form>
        </div>
    </section>
</body>
<script type="text/javascript">
function fileActive(){
	document.querySelector('#btn-file').click();
}

/* const browseBtn = document.querySelector('.Fbtn');
const realInput = document.querySelector('#btn-file');

browseBtn.addEventListener('click',()=>{
	realInput.click();
}); */
</script>
<script>
$(function() {
	$("#btn-file").change(function(e){
		 //   alert($('input[type=file]')[0].files[0].name); //파일이름
		 //      alert($("#btn-file")[0].files[0].type); // 파일 타임
		 //      alert($("#btn-file")[0].files[0].size); // 파일 크기
		 //  $('input[type=file]')[0].files[0].name;
		 //  $("#imgUpload")[0].files[0].type;
		 //  $("#imgUpload")[0].files[0].size;
		$("#pNL").text($('input[type=file]')[0].files[0].name);
	  });
	});
</script>
</html>
