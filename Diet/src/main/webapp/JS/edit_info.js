function editform_check(){
	var p1 = document.getElementById('password').value;
   	var p2 = document.getElementById('password_re').value;
   	if(p1 == null || p1 == " " || p1 == "" ||
  		p2 == null || p2.value == " " || p2 == ""){
		alert("모든 창을 입력하세요");
    	return false;
	}
	if(p1 != p2){
		alert("비밀번호가 서로 다릅니다. 다시 확인하여 주세요.");
    	return false;
	}	
  	
  	if(p1 != null && p1 != " " && p1 != ""){
		document.getElementById('submit').submit();  
	  }
}


window.addEventListener('load', function() {
	document.getElementById('edit_pwd_bt').addEventListener('click', editform_check);
});