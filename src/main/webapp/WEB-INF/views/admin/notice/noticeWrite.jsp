<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>fl#our 관리자페이지-공지등록</title>
<link href="admin/css/admin.css?v=3" rel="stylesheet" type="text/css">
<script type="text/javascript" src="admin/javascript/product.js"></script>
<script type="text/javascript" src="/javascript/js/jquery.min.js"></script>
<script>
function go_Noticesave() {
	var theForm = document.frm;

	if (theForm.noti_true.value == '') {
		alert('글분류를 선택하세요.');
		theForm.noti_true.focus();
	} else if (theForm.noti_title.value == '') {
		alert('글제목을 입력하세요.');
		theForm.noti_title.focus();
	} else if (theForm.noti_contents.value == '') {
		alert('글내용을 입력하세요.');
		theForm.noti_contents.focus();
	} else {
		theForm.action = "admin_notice_write";
		theForm.submit();
	}

	// theForm.price1.value = removeComma(theForm.price1);
	// theForm.price2.value = removeComma(theForm.price2);
	// theForm.price3.value = removeComma(theForm.price3);

	// productWrite.jsp 폼 페이지에서 입력받은 값을
	// 디비에 추가하기 위한 페이지인 product_save.jsp로 이동하되
	// 입력받은 상품 코드를 쿼리 스트링 형태로 전달한다.
	// 상품 코드로 폴더를 만들어 거기에 이미지 파일을 업로드한다.

}

function go_Noticemov() {
	var theForm = document.frm;
	theForm.action = "admin_notice_list";
	theForm.submit();
}</script>

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
		<div class="admin_title">공지등록</div>
		<div class="admin_product_write">
			<form name="frm" method="post">
				<table>
					<tr>
						<th style="size: 30px;">대분류</th>
						<td><select name="noti_true">
								<option value="">글분류</option>
								<option value="y">공지사항</option>
								<option value="n">FAQ</option>
						</select></td>
					</tr>

					<tr>
						<th>글제목</th>
						<td><input type="text" name="noti_title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="id" value="${workerId }"></td>
					</tr>
					<tr>
						<th>글내용</th>
						<td><textarea name="noti_contents" cols="80" rows="10"></textarea></td>
					</tr>

					<tr>
						<th colspan="2" style="background-color: white;"><input
							class="btn" type="button" value="공지등록" onClick="go_Noticesave()">
							<input class="btn" type="button" value="취소"
							onClick="go_Noticemov()"></th>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>