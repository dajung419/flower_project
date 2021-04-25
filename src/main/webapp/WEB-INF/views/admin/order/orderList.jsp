<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script type="text/javascript">
  function go_order_save() {
    var count = 0;
    if (document.frm.sign.length == undefined) {
      if (document.frm.sign.checked == true) {
        count++;
      }
    } else {
      for ( var i = 0; i < document.frm.sign.length; i++) {
        if (document.frm.sign[i].checked == true) {
          count++;
        }
      }
    }
    if (count == 0) {
      alert("주문처리할 항목을 선택해 주세요.");
    } else {
      document.frm.action = "admin_order_save";
      document.frm.submit();
    }
  }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>fl#our 관리자페이지</title>
	<link rel="stylesheet" href="admin/css/admin.css" >
	<script type="text/javascript" src="admin/javascript/order.js"></script>
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
        <div class="admin_title">주문리스트</div>
		<div class="admin_content">
	<form name="frm" method="post"> 
        <table>
                <tr>
                <td width="842">주문자 ID <input type="text" name="key">
                <input class="btn" type="button" name="btn_search" value="검색" onclick="go_search()">
                </td>
                </tr>
        </table>
        </div>
    
        <table class="productList">
                <tr>
                    <th>주문번호(처리여부)</th><th>주문자</th><th>상품번호</th><th>주문수량</th><th>주문일</th><th>결재여부</th>
                </tr>
                
                
                
                
                <c:forEach items="${orderList}" var="orderVO">
					<tr>
					    <td>
						      <c:choose>
						        <c:when test='${orderVO.sign=="n"}'>
						        <span style="font-weight: bold; color: blue">${orderVO.orderNum}</span>
						        (<input type="checkbox" name="sign" value="${orderVO.orderNum}"> 미처리)
						        </c:when>
						        <c:otherwise>
						          <span style="font-weight: bold; color: red">${orderVO.orderNum}</span>
						          (<input type="checkbox" checked="checked" disabled="disabled">처리완료)
						        </c:otherwise>
						      </c:choose>
					    </td>
					    <td>${orderVO.id}</td> 
					    <td>${orderVO.pNum}</td>
					    <td>${orderVO.orderQ}</td> 
					    <td>${orderVO.orderDate}</td>
					    <td>${orderVO.sign}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" style="text-align: center; width: 200px;" > 
						<input type="button" class="ordercheck" style="width: 200px; color:red;" value="배송처리(입금확인)" onClick="go_order_save()">
				 	</td>
				 </tr>
        </table>
	</form>
    </section>

</body>
</html>
