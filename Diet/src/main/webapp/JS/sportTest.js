function doSportTest() {
	let answer1;
	let answer2;
	let answer3;

	const Question1List = document.getElementsByName('Question1');
	Question1List.forEach((it) => {
		if (it.checked) {
			answer1 = it.value;
		}
	})

	const Question2List = document.getElementsByName('Question2');
	Question2List.forEach((it) => {
		if (it.checked) {
			answer2 = it.value;
		}
	})

	const Question3List = document.getElementsByName('Question3');
	Question3List.forEach((it) => {
		if (it.checked) {
			answer3 = it.value;
		}
	})

	if (answer1=='no' && answer2=='yes' && answer3=='no') {
		document.getElementById('result').value = '실내 같이 저강도';
	}

	if (answer1=='no' && answer2=='yes' && answer3=='yes') {
		document.getElementById('result').value = '실내 같이 고강도';
	}

	if (answer1=='no' && answer2=='no' && answer3=='no') {
		document.getElementById('result').value = '실내 혼자 저강도';
	}

	if (answer1=='no' && answer2=='no' && answer3=='yes') {
		document.getElementById('result').value = '실내 혼자 고강도';
	}

	if (answer1=='yes' && answer2=='yes' && answer3=='no') {
		document.getElementById('result').value = '야외 같이 저강도';
	}

	if (answer1=='yes' && answer2=='yes' && answer3=='yes') {
		document.getElementById('result').value = '야외 같이 고강도';
	}

	if (answer1=='yes' && answer2=='no' && answer3=='no') {
		document.getElementById('result').value = '야외 혼자 저강도';
	}

	if (answer1=='yes' && answer2=='no' && answer3=='yes') {
		document.getElementById('result').value = '야외 혼자 고강도';
	}

	document.getElementById('sportTest_form').submit();
}


window.addEventListener('load', function() {
	document.getElementById('submit_bt').addEventListener('click', doSportTest);

});

