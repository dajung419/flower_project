<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/review.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/ask.js"></script>      
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>  
  <script type="text/javascript" src="./resources/js/HuskyEZCreator.js" charset="utf-8"></script>
  <style type="text/css">
  .askBody{
	display: block;
	margin: 8%;
	background-color: white;
	}
  </style>
</head>
<body>  
<div class="container">
  <div class="contentbody">
    <div class="askBody">
	<h2>1:1 문의</h2>
	<hr>
      <form  method="post" name="formm" action="ask_write">  
        <input type="hidden" name="id" value="${loginUser.id }">
        <c:if test="${!empty pVo}">
	        <input type="hidden" name="pNum" value="${pVo.pNum }">
	        <table id="product_table">
	        	<tr>
	                <td rowspan="2" class="paddingZone"><img class="p_pic" src="./images/${pVo.pic}"/></td>
	                <td colspan="2">${pVo.pName}</td>
	            </tr>
	            <tr>
	                <td colspan="2">판매금액 : ${pVo.price}</td>
	            </tr>
	        </table>
        </c:if>
        <table id="review_table">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 25%;">
                <col style="width: 15%;">
                <col style="width: 45%;">
            </colgroup>
            <tr>
                <td>&ensp;Name
                </td>
                <td>
                	<input type="text" class="input_title" name="name" value="${loginUser.name }" readonly>
                </td>
                <td>&emsp;&emsp;Category
                </td>
                <td>
                	<select class="input_title" name="q_category">
                		<option value="0">카테고리를 선택하세요</option>
                		<option value="상품관련">상품관련</option>
                		<option value="주문관련">주문관련</option>
                		<option value="배송관련">배송관련</option>
                		<option value="마일리지관련">마일리지관련</option>
                		<option value="기타">기타</option>
                	</select>
                </td>
            </tr>
            <tr>
                <td>&ensp;Title
                </td>
                <td colspan="3">
                	<input type="text" class="input_title" name="q_title">
                </td>
            </tr>
            <tr>
            	<td>&ensp;Contents</td>
                <td colspan="3" class="paddingZone">
                	<textarea name="q_contents" id="q_contents" rows="20" cols="120"></textarea>
                </td>
            </tr>
            <tr><td colspan="4" class="under_gray_Border1">
            </td>
            </tr>
            <tr>
            	<td colspan="4" class="rev_score">
                	<input type="hidden" class="input_title" name="reply">
                	<div id="replyZone">
                	</div>
            	</td>
            </tr>
	        <tr>
	            <td colspan="4">
	                <div class="btn_area">
	                    <input type="button" id="submitBtn" value="등록" class="btn1_style" >
	                    <input type="button" value="닫기" class="btn2_style" onclick="exit()">
	                </div>
	            </td>
	        </tr>
        </table>
      </form>
       </div>
	</div>
</div>
<script type="text/javascript">


var oEditors = [];

//추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "q_contents",
	sSkinURI: "./resources/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["q_contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["q_contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["q_contents"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["q_contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("q_contents").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["q_contents"].setDefaultFont(sDefaultFont, nFontSize);
}


</script>
<ul class='uploadedList'>
</ul>
<script>

var uploadedList = $(".uploadedList");

function cb(obj){

	console.log("askWrite.jsp callback");
	console.log(obj);
	
	var target = $(obj);
	
	var srcStr = target.attr('src').split("/")[3];
	
	target.attr("id", srcStr);
	
	if(confirm("해당 이미지를 삭제하시겠습니까?")){
	
		$.post("/flower/deleteEditorFile", {fileName:srcStr}, function(result){
			
			console.log("삭제...");
			
			target.remove();
			
		});	
		
		
		return;
	}
	
}


$(document).ready(function(){
	
	$("#q_contents").on('input propertychange', function() {
		
		console.log()
	});
	

	$('#submitBtn').click(function(event){
		event.preventDefault();
		
		// 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["q_contents"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    var content = document.getElementById("q_contents").value;
	    
	    console.log("CONTENT: " + content);
	    
	    document.formm.submit();
	});
	
	
	
});


</script>