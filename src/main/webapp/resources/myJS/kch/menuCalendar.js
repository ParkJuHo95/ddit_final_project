var calendarEl = document.getElementById('calendar');

var calendar = new FullCalendar.Calendar(calendarEl, {
  slotMinTime: '09:00',
  slotMaxTime: '19:00',
  expandRows: true,
  height: '100%',
  
  headerToolbar: {
    left: 'customButton',
    center: 'title',
    right: 'recomButton prev,next'
  },
  customButtons: {
    customButton: {
      text: '오늘 먹은 점심',
	  
      click: function() {
        $('#insertDiet').modal('show');
      }
    },
	recomButton: {
      text: '오늘의 추천 메뉴',
      click: function() {
         $('#recomMenu').modal('show');
      }
    }
  },
  initialView: 'dayGridMonth',
  navLinks: true, 
  editable: true,
  selectable: true,
  nowIndicator: true,
  dayMaxEvents: true, 
  //events:'${pageContext.request.contextPath}/user/mypage/dietList'
  events:`${cPath}/user/mypage/dietList`,
   displayEventTime: false, //12a 없애주기
});
calendar.render();

