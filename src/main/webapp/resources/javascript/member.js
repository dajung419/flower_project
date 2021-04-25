/*		정규식		*/	
	// 공백 확인 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[A-Za-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{6,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
//	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
//	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
function go_save() {
	var idV = document.formm.id.value;	
  if (idV == "") {
    alert("아이디를 입력하여 주세요.");
    document.formm.id.style.border="2px solid red";
  } else if (!(idJ.test(idV))) {
	  alert("아이디 형식이 맞지 않습니다.");
	  document.formm.id.focus();
	  document.formm.id.style.border="2px solid red";
  } else if (idV != document.formm.reid.value) {
    alert("중복확인을 클릭하여 주세요.");
    document.formm.id.focus();
    document.formm.id.style.border="2px solid red";
  } else if (document.formm.pass.value == "") {
    alert("비밀번호를 입력해 주세요.");
    document.formm.pass.focus();
    document.formm.pass.style.border="2px solid red";
  } else if (!(pwJ.test(document.formm.pass.value))) {
	  alert("비밀번호 형식이 맞지 않습니다.");
	  document.formm.pass.focus();
	  document.formm.pass.style.border="2px solid red";
  } else if ((document.formm.pass.value != document.formm.pwdCheck.value)) {
    alert("비밀번호가 일치하지 않습니다.");
    document.formm.pwdCheck.focus();
    document.formm.pwdCheck.style.border="2px solid red";
  } else if (document.formm.name.value == "") {
    alert("이름을 입력해 주세요.");
    document.formm.name.focus();
    document.formm.name.style.border="2px solid red";
  } else if (!(nameJ.test(document.formm.name.value))) {
	  alert("이름을 정확히 입력해 주세요.");
	  document.formm.name.focus();
	  document.formm.name.style.border="2px solid red";
  } else if (document.formm.birth.value == "") {
	  alert("생년월일을 입력해 주세요.");
	  document.formm.birth.focus();
	  document.formm.birth.style.border="2px solid red";
  } else if (document.formm.phone_2.value == "") {
	  alert("연락처를 입력해 주세요.");
	  document.formm.phone_2.focus();
	  document.formm.phone_2.style.border="2px solid red";
  } else if (document.formm.phone_3.value == "") {
	  alert("연락처를 입력해 주세요.");
	  document.formm.phone_3.focus();
	  document.formm.phone_3.style.border="2px solid red";
  } else if (document.formm.address_1.value == "") {
	  alert("세부주소를 입력해 주세요.");
	  document.formm.address_1.focus();
	  document.formm.address_1.style.border="2px solid red";
  } else {
    document.formm.action = "join";
    document.formm.submit();
  }
}

function idcheck() {
	var idV = document.formm.id.value;	
	if (idV == "") {
	    alert("아이디를 입력하여 주세요.");
	    document.formm.id.focus();
	    return false;
	} else if (!(idJ.test(idV))) {
		alert("아이디 형식이 맞지 않습니다.");
		document.formm.id.focus();
		return false;
	}
	return true;
}

function idcheck_form() {
	if(idcheck()){
		var url = "id_check_form?id=" 
			+ document.formm.id.value;
		window.open( url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=230");
	} else {
		return false;
	}
}

function go_next() {
  if (document.formm.okon1[0].checked == true) {
    document.formm.action = "join_form";
    document.formm.submit();
  } else if (document.formm.okon1[1].checked == true) {
    alert('약관에 동의하셔야만 합니다.');
  }
}


function open_win(url,name){
window.open(url,name, "width=500, height=230");
}

function passCheck(){
	if (document.frmm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	} 
	return true;
}

function mypageCheck() {
  if (document.formm.pass.value == "") {
	  alert("비밀번호를 입력해 주세요.");
	  document.formm.pass.focus();
	  return false;
  } else if ((document.formm.pass.value != document.formm.pass_re.value)) {
	  alert("비밀번호가 일치하지 않습니다.");
	  document.formm.pass.focus();
	  return false;
  } else if (document.formm.phone_2.value == "") {
	  alert("연락처를 입력해 주세요.");
	  document.formm.phone_2.focus();
	  return false;
  } else if (document.formm.phone_3.value == "") {
	  alert("연락처를 입력해 주세요.");
	  document.formm.phone_3.focus();
	  return false;
  } else if (document.formm.address_1.value == "") {
	  alert("세부주소를 입력해 주세요.");
	  document.formm.address_1.focus();
	  return false;
  }else {
	  return true;
  }
  
}

function passdCheck(){
  if (document.formm.pass.value == "") {
	  document.getElementById("msg").innerHTML="비밀번호를 입력하세요.";
	  document.formm.pass.focus();
	  return false;
  } else if ((document.formm.pass.value != document.formm.pwdCheck.value)) {
	  document.getElementById("msg").innerHTML="비밀번호가 일치하지 않습니다.";
	  document.formm.pass.focus();
	  return false;
  }else{
	  document.formm.submit();
  }
}

function open_win1(url,name){
	window.open(url,name, "width=800, height=1000");
}

function open_win2(url,name){
	window.open(url,name, "width=580, height=680");
}

function open_win3(url, name){
	  window.open( url,name,
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1100, height=950, top=20, left=50, ");
}