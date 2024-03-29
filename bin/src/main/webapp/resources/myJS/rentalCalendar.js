var bookRental = $("#bookRental").val();
$.ajax({
	url: `${cPath}/user/book/roomCalendar/retrieve/` + bookRental,
	method: 'GET',
	success: function(response) {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			events: `${cPath}/user/book/roomCalendar/retrieve/${bookRental}`,
			locale: 'ko',
			slotMinTime: '09:00',
			slotMaxTime: '19:00',
			expandRows: true,
			height: '100%',
			eventDisplay: 'block', // 이벤트를 블록 요소로 표시하여 가로로 확장되도록 함
			eventMinWidth: 200, // 이벤트의 최소 너비를 설정
			headerToolbar: {
				left:'timeGridWeek',
				center: 'title',
				right: 'prev,next'
			},
			initialView: 'timeGridWeek',
			selectable: true,
			nowIndicator: true,
			allDaySlot: false,
			editable: true,
			selectOverlap: false,
			dateClick: function(info) {
				$('#smallModalButton')[0].click();
				$('input[name=bookStart]').val("");
				$('input[name=bookEnd]').val("");
				
				var clickedDate = info.date;

            // 클릭한 날짜를 콘솔에 출력
			var year = clickedDate.getFullYear();
            var month = (clickedDate.getMonth() + 1).toString().padStart(2, '0');
            var day = clickedDate.getDate().toString().padStart(2, '0');
            var hours = clickedDate.getHours().toString().padStart(2, '0');
            var minutes = clickedDate.getMinutes().toString().padStart(2, '0');
			var inputDateTime = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;
            document.querySelector('input[name="bookStart"]').value = inputDateTime;


			var year = clickedDate.getFullYear();
            var month = (clickedDate.getMonth() + 1).toString().padStart(2, '0');
            var day = clickedDate.getDate().toString().padStart(2, '0');
            var hours = clickedDate.getHours().toString().padStart(2, '0');
            var minutes = clickedDate.getMinutes().toString().padStart(2, '0');
			var inputDateTime = year + '-' + month + '-' + day + 'T' + (parseInt(hours) + 2).toString().padStart(2, '0') + ':' + minutes;
            document.querySelector('input[name="bookEnd"]').value = inputDateTime;
				
			},
			/*eventClick: function(info) {
				console.log(info)
				$('#smallModalButton').click();
				// 이벤트를 클릭했을 때 실행되는 함수
				var eventObj = info.event;
				var startTime = eventObj.start;
				var endTime = eventObj.end;
				
				// 날짜와 시간을 콘솔에 출력
				console.log('일정 시작 시간:', startTime);
				const year = startTime.getFullYear();
				const month = ('0' + (startTime.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더한 후, 두 자리로 만듭니다.
				const day = ('0' + startTime.getDate()).slice(-2); // 두 자리로 만듭니다.
				const hours = ('0' + startTime.getHours()).slice(-2); // 두 자리로 만듭니다.
				const minutes = ('0' + startTime.getMinutes()).slice(-2); // 두 자리로 만듭니다.
				const inputDateTime1 = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;
				document.querySelector('input[name="bookStart"]').value = inputDateTime1;
				
				console.log('일정 종료 시간:', endTime);
				const year1 = endTime.getFullYear();
				const month1 = ('0' + (endTime.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더한 후, 두 자리로 만듭니다.
				const day1 = ('0' + endTime.getDate()).slice(-2); // 두 자리로 만듭니다.
				const hours1 = ('0' + endTime.getHours()).slice(-2); // 두 자리로 만듭니다.
				const minutes1 = ('0' + endTime.getMinutes()).slice(-2); // 두 자리로 만듭니다.
				const inputDateTime2 = year1 + '-' + month1 + '-' + day1 + 'T' + hours1 + ':' + minutes1;
				document.querySelector('input[name="bookEnd"]').value = inputDateTime2;
			}*/
			
		});
		calendar.render();
	},
});
$('.calendar').css('font-size','12px !important');




/*		currentLocation = window.location.href;
		partLocation = currentLocation.split("/");
		resultLocation = ""
		for(let i=0;i<partLocation.length;i++){
			if(i == partLocation.length-1){
				resultLocation += "retrieve/"+partLocation[i];
			} else {
				resultLocation += partLocation[i]+"/"
			}
		}
		console.log("result");
		console.log(resultLocation);*/