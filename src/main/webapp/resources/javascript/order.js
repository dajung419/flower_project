    
/* cart 부분 */

function deleteOne() {
	if(confirm("삭제하시겠습니까?")){
		var count = 0;
		// 체크박스 갯수가 1개일때 length를 구할 수 없는 문제
		// 전체선택 체크박스까지 length를 구한 다음 첫번째 check박스는 checked = false
		document.formm.orderNum[0].checked = false;
		for ( var i = 1; i < document.formm.orderNum.length; i++) {
			if (document.formm.orderNum[i].checked == true) {
				count++;
			}
		}
		if (count == 0) {
			alert("삭제할 항목을 선택해 주세요.");
			return false;
		} else {
			document.formm.action = "cart_delete";
			document.formm.submit();
		}
	}
	else{
		return false;
	}
}
function deleteAll() {
	
	if(confirm("전체 삭제하시겠습니까?")){
		for ( var i = 1; i < document.formm.orderNum.length; i++) {
			// 전체 checked = true
			document.formm.orderNum[i].checked = true;
		}
		document.formm.orderNum[0].checked = false;
		document.formm.action = "cart_delete";
		document.formm.submit();
	}
	else{
		return false;
	}
}

function selectOrder(){
	if(confirm("선택항목 주문하시겠습니까?")){
		var count = 0;
		// 체크박스 갯수가 1개일때 length를 구할 수 없는 문제
		// 전체선택 체크박스까지 length를 구한 다음 첫번째 check박스는 checked = false
		document.formm.orderNum[0].checked = false;
		for ( var i = 1; i < document.formm.orderNum.length; i++) {
			if (document.formm.orderNum[i].checked == true) {
				count++;
			}
		}
		if (count == 0) {
			alert("주문할 항목을 선택해 주세요.");
			return false;
		} else {
			alert("주문 완료!");
			document.formm.action = "order";
			document.formm.submit();
		}
	}
	else{
		return false;
	}
}

function allOrder(){
	if(confirm("전체 주문하시겠습니까?")){
		var aUrl = "";
		for ( var i = 1; i < document.formm.orderNum.length; i++) {
			if(i=1){
				aUrl += "orderNum=" + document.formm.orderNum[i].value;
			}
			aUrl += "&orderNum=" + document.formm.orderNum[i].value;
		}
		alert("주문 완료!");
		//alert(aUrl);
		document.formm.orderNum[0].checked = false;
		document.formm.action = "order?" + aUrl;
		document.formm.submit();
	}else{
		return false;
	}
}

function go_update() {
	//window.open()
	  if (false) {
	    alert("비밀번호가 틀렸습니다.");
	    document.formm.quantity.focus();
	  } else {
	    document.formm.action = "review_update_form";
	    document.formm.submit();
	  }
	}
function go_delete() {
	//window.open()
	if (false) {
		alert("비밀번호가 틀렸습니다.");
		document.formm.quantity.focus();
	} else {
		document.formm.action = "review_delete";
		document.formm.submit();
	}
}

