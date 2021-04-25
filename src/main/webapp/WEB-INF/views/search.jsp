<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 윗부분 추가  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our_검색</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/review.css" rel="stylesheet" type="text/css">  
  <script type="text/javascript" src="./javascript/member.js"></script>   
<script src="./javascript/js/jquery.js"></script>
<script>
function searchBtn(){
	if($(".input_title").val() == ""){
		alert("검색어를 입력하세요");
		return false;
	} else{
		return true;
	}
}
function goProduct(pNum){
	opener.location.href="product_detail?pNum=" + pNum;
	self.close();
}
function goReview(rev_num){
	opener.location.href="review_detail?rev_num=" + rev_num;
	self.close();
}
function goAsk(qNum){
	opener.location.href="ask_detail?qNum=" + qNum;
	self.close();
}
</script>
</head>
<body>
<!-- 헤더 윗부분 추가  -->
<form  method="post" name="formm" action="search">
	<div id="id" class="search">
		<input type="text" class="input_title" name="searchStr" placeholder="검색어를 입력하세요">
		<input type="submit" class="btn1_style" value="검색" onclick="return searchBtn();">
	</div>
</form>
<form  method="post" name="formm" action="review_update">  
	<div class="searchResult">
		<fieldset>
			<legend>
			상품 검색 결과 (최근 5개만)
			</legend>
				<table>
					<tr><th>순번</th><th class="bold">종류</th><th class="bold">이름</th><th>가격</th><th>재고</th></tr>
				<c:forEach items="${pSearchList}" var="prodVO" begin="0" end="4"  varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>
							<a href="javascript:goProduct(${prodVO.pNum});">${prodVO.medium}</a>
						</td>
						<td>
							<a href="javascript:goProduct(${prodVO.pNum});">${prodVO.pName}</a>
						</td>
						<td>${prodVO.price}</td>
						<td>${prodVO.stock}</td>
					</tr>
				</c:forEach>
				</table>
		</fieldset>
		<fieldset>
			<legend>
			리뷰 검색 결과 (최근 5개만)
			</legend>
				<table>
					<tr><th>순번</th><th>아이디</th><th class="bold">제목</th><th class="bold">작성일</th><th>평점</th></tr>
				<c:forEach items="${rSearchList}" var="revVO" begin="0" end="4" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${revVO.id}</td>
						<td>
							<a href="javascript:goReview(${revVO.rev_num});">${revVO.rev_title}</a>
						</td>
						<td>
							<a href="javascript:goReview(${revVO.rev_num});">${fn:split(revVO.rev_date,' ')[0]}</a>
						</td>
						<td>${revVO.rev_score}점</td>
					</tr>
				</c:forEach>
				</table>
		</fieldset>
		<fieldset>
			<legend>
			1:1문의 검색 결과 (최근 5개만)
			</legend>
				<table>
					<tr><th>순번</th><th>아이디</th><th class="bold">종류</th><th class="bold">제목</th><th>작성일</th></tr>
				<c:forEach items="${aSearchList}" var="askVO" begin="0" end="4" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${askVO.id }</td>
						<td><a href="javascript:goAsk(${askVO.qNum});">${askVO.q_category }</a></td>
						<td>
							<a href="javascript:goAsk(${askVO.qNum});">${askVO.q_title}</a>
						</td>
						<td>${fn:split(askVO.q_date,' ')[0]}</td>
					</tr>
				</c:forEach>
				</table>
		</fieldset>
	</div>
</form>
<input type="button" class="btn3_style" value="닫기" onclick="javascript:window.close()">
</body>
</html>