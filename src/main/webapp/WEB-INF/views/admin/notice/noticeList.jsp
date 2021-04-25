<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>fl#our 관리자페이지</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript" src="/javascript/js/jquery.min.js"></script>

<script>
	function go_Noticedetail(tpage, notiNum) {
		var theForm = document.frm;
		// 상품 상세 보기 페이지에서 다시 상품 리스트로 돌아왔을 경우 현재 페이지로
		// 돌아올 수 있도록 하기 위해서 현재 페이지 번호를 쿼리 스트링으로 넘겨준다.
		theForm.action = "admin_notice_detail?tpage="
				+ tpage + "&notiNum=" + notiNum;

		theForm.submit();
	}
</script>

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
			<div class="title">
				<a href="index"><img class="title-img"
					src="admin/images/LOGONEW.png"></a>
			</div>
			<div id="topM">
				<ul>
					<li><a href="#"
						onClick="location.href='admin_logout'">로그아웃</a>
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
		<div class="admin_title">
			공지사항&nbsp;&nbsp;&nbsp;<input type="button" value="글쓰기"
				onclick="location.href='admin_notice_write_form'">
		</div>

		<div class="admin_content"></div>
		<form name="frm" method="post">
			<table class="productList">
				<tr>
					<th>글번호</th>
					<th>카테고리</th>
					<th>문의글제목</th>
					<th>회원아이디</th>
					<th>문의일자</th>
				</tr>
				<c:forEach items="${noList}" var="noList">

					<tr>
						<td>${noList.notiNum}</td>
						<td>${noList.noti_true}</td>
						<td><a href="#"
							onclick="go_Noticedetail('${tpage }','${noList.notiNum}')">${noList.noti_title}</a></td>
						<td>${noList.id}</td>
						<td>${noList.noti_date}</td>

					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="admin_title">
			FAQ 게시판&nbsp;&nbsp;&nbsp;<input type="button" value="글쓰기"
				onclick="location.href='admin_notice_write_form'">
		</div>

		<div class="admin_content"></div>
		<table class="productList">
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>문의글제목</th>
				<th>회원아이디</th>
				<th>문의일자</th>
			</tr>
			<c:forEach items="${faqList}" var="faqList">

				<tr>
					<td>${faqList.notiNum}</td>
					<td>${faqList.noti_true}</td>
					<td><a href="#"
							onclick="go_Noticedetail('${tpage }','${faqList.notiNum}')">${faqList.noti_title}</a></td>
					<td>${faqList.id}</td>
					<td>${faqList.noti_date}</td>

				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>