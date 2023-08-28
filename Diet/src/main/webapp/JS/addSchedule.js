function validateAdd() {
	if (document.getElementById('goal').value == "") {
		throw ('nameRequired');
	}
	
	if (document.getElementById('duaDate').value == "") {
		throw ('dateRequired');
	}
}

function addSchedule(event) {
	try {
		validateAdd();
		document.getElementById('add_form').submit();

	} catch (e) {
		switch (e) {
			case 'nameRequired':
				alert('목표를 입력해 주세요.');
				break;
			case 'dateRequired':
				alert('마감일을 설정해 주세요.');
				break;
		}
		event.preventDefault();
	}


}

window.addEventListener('load', function() {
	const button = document.querySelector('#addButton');
    const rabbit = document.querySelector('#addForm');
    button.addEventListener('click', () => {
      rabbit.scrollIntoView({behavior: 'smooth', block: 'center'});
    })

	document.getElementById('add_bt').addEventListener('click', addSchedule);

});