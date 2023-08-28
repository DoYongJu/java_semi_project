function calculate() {
	let n1 = document.getElementById('n1').value;
	let n2 = document.getElementById('n2').value;
	let n3 = document.getElementById('n3').value;

	let a = n2;
	let b = n3;
	let result2 = a * a;
	let result3 = b / result2;

	let result4 = Math.round(result3 * 100000) / 10.0;

	if (result4 <= 18.5) {
		document.getElementById('result').innerText = ("당신의 비만도(BMI) 지수는 " + result4 + "로 [저체중] 입니다.");

	} else if (result4 <= 25.0) {
		document.getElementById('result').innerText = ("당신의 비만도(BMI) 지수는 " + result4 + "로 [정상] 입니다.");

	} else if (result4 <= 30.0) {
		document.getElementById('result').innerText = ("당신의 비만도(BMI) 지수는 " + result4 + "로 [과체중] 입니다.");

	} else {
		document.getElementById('result').innerText = ("당신의 비만도(BMI) 지수는 " + result4 + "로 [비만] 입니다.");
	}
}


function check() {
	var n1 = document.getElementById('n1').value;
	var n2 = document.getElementById('n2').value;
	var n3 = document.getElementById('n3').value;
	if (n1 == null || n1 == " " || n1 == "" || n2 == null || n2 == " "
		|| n2 == "" || n3 == null || n3 == " " || n3 == "") {
		alert("모든 창을 입력하세요");
		return false;
	}

	if (n1 != null && n1 != " " && n1 != "" && n2 != null && n2 != " "
		&& n2 != "" && n3 != null && n3 != " " && n3 != "") {
		
		calculate();
		document.getElementById('result').scrollIntoView();
	}
}


window.addEventListener('load', function() {
	document.getElementById('button').addEventListener('click', check);
});