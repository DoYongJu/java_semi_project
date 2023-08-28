function getValue(){
	var Q1 = document.getElementsByName('Q1');
	var Q2 = document.getElementsByName('Q2');
	var Q3 = document.getElementsByName('Q3');
	var Q4 = document.getElementsByName('Q4');
	var Q5 = document.getElementsByName('Q5');
	
	var trueOrFalse1;
	var trueOrFalse2;
	var trueOrFalse3;
	var trueOrFalse4;
	var trueOrFalse5;

	for(var i=0; i<Q1.length; i++) {
	    if(Q1[i].checked) {
	        trueOrFalse1 = Q1[i].value;
	        console.log(trueOrFalse1);
	    }
	}
	for(var i=0; i<Q2.length; i++) {
	    if(Q2[i].checked) {
	        trueOrFalse2 = Q2[i].value;
	        console.log(trueOrFalse2);
	    }
	}
	for(var i=0; i<Q3.length; i++) {
	    if(Q3[i].checked) {
	        trueOrFalse3 = Q3[i].value;
	        console.log(trueOrFalse3);
	    }
	}
	for(var i=0; i<Q4.length; i++) {
	    if(Q4[i].checked) {
	        trueOrFalse4 = Q4[i].value;
	        console.log(trueOrFalse4);
	    }
	}
	for(var i=0; i<Q5.length; i++) {
	    if(Q5[i].checked) {
	        trueOrFalse5 = Q5[i].value;
	        console.log(trueOrFalse5);
	    }
	}
	
	
	if(trueOrFalse5 == "false"){
		if(trueOrFalse3 == "false" && trueOrFalse4 == "true"){
		document.getElementById('result').value = '키토제닉식단';	
		}else{
			if(trueOrFalse4 == "false"){
			document.getElementById('result').value = '저지방고단백식단';	
			}
		}
		if(trueOrFalse1 == "true"){		
		if(trueOrFalse2 == "true"){
			document.getElementById('result').value = '디톡스식단';
		}else{
			document.getElementById('result').value = '원푸드식단';
		}
		}
	}else{
		document.getElementById('result').value = '간헐적단식식단';	
	}
	
	document.getElementById('submit').submit();  
}


window.addEventListener('load', function() {
	document.getElementById('submit_button').addEventListener('click', getValue);
	
});