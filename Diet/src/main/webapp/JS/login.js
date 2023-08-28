function validateLogin() {
	if (document.getElementById('id').value == "" || document.getElementById('pw').value == "") {
		throw ('nameRequired');
	}
}

function loginSuccess(event) {
	try {
		validateLogin();

		document.getElementById('login_form').submit();

	} catch (e) {
		switch (e) {
			case 'nameRequired':
				alert('아이디 또는 비밀번호를 입력해 주세요.');
				break;
		}
		event.preventDefault();
	}


}

window.addEventListener('load', function() {
	document.getElementById('login_bt').addEventListener('click', loginSuccess);

});