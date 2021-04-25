<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fl#our</title>

  <script type="text/javascript" src="javascript/member.js"></script>  
<link href="css/detail.css" rel="stylesheet" type="text/css">
</head>
<body>
 <form method="post" action="mypage_2_detail" name="formm">
    <div class="detailqb">
    <div id="orderSt">
        <div class="top"><h3>ORDER LIST</h3></div>
        <p class="txt-date">
            <span><strong>[${cartVO.id}] </strong>님께서 ${cartVO.orderDate}에 주문하신 내역입니다.</span>
        </p>
         
        <div id="orderInfo">
            <h2>주문자정보</h2>
            <div class="table-w table-orderinfo">
                <table>
                <tbody>

                        <tr>
                            <th><div class="tb-center">주문번호</div></th>
                            <td><div class="tb-center">${cartVO.orderNum}</div></td>
                            <th><div class="tb-center">주문일자</div></th>
                            <td><div class="tb-center">${cartVO.orderDate}</div></td>
                        </tr>
                        <tr>
                            <th><div class="tb-center">주문자</div></th>
                            <td><div class="tb-center">${cartVO.id}</div></td>
                            <th><div class="tb-center">주문서 입금현황 </div></th>
                            <td><div class="tb-center">입금여부</div></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- 배송관련 정보 구현하지 않음 -->
                    <h2>배송지정보</h2>
            <div class="table-w table-region">
                
                <table>
                    <tbody>
                                        <tr>
                            <th><div class="tb-center">배송번호</div></th>
                            <td>
                                <div class="tb-center">
                                    배송번호                                                          </div>
                            </td>
                            <th><div class="tb-center">송장번호</div></th>
                            <td>
                                <div class="tb-center">
                                    택배사                                송장번호                               
                                        
                                                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><div class="tb-center">수취인</div></th>
                            <td><div class="tb-center">주문자</div></td>
                            <th><div class="tb-center">연락처</div></th>
                            <td><div class="tb-center">주문자 핸드폰번호</div></td>
                        </tr>
                        <tr>
                            <th><div class="tb-center">주소</div></th>
                            <td colspan="3"><div class="tb-left">주소</div></td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
                    <h2>주문상품정보</h2>
            <div class="table-w table-prdinfo">
                <table>
                    <thead>
                        <th colspan="2"><div class="tb-center">주문상품정보</div></th>
                        <th><div class="tb-center">상품별주문번호</div></th>
                        <th><div class="tb-center">수량</div></th>
                        <th><div class="tb-center">가격</div></th>
                        <th><div class="tb-center">적립금</div></th>
                        <th><div class="tb-center">배송번호</div></th>
                    </thead>
                    <tfoot>
                        <td colspan="8">
                            <div class="tb-right">
                                ${cartVO.price}(상품구매금액)
                                                                + 2,500(배송료)
                                                                                                                                                    (할인/추가금액)
                                                            = ${cartVO.o_price+2500}원
                            </div>
                        </td>
                    </tfoot>
                    <tbody>
                                        <tr>
                            <td>
                                <div class="tb-center">
                                                                    <img src="images/${cartVO.pic}" style="width: 58px;" />
                                                                </div>
                            </td>
                            <td>
                                <div class="tb-left">
                                    <a href="javascript:go_product();">${cartVO.pName}</a>
                                    
                                </div>
                            </td>
                            <td><div class="tb-center">${cartVO.orderNum}</div></td>
                            <td><div class="tb-center">${cartVO.orderQ}</div></td>
                            <td><div class="tb-center tb-price">${cartVO.o_price}</div></td>
                            <td><div class="tb-center"><span class="style4">${cartVO.o_price/10}</span></div></td>
                            <td><div class="tb-center">배송번호</div></td>
                        </tr>
                                    </tbody>
                </table>
            </div>
            <h2>결제정보</h2>
            <!-- 결제정보는구현하지 않음 -->
            <div class="table-w table-payinfo">
                <table>
                    <thead>
                        <th><div class="tb-center">결제방법</div></th>
                        <th><div class="tb-center">결제금액</div></th>
                        <th><div class="tb-center">세부내역</div></th>
                    </thead>
                    <tfoot>
                        <tr>
                            <td><div class="tb-center">무통장</div></td>
                            <td><div class="tb-center">41,500원 (입금완료)</div></td>
                            <td><div class="tb-center">국민은행 09340104188244 (예금주:(주)플아워) 
                                <span id="bankname_banker">주문자이름</span> 
                                                                            </div></td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td><div class="tb-center">사용한 적립금</div></td>
                            <td><div class="tb-center">0원</div></td>
                            <td><div class="tb-center">&nbsp;</div></td>
                        </tr>
                        <tr>
                            <td><div class="tb-center">사용한 예치금</div></td>
                            <td><div class="tb-center">0원</div></td>
                            <td><div class="tb-center">&nbsp;</div></td>
                        </tr>
                    </tbody>
                </table>
            </div>
           <!--  <div id="pop_order_btn_group">
                이미 상품이 배송 됐을시 
                <a href="JavaScript:alert('주문취소가 되지 않습니다.\n쇼핑몰에 문의하세요.')">
                <img src="./이미지/주문취소.png" /></a>-->
                <!-- 주문취소 가능할시 
                <a href="javascript:send('e129a2bb05bf2504500ad855387096c4', '20200727155141-66657535499', 'no');">
                <img src="./이미지/주문취소.png" /></a>

    </div>-->
   
        </div>
        </div>
        </div>
        </form>
<script type="text/javascript">
function go_product(){
	opener.location.href="product_detail?pNum=" + ${cartVO.pNum};
	self.close();
}
</script>
</body>
</html>