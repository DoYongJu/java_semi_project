function update(event){
	try{
		var Id = document.getElementById("uId");
		Id.disabled = false;
		$('#hiddenInput').val(event.target.dataset.id);
		$('#insertGoal')[0].submit();
	}catch(e){
		
		alert('catch로 빠짐.');
		
		}
	}
	
function del(event){
	try{
		var dId = document.getElementById("deleteId");
		dId.disabled = false;
		$('#hiddenOutput').val(event.target.dataset.id);
		$('#deleteId')[0].submit();
	}catch(e){
		
		alert('delete_catch로 빠짐.');
		
		}
	}

$(function(){
	$('.goal').click(update);
	$('.dGoal').click(del);

});