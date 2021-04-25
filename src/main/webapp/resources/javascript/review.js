          
function go_update(move) {
	
	var loginId=document.formm.id.value;
	if(loginId==document.formm.writer.value){
		
		window.open('review_pass_check_form?rev_num='
				+document.formm.rev_num.value +'&move='+move,'mcheck',"width=500, height=230");
	} else {
		alert("권한이 없습니다.");
	}
}
function rpassCheck(){
	if (document.frmm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}
// 리스트로 이동
function go_list() {
	document.formm.action = "review_list";
	document.formm.submit();
}
// 이전 리뷰로 이동
function go_prev(num) {
	var prev = -1;
	document.formm.action = "review_detail?rev_num=" + num + "&go=" + prev;
	document.formm.submit();
}
// 다음 리뷰로 이동
function go_next(num) {
	var next = 1;
	document.formm.action = "review_detail?rev_num=" + num + "&go=" + next;
	document.formm.submit();
}

