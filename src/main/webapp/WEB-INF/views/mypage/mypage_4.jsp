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
<link href="./css/style_mypage.css" rel="stylesheet">    
  <script type="text/javascript" src="./javascript/member.js"></script>   
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  //script구문 내부에 해당 메소드를 입력합니다.
$(function() {
    $( "#birthpicker" ).datepicker({
        dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
        prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
        nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
        changeMonth: false, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        //showAnim: "slide", //애니메이션을 적용한다.
        yearRange: "1920:2020", //연도 범위
        showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
        closeText: '닫기', // 닫기 버튼 텍스트 변경
        currentText: '오늘', // 오늘 텍스트 변경
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
        yearSuffix: '년',	//
        showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//        buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//        buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
//        buttonText: "Select date"	// 조그만한 아이콘 툴팁
    });
});
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

</script>
</head>
<body>
<div class="container">
<%@ include file="../header.jsp" %> 
<div class="contentbody">
    <div class="body1 mypage">
     
        <div class="my1Header">
          <h2>MyPage</h2>
          <ul class="mypagebar">
       
            <li class="m1"><a href="mypage_point">적립금조회</a></li>
            <li class="m2"><a href="mypage_2">주문조회</a></li>
            <li class="m3"><a href="mypage_3">1:1문의</a></li>
            <li class="m4" style="background-color: #c0bdbd;"><a href="mypage_4">정보수정</a></li>
            <li class="m5"><a href="mypage_5">&nbsp;탈퇴&nbsp;</a></li>
          </ul>
        </div>
       <div class="body1 joinm">
     
                <form method="post" class="join_form" action="mypage_4_Update" name="formm">
                  <table id="joinTbm">
                    <tr>
                      <td class="spacem"></td>
                      <th>아이디</th>
                      <td><input type="hidden" name="id" value="${loginUser.id }">${loginUser.id }</td>
                    </tr>
                    
                    <tr>
                      <td class="spacem"></td>
                      <th>비밀번호</th>
                      <td><input type="password" name="pass" placeholder="영문/숫자포함 6자 이상" class="inputBox"> </td>
                    </tr>
                    
                    <tr>
                      <td class="spacem"></td>
                      <th>비밀번호 확인</th>
                      <td><input type="password" name="pass_re" class="inputBox"></td>
                    </tr>
                    
                    <tr>
                      <td class="spacem"></td>
                      <th> 이름</th>
                      <td>${loginUser.name}</td>
                    </tr>
                   
                    <tr>
                      <td class="spacem"></td>
                      <th> 생년월일</th>
                      <td>${loginUser.birth }</td>
                    </tr>
                    <tr>
                      <td class="spacem"></td>
                      <th>연락처</th>
                      <td>
                        <select name="phone_1" class="inputBox">
                          <option value="010">010</option>
                          <option value="011">011</option>
                          <option value="02">02</option>
                          <option value="031">031</option>
                          <option value="032">032</option>
                        </select> -
                        <input type="text" name="phone_2" class="inputBox"> -
                        <input type="text" name="phone_3" class="inputBox">
                      </td>
                
                    </tr>
                    <tr>
                    <td class="space"></td>
                    <th>주소</th>
                    <td>
                      <input type="text" name="post" id="post" readonly class="inputBox">
                      <input type="button" class="inputBox" value="우편번호검색" onclick="daumPostcode()">
                    </td>
                  </tr>
                  <tr>
                    <th colspan="2"></th>
                    <td><input type="text" name="address_1" id="address" class="textfiled" style="width: 500px; height: 25px;" readonly>
                    <br><br>세부 주소 : <input type="text" name="address_2" id="detailAddress" class="textfiled" style="width: 500px; height: 25px;">
                    <br><br><input type="hidden" id="extraAddress" placeholder="(참고항목)" name="referAdd">
                    </td>
                  </tr>
                    <tr>
                      <td colspan="3" id="col">
                        <input type="submit" value="수정완료" class="coll"
                        onclick="return mypageCheck()">
                        <input type="reset" value="취소" class="coll"
                        onclick="location.href='mypage_4'">
                      </td>
                    </tr>
                  </table>
            </form>
      </div>    
       </div>
      </div>
    </div>
    

<%@ include file="../footer.jsp" %>
</body>
</html>