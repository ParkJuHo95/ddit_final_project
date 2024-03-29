var calendarEl = document.getElementById('calendar');

var calendar = new FullCalendar.Calendar(calendarEl, {
	slotMinTime: '09:00',
	slotMaxTime: '19:00',
	expandRows: true,
	height: '100%',
	
	headerToolbar: {
		left: 'listWeek,timeGridDay,timeGridWeek,dayGridMonth',
		center: 'title',
		right: 'today prev,next'
	},
	initialView: 'dayGridMonth',
	dateClick: function(info) {
		
		$('input[name=scheduleName]').val("");
		$('input[name=scheduleStartTime]').val("");
		$('input[name=scheduleEndTime]').val("");
		$('textarea[name=scheduleContents]').val("");
		
		let checkData = info.dateStr;
		let gridMonthCheck = checkData.split("T");
		
		if(gridMonthCheck.length > 1){
			let day = gridMonthCheck[0];
			let time = gridMonthCheck[1].split("+")[0];

			let originalDate = new Date(checkData);
			let newDate = new Date(originalDate.getTime() - (originalDate.getTimezoneOffset() * 60000) + (30 * 60000));
			let newDateString = newDate.toISOString();
			
			let timePlus = newDateString.split("T")[1].split(".")[0];

			$('input[name=date]').val(day);
			$('input[name=scheduleStartTime]').val(time);
			$('input[name=scheduleEndTime]').val(timePlus);
			
		} else { 
			
			$('input[name=date]').val(checkData);
			
		}
		
		$('#insertCalendarFormButton')[0].click();
  	},
	eventClick: function(info) {
		
		let data = {
			scheduleId : info.event.id
		}
		$.ajax({
			type : 'get',
			url : `${cPath}/user/calendar/detail`,
			//dataType : 'application/json',
			contentType : 'application/json' ,
			data : data,
			success : function(resp) {
				
				if(resp.scheduleType == "C" && !empRole.includes("ROLE_ADMIN") || resp.empNo != empNo) {
					$('#checkCalendarModal .modify-modal-button').attr('disabled','disabled');
					$('#checkCalendarModal .detail-delete-button').attr('disabled','disabled');
				}
				
				
				$('.detail-delete-button').css("display","block");
				$('#checkCalendarModal input[name=scheduleId]').val(info.event.id);
				$('#checkCalendarModal input[name=scheduleName]').val(resp.scheduleName);
				$('#checkCalendarModal input[name=scheduleStartDat]').val(resp.scheduleStartDat);
				$('#checkCalendarModal input[name=scheduleEndDat]').val(resp.scheduleEndDat);
				$('#checkCalendarModal textarea[name=scheduleContents]').val(resp.scheduleContents);
				if(resp.scheduleParticipant != null) {
					$('#checkCalendarModal input[name=scheduleParticipant]').click();
				}
				if(resp.alarmAlternative != null) {
					$('#checkCalendarModal input[name=alarmAlternative]').click();
				}
				if(resp.scheduleType == "E") {
					$('#checkCalendarModal input[name=scheduleType][value=E]').click();
				}
				if(resp.scheduleType == "D1") {
					$('#checkCalendarModal input[name=scheduleType][value=D1]').click();
				}
				if(resp.scheduleType == "D2") {
					$('#checkCalendarModal input[name=scheduleType][value=D2]').click();
				}
				if(resp.scheduleType == "C") {
					$('#checkCalendarModal input[name=scheduleType][value=C]').click();
				}
				
				let inputs = $('#checkCalendarModal input')
				
				
				for(input of inputs){
					input.setAttribute("disabled","disabled");
				}
				$('#checkCalendarModal textarea[name=scheduleContents]')[0].setAttribute("disabled","disabled");
				
				
				$('#checkCalendarModalButton')[0].click();
			},
			error : function(request, status, error) { 
				console.error(error);
			},
		})
  	},
	navLinks: true,
	editable: true,
	selectable: true,
	nowIndicator: true,
	dayMaxEvents: true,
	
});
calendar.render();

eventSource = calendar.getEventSources();
if(eventSource.length > 0){
	for(source of eventSource){
		source.remove();
	}
}



$(document).off('click','.calendar-box');
$(document).on('click','.calendar-box',function(event){
	let classList = this.classList;
	var who = $(this).data('calWho');
//	if($(event.target).is(':checked')){
	if(!classList.contains('active')){
		$(this).addClass('active');
		calendar.addEventSource( `${cPath}/user/calendar/getData?who=${who}` )
	} else {
		$(this).removeClass('active');
		let url = `${cPath}/user/calendar/getData?who=${who}`;
		let eventSource = calendar.getEventSources();
		for(source of eventSource){
			if(source.internalEventSource._raw == url){
				source.remove();
			}
		}
	}
})