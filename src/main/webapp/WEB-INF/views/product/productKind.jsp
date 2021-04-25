<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 윗부분 추가  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/product.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/product.js"></script>
   <script type="text/javascript" src="./javascript/js/jquery.js"></script>  
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>     
<style type="text/css">
#con1 {
    width: auto;
    height: 400px;
    background-color: wheat;
}

.mySlides {
    display: none
}

#con1 img {
    width: auto;
    height: 400px;
}

.slideshow-container {
    width: 100%;
    height: 400px;
    position: relative;
    margin: auto;
}

.prev {
    cursor: pointer;
    position: absolute;
    top: 45%;
    left: 0;
    width: auto;
    padding: 16px;
    margin-top: -22px;
    color: white;
    font-weight: bold;
    font-size: 40px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    user-select: none;
}

.next {
    cursor: pointer;
    position: absolute;
    top: 45%;
    width: auto;
    padding: 16px;
    margin-top: -22px;
    color: white;
    font-weight: bold;
    font-size: 40px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    user-select: none;
}

/* Position the "next button" to the right */
.next {
    right: 0;
    border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
    background-color: rgba(0, 0, 0, 0.8);
}

.dot {
    cursor: pointer;
    height: 20px;
    width: 20px;
    margin: 0 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
}

.active,
.dot:hover {
    background-color: #717171;
}

/* Fading animation */
.fade {
    height: 170px;
    -webkit-animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-name: fade;
    animation-duration: 1.5s;
}

@-webkit-keyframes fade {
    from {
        opacity: .4
    }

    to {
        opacity: 1
    }
}

@keyframes fade {
    from {
        opacity: .4
    }

    to {
        opacity: 1
    }
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {

    .prev,
    .next,
    .text {
        font-size: 11px
    }
}
</style>

</head>
<body>
  <div class="container">
<!-- 헤더 윗부분 추가  -->
<%@ include file="../header.jsp" %>  
    <c:if test="${kind == 1 || kind == 5}" >
<div>
	 <div>
      <div id="con1" class="body3">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <img src="images/2020-1_120856.png" style="width:100%">
                <div class="text" style="visibility: hidden;">Caption Text</div>
            </div>
            <div class="mySlides fade">
                <img src="images/2020-1_153654.png" style="width:100%">
                <div class="text" style="visibility: hidden;">Caption Two</div>
            </div>
            <div class="mySlides fade">
                <img src="images/2020-1_120856.png" style="width:100%">
                <div class="text" style="visibility: hidden;">Caption Three</div>
            </div>
            <div class="mySlides fade">
                <img src="images/2020-1_153654.png" style="width:100%">
                <div class="text" style="visibility: hidden;">Caption Three</div>
            </div>

            <a class="prev" onclick="plusSlides(-1)">◁</a>
            <a class="next" onclick="plusSlides(1)">▷</a>

            <div style="text-align:center ; margin-top: 200px;">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
            </div>
        </div>
      </div>
    </c:if>
<c:if test="${kind > 1 && kind < 5}">
<div class="contentbody flower">
    <div class="body1 flower">
</c:if>
<c:if test="${kind > 5}">
<div class="contentbody tree">
    <div class="body1 tree">
</c:if>
<c:if test="${!empty bestProductList}">
    <div class="bestP"><h3>베스트 상품</h3></div>
	<table class="flower_1 borderLine">
   		<tr> 
		<c:forEach items="${bestProductList}" var="bProductVO" begin="0" end="3">
      	     <td class="flower_rec"><div class="items">
		       	 <a href="product_detail?pNum=${bProductVO.pNum}">
		         <img src='images/${bProductVO.pic}'>
		         <br>${bProductVO.pName}<br>${bProductVO.price}(${bProductVO.stock})</a></div>
		     </td>
	  	</c:forEach>
	  	</tr>  
	</table>
</c:if>
    <table class="flower_1">
	  	<%-- begin = startList  end = endList --%>
	    <c:forEach var="productVO" items="${productList}" varStatus="status">
			<c:if test="${status.first }">
				<tr>
			</c:if>	   	    
		       	<td class="flower_rec"><div class="items">
		       	 <a href="product_detail?pNum=${productVO.pNum}">
		         <img src='./images/${productVO.pic}'>
		         <br>${productVO.pName}
		         <br>${productVO.price}(${productVO.stock})
		         </a></div>
		       	</td>
		    <c:if test="${status.count%4 == 0 }">
				</tr>
				<tr>
		    </c:if>
			<c:if test="${status.last }">
				</tr>
			</c:if>
		</c:forEach>
		<tr>
		<td colspan="4" class="page_area">
			<a href="product?kind=${kind }&page=${bPageVO.firstPageNum }&pageDataCount=${bPageVO.pageDataCount}">◀◀맨앞으로</a>&nbsp;&nbsp;
			<a href="product?kind=${kind }&page=${bPageVO.prevPageNum }&pageDataCount=${bPageVO.pageDataCount}">◀앞으로</a>&nbsp;&nbsp;
			<c:forEach var="i" begin="${bPageVO.startPageNum }" end="${bPageVO.endPageNum }" step="1">
			<c:choose>
			<c:when	test="${i eq bPageVO.currentPageNum }">
				<a style="font-weight: bold; border : 1px solid black; padding: 4px 7px 2px 7px;"
				href="product?kind=${kind }&page=${i}&pageDataCount=${bPageVO.pageDataCount}">${i}</a>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<a href="product?kind=${kind }&page=${i}&pageDataCount=${bPageVO.pageDataCount}">${i}</a>&nbsp;&nbsp;
			</c:otherwise>
			</c:choose>
 			</c:forEach>
			<a href="product?kind=${kind }&page=${bPageVO.nextPageNum }&pageDataCount=${bPageVO.pageDataCount}">뒤로▶</a>&nbsp;&nbsp;
			<a href="product?kind=${kind }&page=${bPageVO.lastPageNum }&pageDataCount=${bPageVO.pageDataCount}">맨뒤로▶▶</a>&nbsp;&nbsp;
			</td>
		</tr>
	  </table>
    </div>
    </div>
<script>
//슬라이더
var slideIndex = 0;
      showSlides();

      function showSlides() {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
          }
          slideIndex++;
          if (slideIndex > slides.length) { slideIndex = 1 }
          for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex - 1].style.display = "block";
          dots[slideIndex - 1].className += " active";
          setTimeout(showSlides, 5000); // Change image every 2 seconds
      }
      // 자동슬라이드

      var Index = 1;
      changeSlides(Index);

      function plusSlides(n) {
          changeSlides(Index += n);
      }

      function currentSlide(n) {
          changeSlides(Index = n);
      }

      function changeSlides(n) {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          if (n > slides.length) { Index = 1 }
          if (n < 1) { Index = slides.length }
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
          }
          for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[Index - 1].style.display = "block";
          dots[Index - 1].className += " active";
      }
</script>
<%@ include file="../footer.jsp" %>     