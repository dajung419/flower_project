<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
</head>
<body>  
<div class="container">
<%@ include file="../header.jsp" %>      
 <div class="contentbody product_D">
    <div class="body1 product_D">
    <div id="itemdetail" >
    <h1> ${productVO.medium} </h1>
      <form  method="post" name="formm">  
          <table id="sell_p_table">
            <colgroup>
                <col style="width: 34%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 40%;">
                <col style="width: 10%;">
            </colgroup>
            <tr>
                <td rowspan="11" class="product_pic"><img src="images/${productVO.pic}"/></td>
                <td rowspan="11"></td>
                <td colspan="2" class="text_size3"><h3> ${productVO.pName} </h3></td>
                <td id="snsArea">
                <div class="snsBtn">공유</div>
                	<div class="sns_hidden"><a href="#"><img src="images/link.png"/></a></div>
                	<div class="sns_hidden"><a href="#"><img src="images/kakaotalk.png"/></a></div>
                    <div class="sns_hidden"><a href="#"><img src="images/facebook.png"/></a></div>
                    <div class="sns_hidden"><a href="#"><img src="images/insta.png"/></a></div>
                </td>
            </tr>
            <tr><td colspan="4"  class="underBorder2">
                <input type="hidden" name="pNum" id="pNum" value="${productVO.pNum}">
                <input type="hidden" name="price" value="${productVO.price}">
            </td></tr>
            <tr>
                <td>판매가</td>
                <td>${productVO.price} 원</td>
                <td></td>
            </tr>
            <tr>
                <td>재고</td>
                <td>${productVO.stock} 개</td>
                <td></td>
            </tr>
            <tr>
                <td>배송비</td>
                <td>무료</td>
                <td></td>
            </tr>
            <tr>
                <td>수량</td>
               <td><input type="number" min="1" name="orderQ" value="1"></td>
                <td></td>
            </tr>
            <tr><td colspan="4"  class="underBorder1"></td></tr>
            <tr>
                <td>옵션</td>
                <td colspan="2">
                    <select class="selectO">
                        <option value="0">
                            = 옵션 : 가격 =
                        </option>
                        <option value="1">
                            Medium(사진크기) : 가격동일 
                        </option>
                        <option value="2">
                            Large : +40,000원
                        </option>
                    </select>
                </td>
            </tr>
            <tr><td colspan="4"  class="underBorder3"></td></tr>
            <tr>
            <c:choose>
            	<c:when test="${empty sessionScope.loginUser}">
                <td colspan="3" rowspan="2">
                    <div id="buttons"  class="text_center">
                        <input type="button" value="장바구니" class="confirm_btn" onclick="go_login()"> 
                        <input type="button" value="목록으로" class="back_btn" onclick="href=history.back()">
                        <input type="button" value="즉시 구매"	class="confirm_btn" onclick="go_login()"> 
                    </div>
                </td>
				</c:when>
				<c:otherwise>
                <td colspan="3" rowspan="2">
                    <div id="buttons"  class="text_center">
                        <input type="button" value="장바구니" class="confirm_btn" onclick="go_cart()"> 
                        <input type="button" value="목록으로" class="back_btn" onclick="href=history.back()">
                        <input type="button" value="즉시 구매"	class="confirm_btn" onclick="go_order_insert()"> 
                    </div>
                </td>
				</c:otherwise>
            </c:choose>
            </tr>
        </table>
        <table id="small_pic_table">
            <tr>
                <td colspan="5" class="search_pic"><img src="./images/search.png"></td>
                
            </tr>
            <tr>
                <td><</td>
                <td class="small_pic"><img src="./images/${productVO.pic}"></td>
                <td></td>
                <td></td>
                <td>></td>
            </tr>
        </table>
      </form>  
    </div>
    </div>
    <div class="body2">
        <div class="flex_row">
            <div class="select_menu">
                <table class="p_description">
                    <tr>
                        <td id="p_des1">상품상세정보</td>
                        <td id="p_des2">반품 및 교환안내</td>
                        <td id="p_des3">
                        <c:choose>
            				<c:when test="${empty reviewList}">
	                       	 	상품후기(0)
            				</c:when>
            				<c:otherwise>
							<c:forEach var="reviewVO" items="${reviewList}"	varStatus="status">
								<c:set var="rev_count" value="${status.count}"/>
							</c:forEach>
								상품후기(${rev_count})
							</c:otherwise>
            			</c:choose>
                        </td>
                        <td id="p_des4">
                        <c:choose>
            				<c:when test="${empty askList}">
	                       	 	상품문의(0)
	                       	 	<c:if test="${!empty loginUser }">
		                       	 	&ensp;
		                       	 	<input type="button" id="askBtn" class="btn3_style" value="문의" onclick="askPForm()">
	                       	 	</c:if>
            				</c:when>
            				<c:otherwise>
							<c:forEach var="askVO" items="${askList}"	varStatus="status">
								<c:set var="ask_count" value="${status.count}"/>
							</c:forEach>
								상품문의(${ask_count})
								<c:if test="${!empty loginUser }">
									&ensp;
									<input type="button" id="askBtn" class="btn3_style" value="문의" onclick="askPForm()">
								</c:if>
							</c:otherwise>
            			</c:choose>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="content1">
                ${productVO.content}  
            </div>
            <div id="content2">
               <img alt="baesong" src="images/baesong.JPG">   
            </div>
            <div id="review">
				<c:forEach var="reviewVO" items="${reviewList}" varStatus="status">
					 <c:choose>
            			<c:when test="${status.first }">
            			</c:when>
            			<c:otherwise>
						</c:otherwise>
            		</c:choose>
					<c:choose>
            			<c:when test="${status.first }">
					<table id="review_1">
						<tr>
							<td class="flower_rec">
							<div class="items">
								<a
								href="review_detail?rev_num=${reviewVO.rev_num}">
								제목 : ${reviewVO.rev_title} &emsp;&emsp;|&emsp;&emsp; 작성일 : ${reviewVO.rev_date}
								&emsp;|&emsp; 별점 :
            		 			&ensp; 
				                <c:forEach var="star" begin="1" end="5" varStatus="stat">
				                	<c:if test="${reviewVO.rev_score - stat.count >= 0}">
				                		★
				                	</c:if>
				                	<c:if test="${reviewVO.rev_score - stat.count < 0}">
				                		☆
				                	</c:if>
				                </c:forEach>
								<br><br>
								<br> ${reviewVO.rev_contents}
								</a>
								</div>
							</td>
						</tr>
						<c:if test="${rev_count > 1 }">
						<tr>
							<td>
								<input type="button" id="nextBtn" class="confirm_btn" value="다음 >" onclick="next_rev('review_',${status.count})">
							</td>
						</tr>
						</c:if>
					</table>
					</c:when>
					<c:otherwise>
					<table id="review_${status.count}" style="display:none;">
						<tr>
							<td class="flower_rec">
							<div class="items">
								<a
								href="review_detail?rev_num=${reviewVO.rev_num}">
								제목 : ${reviewVO.rev_title} 
								<br><br> 별점 :&ensp; 
				                <c:forEach var="star" begin="1" end="5" varStatus="stat">
				                	<c:if test="${reviewVO.rev_score - stat.count >= 0}">
				                		★
				                	</c:if>
				                	<c:if test="${reviewVO.rev_score - stat.count < 0}">
				                		☆
				                	</c:if>
				                </c:forEach>
								&emsp;&emsp;|&emsp;&emsp; 작성일 : ${reviewVO.rev_date}
								<br><br>
								<br> ${reviewVO.rev_contents}
								</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
							<c:choose>
	            				<c:when test="${status.last }">
									<input type="button" id="prevBtn" class="confirm_btn" value="< 이전" onclick="prev_rev('review_',${status.count})">
	            				</c:when>
	            				<c:otherwise>
									<input type="button" id="prevBtn" class="confirm_btn" value="< 이전" onclick="prev_rev('review_',${status.count})">
									<input type="button" id="nextBtn" class="confirm_btn" value="다음 >" onclick="next_rev('review_',${status.count})">
								</c:otherwise>
            				</c:choose>
							</td>
						</tr>
					</table>
					</c:otherwise>
            		</c:choose>
				</c:forEach>
			</div>
            <div id="qna">
                <c:forEach var="askVO" items="${askList}" varStatus="status">
					<c:choose>
            			<c:when test="${status.first }">
						<table id="ask_1">
			            <colgroup>
			                <col style="width: 15%;">
			                <col style="width: 30%;">
			                <col style="width: 15%;">
			                <col style="width: 40%;">
			            </colgroup>
			            <tr>
			                <td>&ensp;Title&ensp;
			                </td>
			                <td>&ensp;
			                	${askVO.q_title }
			                </td>
			                <td>&ensp;Date
			                </td>
			                <td>
			                	${askVO.q_date }
			                </td>
			            </tr>
			            <tr><td colspan="4" class="under_gray_Border1">
			            </td>
			            </tr>
			            <tr>
			                <td>&ensp;Contents</td>
			                <td colspan="3" class="paddingZone">
			                	${askVO.q_contents }
			                </td>
			            </tr>
			            <tr><td colspan="4" class="under_gray_Border1">
			            </td>
			            </tr>
			            <tr>
			            	<td colspan="4" class="replyZ">
			                	<input type="hidden" class="input_title" name="reply">
			                	<div id="replyZone">
			                	</div>
			            	</td>
			            </tr>
			            <c:if test="${ask_count > 1 }">
						<tr>
							<td colspan="4">
								<div class="btn_area">
									<input type="button" id="nextBtn" class="confirm_btn" value="다음 >" onclick="next_rev('ask_',${status.count})">
								</div>
							</td>
						</tr>
						</c:if>
			        </table>
					</c:when>
            		<c:otherwise>
					<table id="ask_${status.count}" style="display:none;">
			            <colgroup>
			                <col style="width: 15%;">
			                <col style="width: 30%;">
			                <col style="width: 15%;">
			                <col style="width: 40%;">
			            </colgroup>
			            <tr>
			                <td>&ensp;Title&ensp;
			                </td>
			                <td>&ensp;
			                	${askVO.q_title }
			                </td>
			                <td>&ensp;Date
			                </td>
			                <td>
			                	${askVO.q_date }
			                </td>
			            </tr>
			            <tr><td colspan="4" class="under_gray_Border1">
			            </td>
			            </tr>
			            <tr>
			                <td>&ensp;Contents</td>
			                <td colspan="3" class="paddingZone">
			                	${askVO.q_contents }
			                </td>
			            </tr>
			            <tr><td colspan="4" class="under_gray_Border1">
			            </td>
			            </tr>
			            <tr>
			            	<td colspan="4" class="replyZ">
			                	<input type="hidden" class="input_title" name="reply">
			                	<div id="replyZone">
			                	</div>
			            	</td>
			            </tr>
						<tr>
							<td colspan="4">
								<c:choose>
	            				<c:when test="${status.last }">
									<input type="button" id="prevBtn" class="confirm_btn" value="< 이전" onclick="prev_rev('ask_',${status.count})">
	            				</c:when>
	            				<c:otherwise>
									<input type="button" id="prevBtn" class="confirm_btn" value="< 이전" onclick="prev_rev('ask_',${status.count})">
									<input type="button" id="nextBtn" class="confirm_btn" value="다음 >" onclick="next_rev('ask_',${status.count})">
								</c:otherwise>
            				</c:choose>
							</td>
						</tr>
					</table>
			        </c:otherwise>
            		</c:choose>
				</c:forEach>
            </div>
    </div>
