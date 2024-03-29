
$(document).off('click','.check-delete-button');  
$(document).on('click','.check-delete-button',function(event){
	let uri = $(this).data('clickLocation')
	let url = `${cPath}${uri}`
	let location = window.location.href;
	let checkboxs = $('input[type=checkbox][data-checked-number]:checked')
	let nums = []
	for(box of checkboxs){
		let num = $(box).data('checkedNumber');
		nums.push(num);		
	}
	let data = {
		number : nums
	}
	crudAjax('post',url,data,location);
})



$(document).off('click','.my-delete-button');  
$(document).on('click','.my-delete-button',function(event){
	event.preventDefault();
	let number = $(this).data('targetNumber')
	let uri = $(this).data('targetLocation')
	let url = `${cPath}${uri}`
	let nums = []
	nums.push(number);
	let data = {
		number : nums
	}
	let location = `${cPath}/admin/inquiry`;
	crudAjax('post',url,data,location);
})

$(document).off('click','.my-update-button');  
$(document).on('click','.my-update-button',function(event){
	event.preventDefault();
	let number = $(this).data('targetNumber')
	let uri = $(this).data('targetLocation')
	let url = `${cPath}${uri}/${number}`	
	innerBodyAjax(url);
})


$(document).off('click','.my-summit');  
$(document).on('click','.my-summit',function(event){
	event.preventDefault();
	let data = {};
	let myForm = $('#insertForm')[0];
	let url = myForm.action;
	let formData = new FormData(myForm);
	for(let key of formData.keys()){
		data[key] = formData.get(key)
	}
	let nowUrl = window.location.href;
	let location = "";
	if(nowUrl.indexOf('update') != -1){
		location = nowUrl.replace("update","detail");
	} else {
		location = nowUrl.replace('/form',"")
	}
	crudAjax('post',url,data,location);
})


$(document).off('click','.my-cancle');  
$(document).on('click','.my-cancle',function(){
	let backLocation = $(this).data("backLocation");
	let location = `${cPath}${backLocation}`
	innerBodyAjax(location);
})




$(document).off('click','a[data-detail-number]');  
$(document).on('click','a[data-detail-number]',function(event){
	event.preventDefault();
	let number = $(this).data('detailNumber')
	let url = `${this.href}/${number}`;
	innerBodyAjax(url);
})

$(document).off('click','.check-on-off');  
$(document).on('click','.check-on-off',function(event){
	let other = $(this).siblings('.check-on-off')[0]
	other.checked = false;
})