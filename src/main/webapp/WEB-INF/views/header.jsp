<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<header class="navi">
	<div class="title">
		<a href="index"><img class="title-img"
			src="./images/LOGONEW.png"></a>
	</div>
	<div id="topM">
		<ul>
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<li><a href="login_form">로그인</a></li>
					<li><a href="join_form">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="logout_flower">로그아웃</a></li>
					<li><a href="mypage_point">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="cart_list">장바구니</a></li>
		</ul>
	</div>
<script type="text/javascript">
 function searchMenuOpen(){
	 var url = "searchForm" 
	 window.open( url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=610, height=780");
 }
</script>
</header>
<nav class="navi">
	<ul id="navu">
		<li class="navl">
			<div class="div-inline">
				<a href="product?kind=1">꽃</a>
				<ul class="invi1">
					<li><a href="product?kind=1">꽃다발</a></li>
					<li><a href="product?kind=2">꽃바구니</a></li>
					<li><a href="product?kind=3">꽃화분</a></li>
					<li><a href="product?kind=4">화환</a></li>
				</ul>
			</div>
		</li>
		<li class="navl">
			<div class="div-inline">
				<a href="product?kind=5">나무</a>
				<ul class="invi2">
					<li><a href="product?kind=5">미니나무</a></li>
					<li><a href="product?kind=6">소형나무</a></li>
					<li><a href="product?kind=7">중형나무</a></li>
					<li><a href="product?kind=8">기타</a></li>
				</ul>
			</div>
		</li>
		<li class="navl">
			<div class="div-inline">
				<a href="notice_list">공지사항</a>
			</div>
		</li>
		<li class="navl">
			<div class="div-inline">
				<a href="review_list">리뷰</a>
			</div>
		</li>
		<li class="navl">
			<div class="div-inline">
				<a href="qna_list">자주 묻는 질문</a>
			</div>
		</li>
	</ul>
</nav>
<div id="left_menu" onclick="window.scrollTo(0,0);">
	<img src="./images/leftM.png" id="leftM">
</div>
<br>
<div id="left_menu2" onclick="window.scrollBy(0,3000);">
	<img src="./images/leftM.png" id="leftM2">
</div>
<div id="left_menu3" onclick="searchMenuOpen();">
	<img src="./images/search.png" id="leftM3">
</div>
<!--헤더파일 들어가는 곳 끝 -->