</div>
<script>

function askPForm(){
	var url = "ask_write_form?pNum="+${productVO.pNum};
	  window.open( url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1300, height=950, top=20, left=50, ");
}


function next_rev(table, num){
	$("#"+table+num).hide();
	num++;
	$("#"+table+num).show();
}
function prev_rev(table, num){
	$("#"+table+num).hide();
	num--;
	$("#"+table+num).show();
}

//상세설명 먼저 띄워줌.
  $(function(){
      $('#content1').show();
  });
  $(".bestYn").on('click', function(){
      alert($(this).val());
      if($(this).val() == 'y'){
      	$(this).val('n');
      } else {
    	$(this).val('y');    	  
      }
      alert($(this).val());
  });
  // 메뉴버튼 클릭시 해당 컨텐츠 보임
    $("#p_des1").on('click', function(){
      $(".select_menu ~ div").hide();
      $('#content1').show();
      $(this).css({'font-weight':'bold','border-bottom':'1px solid white'});
      $(this).siblings().css({'font-weight':'lighter','border-bottom':'1px solid rgb(168, 168, 168)'});
    });
    $("#p_des2").on('click', function(){
      $(".select_menu ~ div").hide();
      $('#content2').show();
      $(this).css({'font-weight':'bold','border-bottom':'1px solid white'});
      $(this).siblings().css({'font-weight':'lighter','border-bottom':'1px solid rgb(168, 168, 168)'});
    });
    $("#p_des3").on('click', function(){
      $(".select_menu ~ div").hide();
      $('#review').show();
      $(this).css({'font-weight':'bold','border-bottom':'1px solid white'});
      $(this).siblings().css({'font-weight':'lighter','border-bottom':'1px solid rgb(168, 168, 168)'});
    });
    $("#p_des4").on('click', function(){
      $(".select_menu ~ div").hide();
      $('#qna').show();
      $(this).css({'font-weight':'bold','border-bottom':'1px solid white'});
      $(this).siblings().css({'font-weight':'lighter','border-bottom':'1px solid rgb(168, 168, 168)'});
    });
    $(".snsBtn").on('click', function(){
      $(this).siblings().slideToggle(); 
    });
  </script>
<%@ include file="../footer.jsp" %>    