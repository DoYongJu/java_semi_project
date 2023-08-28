function validateSearch() {
	if (document.getElementById('Type').value == "" || document.getElementById('Content').value == "") {
		throw ('nameRequired');
	}
}

function search(event){
	try{
		
	validateSearch();
	
	var Type = document.getElementById('Type').value;
	var Content = document.getElementById('Content').value;
	document.getElementById('hiddenInput1').value = Type;
	document.getElementById('hiddenInput2').value = Content;
	
	
	document.getElementById('selectList').submit();  
	} catch (e) {
		switch (e) {
			case 'nameRequired':
				alert('검색 유형 및 검색 내용을 입력해 주세요.');
				break;
		}
		event.preventDefault();
	}
}

window.addEventListener('load', function() {
	document.getElementById('button-addon80').addEventListener('click', search);
});