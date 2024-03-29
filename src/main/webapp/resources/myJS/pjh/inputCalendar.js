$(document).off('submit','#inputCalendarForm');
$(document).on('submit','#inputCalendarForm',function(event){
	event.preventDefault();
	let method = this.method;
	let url = `${this.action}`
	let formData = new FormData(this);
	let data = {}
	for(let key of formData.keys()){
		data[key] = formData.get(key)
	}
	let location = `${cPath}/user/calendar`;

	submitAjax(url,method,data,location);
	
	let type = formData.get('scheduleType');
	sendCalendarAlram(type);
	console.log("지나감")
})

$(document).off('submit','#insertCalendarForm');  
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
	let type = formData.get('scheduleType');
	sendCalendarAlram(type);
	console.log("지나감")
	
	submitAjax(url,method,data);

	setTimeout(() => eventRefetch(), 200);
})

$(document).off('submit','#updateCalendarForm');  
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
	submitAjax(url,method,data);
	
	let type = formData.get('scheduleType');
	sendCalendarAlram(type);
	console.log("지나감")
	setTimeout(() => eventRefetch(), 200);
})


$(document).off('click','.modify-modal-button');  
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

$(document).off('click','.detail-delete-button');  
$(document).on('click','.detail-delete-button',function(){
	let scheduleId = $('#checkCalendarModal input[name=scheduleId]').val();
	let uri = $(this).data('detailDeleteLocation')
	let url = `${cPath}${uri}/${scheduleId}`
	submitAjax(url,'post');
	
	setTimeout(() => eventRefetch(), 200);
})


$(document).off('click','.cancleToback');  
$(document).on('click','.cancleToback', function(){
	let location = $(this).data("backLocation");
	innerBodyAjax(location);
})

$(document).off('hidden.bs.modal','#checkCalendarModal');  
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

function sendCalendarAlram(type){
	if(type == "D1" || type == "D2" || type == "C"){
		receiver = "";
		if(type=="D1" || type=="D2"){
			target = $(`.form-check-input[value="${type}"]`);
			targetName = target.next()[0].textContent; 
			receiver = type;
			type = "D"
			message = `${targetName} 일정이 변경되었습니다.`
		} else {
			receiver = cmpId;
			message = `전사 일정이 변경되었습니다.`
		}
		receivers = [];
		receivers.push(receiver)
		sendAlram(message,receivers,type,'/WareBridge/user/calendar');
	}
}