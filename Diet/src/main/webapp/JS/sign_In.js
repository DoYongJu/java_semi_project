function checkPassword() {
      var p1 = document.getElementById('pwd').value;
      var p2 = document.getElementById('password_re').value;
/*      	//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
 		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
 		if (!pwdCheck.test(p1.value)) {
    	alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    	return false;
  		}  */
          if( p1 != p2 ) {
            alert("비밀번호 불일치");
            return false;
          } else{
            alert("비밀번호가 일치합니다");
            return true;
          }

    }
function joinform_check(){
	var uname = document.getElementById('user_name').value;
	var pwd = document.getElementById('pwd').value;
	var email = document.getElementById('email_info').value;
	var p1 = document.getElementById('pwd').value;
   	var p2 = document.getElementById('password_re').value;
   	var radioList = document.getElementsByName('radio');
   	var type =""; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
	for(var i=0; i<radioList.length; i++) {
	    if(radioList[i].checked) {
	        type = radioList[i].value;
	        
	        if(uname == null || uname == " " || uname == "" ||
  				pwd == null || pwd.value == " " || pwd == "" ||
  				email == null || email == " " || email == "" ){
				alert("모든 창을 입력하세요");
    			return false;
			}
			if(p1 != p2){
				alert("비밀번호 확인을 하세요.");
    			return false;
			}	
  	
  			if(uname != null && uname != " " && uname != "" &&
	  		pwd != null && pwd != " " && pwd != "" && p1 ==p2 &&
	  		email != null && email != " " && email != "" && type != null){
			document.getElementById('userName').value = uname;
			document.getElementById('password').value = p1;
			document.getElementById('email').value = email;
			document.getElementById('type').value = type;
			
			document.getElementById('submit').submit();  
				 }
		    }console.log(type);
		}
		console.log(type);

	
  	
}


    
window.addEventListener('load', function() {
	document.getElementById('checkPassword_Button').addEventListener('click', checkPassword);
	document.getElementById('checkValid_button').addEventListener('click', joinform_check);
});
