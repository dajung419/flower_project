
function go_cart() {
  if (document.formm.orderQ.value == "") {
    alert("수량을 입력하여 주세요.");
    document.formm.orderQ.focus();
  } else {
    document.formm.action = "cart_insert";
    document.formm.submit();
  }
}

function go_order_insert() {
	if (document.formm.orderQ.value == "") {
	    alert("수량을 입력하여 주세요.");
	    document.formm.orderQ.focus();
	  } else {
  	    document.formm.action = "order_insert";
	    document.formm.submit();
	  }
}

function go_login() {
	if(confirm("로그인 하시겠습니까?")){
		document.formm.action = "login_form";
		document.formm.submit();
	} else {
		alert("회원만 구매할 수 있습니다.");
	}
}

function go_order() {
  document.formm.action = "mypage";
  document.formm.submit();
}