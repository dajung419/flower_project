<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/order.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/order.js"></script>   
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>    
</head>
<body>  
<div class="container">
<%@ include file="../header.jsp" %> 
<div class="contentbody">
    <div class="body1">
        <h2>Order / Payment</h2>
        <div class="order">
          <div class="cart_process">
            <span class="cart_pagenation_on">장바구니</span>
            <span class="back_arrow">▶</span>
            <span class="cart_pagenation">주문서 작성</span>
            <span class="back_arrow">▶</span>
            <span class="cart_pagenation">주문 완료</span>
          </div>
        </div>
        <div class="section_container_mypage">
          <div class="section_contents">
            <div class="delete-btn-area">
              <input type="button" value="선택삭제" id="selectDel" class="delete" onclick="deleteOne()">
              <input type="button" value="전체삭제" id="allDel" class="delete" onclick="deleteAll()">
            </div>
            <form  method="post" name="formm" action="order">
            <table class="cart_table">
              <colgroup>
                <col width="150px;">
                <col width="700px;">
                <col width="150px;">
                <col width="250px;">
                <col width="290px;">
              </colgroup>
              <thead>
                <tr class="cart_m">
                  <td style="height:50px;">
                    <input type="checkbox" name="orderNum" class="chk_all" checked>
                    	<label class="txt_size1">전체선택</label>
                  </td>
                  <td>상품명</td>
                  <td>수량</td>
                  <td>판매가</td>
                  <td>
                   	 주문금액
                    <br>
                    (적립 예정)
                  </td>
                </tr>
              </thead>
              <tbody>
              	<c:choose>
              		<c:when test="${empty cartList }">
	                <tr class="cart_list">
	                  <td colspan="5" class="empty_cart" style="height:50px;">장바구니에 담긴 상품이 없습니다.</td>
	                </tr>
	                <tr class="total_area">
	                  <td colspan="5" class="total">0 원</td>
	                </tr>
              		</c:when>
              		<c:otherwise>
              		<c:forEach items="${cartList}" var="cartVO">
              			<tr class="cart_list">
		                  <td class="txt_center" style="height:50px;">
		                    <input type="checkbox" name="orderNum" class="chk_one" value="${cartVO.orderNum}" checked>
		                   	<c:set var="charge" value="${cartVO.orderQ * cartVO.price}"></c:set>
		                   	<input type="hidden" class="chh" value="${charge}">
		                  </td>
		                  <td><a href="product_detail?pNum=${cartVO.pNum }">&nbsp;&nbsp;${cartVO.pName}</a></td>
		                  <td class="txt_center">
		                  	<input type="number" name="orderQ" class="qty" id="qty${cartVO.orderNum}" value="${cartVO.orderQ}">
		                  	<input type="hidden" class="price" name="price" value="${cartVO.price}">
		                  </td>
		                  <td class="txt_center"><fmt:formatNumber value="${cartVO.price}"/>원</td>
		                  <td class="txt_center">
		                   	 <fmt:formatNumber value="${charge}"/>원
		                   	 <c:set var="totalcharge" value="${totalcharge + charge}"></c:set>
		                    <br>
		                   	 (<fmt:formatNumber value="${charge/5}"/>점)
		                  </td>
		                </tr>
              		</c:forEach>
			        <tr class="total_area">
			           <td colspan="5" class="total"><label class="totalCh"><fmt:formatNumber value="${totalcharge}"/> 원</label></td>
			        </tr>
              		</c:otherwise>
              	</c:choose>
              </tbody>
            </table>
            <table>
              <tr>
                <div class="order-btn-area">
                  <input type="button" value="선택주문" onclick="selectOrder()" class="Payment">
                  <input type="button" value="전체주문" onclick="allOrder()" class="Payment">
                </div>
              </tr>
            </table>
            </form>
          </div>
        </div>
       </div>
    </div>
<script type="text/javascript">

$(".qty").change(function(){
	var orderNum = $(this).parent().parent().find(".chk_one").val();
	var qty = $(this).val();
	document.formm.action = "cart_update?orderNum=" +orderNum + "&orderQ=" +qty 
	+ "&o_price=" + ($(this).parent().find(".price").val() * qty);
	document.formm.submit();
});

var temp = $(".totalCh").text();
$(".chk_all").on('click', function(){
	if ($(".chk_all").is(':checked')) {
		$(".totalCh").text(temp);
        $("input[type=checkbox]").prop("checked", true);
    } else {
		$(".totalCh").text("0 원");
        $("input[type=checkbox]").prop("checked", false);
    }
});
$(".chk_one").on('click', function(){
	var charge=0;
	var get_input_checked = $(".cart_list input[type=checkbox]:checked");
	$.each(get_input_checked, function() {
		var tmp = $(this).parent().find(".chh").val();
		 charge += (tmp*1);
	});
	$(".totalCh").text(charge.toLocaleString() + " 원");
	
	/* var get_input_unchecked = $(".cart_list input[type=checkbox]:unchecked");
	console.log(get_input_unchecked);
	$.each(get_input_unchecked, function (index, value) {
	console.log('인덱스값 ' + index);
	console.log(value);
	console.log('id =' + $(value).attr("id"));
	console.log('name =' + $(value).attr("name"));
	console.log('value =' + $(value).val());
	}); */

	//alert(${totalcharge});
});

</script>
<%@ include file="../footer.jsp" %>  
