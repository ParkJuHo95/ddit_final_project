$(document).on('submit','#inputCalendarForm',function(event){
	event.preventDefault();
	let method = this.method;
	let url = window.location.href;
	let formData = new FormData(this);
	let data = {}
	for(let key of formData.keys()){
		data[key] = formData.get(key)
	}
	let location = `${cPath}/user/calendar`;
/*	let term = data['repetitionTerm'];
	let endDate = data['repetitionEndDate'];*/
	
	submitAjax(url,method,data,location);
})


$(document).on('submit','#insertCalendarForm',function(event){
	event.preventDefault();
	let data = {};
	let method = this.method;
	let uri = $(this).data('formLocation');
	let url = `${cPath}${uri}`
	let formData = new FormData(this);
	for(let key of formData.keys()){
		if(key == "scheduleStartTime"){
			data['scheduleStartDat'] = formData.get('date')+"T"+formData.get(key);
		} else if(key == "scheduleEndTime") {
			data['scheduleEndDat'] = formData.get('date')+"T"+formData.get(key);
		} else {
			data[key] = formData.get(key);
		}
	};
	console.log(data)
	console.log(method)
	console.log(uri)
	console.log(url)
	submitAjax(url,method,data);
	setTimeout(() => eventRefetch(), 200);
})

$(document).on('submit','#updateCalendarForm',function(event){
	event.preventDefault();
	let data = {};
	let method = this.method;
	let uri = $(this).data('formLocation');
	let url = `${cPath}${uri}`
	let formData = new FormData(this);
	for(let key of formData.keys()){
		data[key] = formData.get(key);
	};
	console.log(data);
	submitAjax(url,method,data);
	setTimeout(() => eventRefetch(), 200);
})


$(document).on('click','.modify-modal-button',function(){
	if($('#updateCalendarForm input[name=scheduleName]')[0].attributes.disabled === undefined ){
		document.querySelector('#updateCalendarForm').requestSubmit();
	} else {
		let inputs = $('#checkCalendarModal input')
		for(input of inputs){
			$(input).removeAttr("disabled");
		}
		$('#checkCalendarModal textarea[name=scheduleContents]').removeAttr("disabled");
		setTimeout(function(){
			$('.detail-delete-button').css("display","none");
			$('#checkCalendarModalButton')[0].click();
		}, 500);
	}
})

$(document).on('click','.detail-delete-button',function(){
	let scheduleId = $('#checkCalendarModal input[name=scheduleId]').val();
	let uri = $(this).data('detailDeleteLocation')
	let url = `${cPath}${uri}/${scheduleId}`
	submitAjax(url,'post');
	setTimeout(() => eventRefetch(), 200);
})


$(document).on('click','.cancleToback', function(){
	let location = $(this).data("backLocation");
	innerBodyAjax(location);
})

$(document).on('hidden.bs.modal','#checkCalendarModal', function () {
	$('#checkCalendarModal .modify-modal-button').removeAttr('disabled');
	$('#checkCalendarModal .detail-delete-button').removeAttr('disabled');
})


function eventRefetch(){
	let resources = calendar.getEventSources()
	for(resource of resources){
		resource.refetch()
	}
}