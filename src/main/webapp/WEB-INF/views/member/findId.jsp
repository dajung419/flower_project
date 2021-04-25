<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 윗부분 추가  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/find.css" rel="stylesheet" type="text/css">  
  <script type="text/javascript" src="./javascript/member.js"></script>   
<script src="./javascript/js/jquery.js"></script>
</head>
<body>
<!-- 헤더 윗부분 추가  -->
<div class="container">
<%@ include file="../header.jsp" %>  
		<div class="contentbody">
			<div class="body1 find">

        <div id="find_id" class="find_idpw" >
          <h1 class="tit">아이디 찾기</h1>
                <p class="sub-tit">회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</p>
                <div class="radio-wrap">
            <label>        <input type="radio" name="find_id_type" value="email" checked="checked" /> 이메일로 찾기</label>
            <label>        <input type="radio" name="find_id_type" value="mobile" /> 휴대폰 번호로 찾기</label>
                </div>
                <div class="find-info">
                    <table>
                        <colgroup>
                            <col width="135"/><col width="*"/>
                        </colgroup>
                        <tr class="user-name" height="38" style="border-bottom: 1px solid;">
                            <th><div>이&nbsp;&nbsp;름</div></th>
                            <td><div>     <input type="text" id="name" name="name"  class="MS_input_txt" value="" maxlength="30" title="이름" placeholder=""></div></td>
               </tr>
                       <tr height="38" id="find_id_email_wrap">
                           <th><div>이메일</div></th>
                           <td><div>       <input type="text" id="find_id_email" name="find_id_email"  class="MS_input_txt" value="" maxlength="80" title="이메일 주소" placeholder=""></div></td>
                       </tr>
                       <tr id="find_id_mobile_wrap" style="display:none;">
                            <th scope="row"><div>휴대폰 번호</div></th>
                            <td>
                                <div>       <input type="text" id="find_id_mobile" name="find_id_mobile"  class="MS_input_txt" value="" maxlength="20" title="휴대폰번호"></div>
                            </td>
                        </tr>
                   </table>

                   <div class="btn-area">
                       <a  href="javascript:find_type('find_id');" class="buttonPro xlarge black xrounded">아이디 찾기</a>
                       <a  href="javascript:history.back();" class="buttonPro xlarge black xrounded">뒤로</a>
                   </div>
                </div>	
            </div>

           </div>
      </div>
    </div>    
<%@ include file="../footer.jsp" %>     
