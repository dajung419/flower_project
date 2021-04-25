// 폼에 입력이 올바른지 판단한다.
// productWrite.jsp에서 사용한다.
function go_save() {
	var theForm = document.frm;

	if (theForm.major.value == '') {
		alert('대분류를 선택하세요.');
		theForm.major.focus();
	} else if (theForm.medium.value == '') {
		alert('중분류를 입력하세요.');
		theForm.medium.focus();
	} else if (theForm.pName.value == '') {
		alert('상품명을 입력하세요.');
		theForm.pName.focus();
	} else if (theForm.price.value == '') {
		alert('가격을 입력하세요.');
		theForm.price.focus();
	} else if (theForm.stock.value == '') {
		alert('재고를 입력하세요.');
		theForm.stock.focus();
	} else if (theForm.content.value == '') {
		alert('상품내용을 입력하세요.');
		theForm.content.focus();
	} else if (theForm.pic.value == '') {
		alert('상품이미지들 입력하세요.');
		theForm.pic.focus();
	} else {

		if (theForm.bestyn.checked == true) {
			theForm.bestyn.value = "y";
		} else {
			theForm.bestyn.value = "n";
		}

		if (theForm.useyn.checked == true) {
			theForm.useyn.value = "y";
		} else {
			theForm.useyn.value = "n";
		}
		var major = theForm.major.value;

		theForm.encoding = "multipart/form-data";

		// theForm.price1.value = removeComma(theForm.price1);
		// theForm.price2.value = removeComma(theForm.price2);
		// theForm.price3.value = removeComma(theForm.price3);

		// productWrite.jsp 폼 페이지에서 입력받은 값을
		// 디비에 추가하기 위한 페이지인 product_save.jsp로 이동하되
		// 입력받은 상품 코드를 쿼리 스트링 형태로 전달한다.
		// 상품 코드로 폴더를 만들어 거기에 이미지 파일을 업로드한다.
		theForm.action = "admin_product_write?major=" + major;
		theForm.submit();
	}
}

// productWrite.jsp에서 사용한다. 상품 리스트로 이동한다.
function go_mov() {
	var theForm = document.frm;
	theForm.action = "admin_product_list";
	theForm.submit();
}
// projectList.jsp
function go_search() {
	var theForm = document.frm;
	var key = theForm.key.value;
	theForm.action = "admin_product_list?key=" + key;
	theForm.submit();
}

function go_total() {
	var theForm = document.frm;
	theForm.key.value = "";
	theForm.action = "admin_product_list";
	theForm.submit();
}

function go_detail(pNum) {
	var theForm = document.frm;
	theForm.action = "admin_product_detail?pNum=" + pNum;

	theForm.submit();
}

function go_wrt() {
	var theForm = document.frm;
	theForm.action = "admin_product_write_form";
	theForm.submit();
}
// **************** productDetail.jsp
function go_list() {
	var theForm = document.frm;
	theForm.action = "admin_product_list";
	theForm.submit();
}
// **************** productDetail.jsp
function go_mod(pNum) {
	var theForm = document.frm;
	theForm.action = "admin_product_update_form?pNum=" + pNum;
	theForm.submit();
}

function go_mod_save(pNum) {
	var theForm = document.frm;
	if (theForm.major.value == '') {
		alert('대분류를 선택하세요');
		theForm.major.focus();
	} else if (theForm.medium.value == '') {
		alert('중분류를 선택하세요');
		theForm.medium.focus();
	} else if (theForm.pName.value == '') {
		alert('상품명을 입력하세요');
		theForm.pName.focus();
	} else if (theForm.price.value == '') {
		alert('가격을 입력하세요');
		theForm.price.focus();
	} else if (theForm.stock.value == '') {
		alert('재고를 입력하세요');
		theForm.stock.focus();
	} else if (theForm.content.value == '') {
		alert('상품상세를 입력하세요');
		theForm.content.focus();

	} else {
		if (confirm('수정하시겠습니까?')) {
			if (theForm.bestyn.checked == true) {
				theForm.bestyn.value = "y";
			} else {
				theForm.bestyn.value = "n";
			}
			if (theForm.useyn.checked == true) {
				theForm.useyn.value = "y";
			} else {
				theForm.useyn.value = "n";
			}
			var major = theForm.major.value;
			
			theForm.encoding = "multipart/form-data";
			// theForm.seq.value=seq;

			// [2] products 테이블의 상품 정보를 수정하는 처리를 하는 product_modsave.jsp 페이지로
			// 이동하되 상품 코드를 전달해준다. 상품코드로 폴더를 생성해서 그곳에 이미지 파일을 업로드하기 때문이다.
			theForm.action = "admin_product_update?major=" + major;
			theForm.submit();
		}
	}
}

function go_mod_mov(pNum) {
	var theForm = document.frm;
	theForm.action = 'admin_product_detail?pNum='+ pNum;
	theForm.submit();
}

function go_del(pNum) {
	if (confirm('삭제하시겠습니까?')) {
		var theForm = document.frm;
		theForm.action = "admin_product_delete?pNum="
				+ pNum;
		theForm.submit();
	}
}


