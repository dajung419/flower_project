<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<style>
.under_gray_Border1{
    border-bottom: 1px solid rgb(168, 168, 168);
    height: 7px;
    padding: 0px;
}
</style>
  <meta charset="UTF-8">
  <title>Fl#our</title>
  <link href="./css/style3.css" rel="stylesheet">  
  <link href="./css/review.css" rel="stylesheet">  
  <script type="text/javascript" src="./javascript/review.js"></script>      
  <script type="text/javascript" src="./javascript/js/jquery.min.js"></script>  
  <script type="text/javascript" src="./resources/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>  
<div class="container">
<%@ include file="../header.jsp" %>      
  <div class="contentbody product_D">
    <div class="body1 product_D">
    <div id="itemdetail" >
      <form  method="post" name="formm" action="review_update">  
        <input type="hidden" name="rev_num" value="${reviewVO.rev_num}">
        <input type="hidden" name="rev_update" value="${reviewVO.rev_update}">
        <input type="hidden" name="rev_score" id="score" value="${reviewVO.rev_score}">
        <table id="review_table">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 75%;">
                <col style="width: 10%;">
            </colgroup>
            <tr>
                <td colspan="3" class="rev_title">&ensp;제 목&emsp;
                	<input type="text" class="input_title" name="rev_title" value="${reviewVO.rev_title}">
                </td>
            </tr>
            <tr>
                <td class="rev_name">&ensp;${reviewVO.id}</td>
                <td class="rev_name">${reviewVO.rev_date}</td>
                <td class="rev_name">${reviewVO.rev_click}</td>
            </tr>
            <tr><td colspan="3"  class="under_gray_Border1">
            </td></tr>
            <tr>
                <td rowspan="2" class="paddingZone"><img class="p_pic" src="./images/${pVo.pic}"/></td>
                <td colspan="2">${pVo.pName}</td>
            </tr>
            <tr>
                <td colspan="2">판매금액 : ${pVo.price}</td>
            </tr>
            <tr><td colspan="3"  class="under_gray_Border1">
            </td></tr>
            <tr>
                <td colspan="3" class="paddingZone">&ensp;
                	<textarea name="rev_contents" id="rev_contents" rows="20" cols="150">${reviewVO.rev_contents}</textarea>
                </td>
            </tr>
            <tr><td colspan="3" class="under_gray_Border1">
            </td></tr>
            <tr>
            	<td colspan="3" class="rev_score">&emsp;별점 :
            		 &ensp; 
                <c:forEach var="star" begin="1" end="5" varStatus="status">
                	<c:if test="${reviewVO.rev_score - status.count >= 0}">
                		<a href="javascript:void(0);" onclick="starChange(this);" class="starI">★</a>
                	</c:if>
                	<c:if test="${reviewVO.rev_score - status.count < 0}">
                		<a href="javascript:void(0);" onclick="starChange(this);" class="starI">☆</a>
                	</c:if>
                </c:forEach>
            	</td>
            </tr>
            <tr><td colspan="3" class="under_gray_Border1">
            </td></tr>
	            <tr>
	                <td colspan="3">
	                    <div class="btn_area">
	                        <input type="button" id="submitBtn" value="수정" class="btn1_style">
	                        <input type="button" value="목록으로" class="btn2_style" onclick="go_list()">
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
	elPlaceHolder: "rev_contents",
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
		//oEditors.getById["rev_contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["rev_contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["rev_contents"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["rev_contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("rev_contents").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["rev_contents"].setDefaultFont(sDefaultFont, nFontSize);
}


//별표, score 바꾸기
function starChange(star){
	 if($(star).text() == "★"){
		 $(star).text("☆");
		 var changeScore = $("#score").val();
		 changeScore--;
		 $("#score").val(changeScore);
	 } else {
		 $(star).text("★");
		 var changeScore = $("#score").val();
		 changeScore++;
		 $("#score").val(changeScore);
	 }
}


</script>
<ul class='uploadedList'>
</ul>
<script>

var uploadedList = $(".uploadedList");

function cb(obj){

	console.log("reviewUpdate.jsp callback");
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
	
	$("#rev_contents").on('input propertychange', function() {
		
		console.log()
	});
	

	$('#submitBtn').click(function(event){
		event.preventDefault();
		
		// 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["rev_contents"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    var content = document.getElementById("rev_contents").value;
	    
	    console.log("CONTENT: " + content);
	    
	    document.formm.submit();
	});
	
	
	
});


</script>
<%@ include file="../footer.jsp" %>    