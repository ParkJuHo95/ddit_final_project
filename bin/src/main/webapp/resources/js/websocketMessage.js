/**
 * 웹 소캣 인스턴스 생성
 */
let webSocket = null;

//전자결재 문서 갯수 넣어줄 뱃지
var sdcBadge;

$(document).ready(function() {
	
	sdcBadge = document.querySelector("#sdcBadge");
	
	webSocket = connection(msgUrl);
	
	var connectionType;
	
	webSocket.onopen = function() {
		processOpen();
	};
	webSocket.onmessage = function(message) {
		processMessage(message);
	};
	webSocket.onerror = function(message) {
		processError(message);
	};
	
	$.ajax({
	 url : `/WareBridge/user/alram`
	,method : 'get'
	,dataType :'json'
	,success : function(resp){
		
		let alramList = resp.alramList;
		if(alramList.length > 0){
			
			for(alram of alramList){
			//alram_li += `
				$('a.alram-log-all-remove').parent().before(`
					<li>
						<div class="d-flex" data-alram-no="${alram.alramNo}">
							<a class="dropdown-item alram-log-link" href="${alram.link}"> 
								<span class="align-middle">${alram.message}</span>
							</a>
							<a class="dropdown-item alram-log-remove" href="#"> 
								<i class="bx bx-x"></i>
							</a>
						</div>
					</li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
				`)
			}
			//$('#header-alram-dropdown').html(alram_li);
			$('#alramExistenceCheck').addClass("avatar-online");
			
			let lis = $('#header-alram-dropdown')[0].children;
			if(lis.length > 17){
				for(let i=0; i<lis.length-17;i++){
					lis[i].style.display = 'none';
				}
			}
		}
		
	}
	,error : function(err){
		console.log(err);
	}
})
	
});

/**
 * 웹 소캣 connection 연결부
 */
function connection(url) {
	var webSocket = null;
	if ('WebSocket' in window) {
		webSocket = new WebSocket(url);
	} else if ('MozWebSocket' in window) {
		webSocket = new MozWebSocket(url);
	} else {
		Console.log('Error: WebSocket is not supported by this browser.');
		return null;
	}
	return webSocket;
}

/**
 * 웹 소캣 connection 후 로그인 이벤트
 */
function processOpen() {

	webSocket.send(JSON.stringify({
		"connectionType": "firstConnection",
		"username": userName
	}));
	
}

/**
 * 웹 소캣 server에서 메시지가 넘어왔을때
 */
function processMessage(message) {
	// 서버 메시지 JSON 으로 파싱..
	var jsonData = JSON.parse(message.data);


	/**
	 * 웹 소캣 접속자 전체 목록
	 */
	if (jsonData.allUsers != null) {
		//다른 사용자 접속 시,
		displayUsers(jsonData.allUsers);
	}

	/**
	 * 웹 소캣 로그 아웃 시 사용자 목록 삭제.
	 */
	if (jsonData.disconnectedUser != null) {
		//다른 사용자가 접속을 끊을 때,
		$("#" + jsonData.disconnectedUser).remove();
	}

	/**
	 * 알림 메시지가 도착 하였을 경우.
	 */

	if (jsonData.connectionType == 'msgConnection') {
		let sendDateTime = jsonData.time;
		let divideTime = sendDateTime.split('T');
		let sendDate = divideTime[0]
		let sendTime = divideTime[1]
		let divideSendDate = sendDate.split('-');
		let divideSendTime = sendTime.split(':');
		let messageForm = `
			<div class="incoming_msg">
				<div class="incoming_msg_img">
					<span>${jsonData.sender}</span>
				</div>
				<div class="received_msg">
					<div class="received_withd_msg">
						<p>${jsonData.message}</p>
						<span class="time_date"> ${divideSendTime[0]}:${divideSendTime[1]} | ${divideSendDate[1]}월 ${divideSendDate[2]}일 </span>
					</div>
				</div>
			</div>
		`;
		if($('div.msg_history').length > 0){
			if($('#forRoomNo')[0].value == jsonData.roomNo){
				$('div.msg_history')[0].innerHTML += messageForm;
				let msgDiv = $('div.msg_history')[0];
				msgDiv.scrollTop = msgDiv.scrollHeight;
			}
		}
	}
	
	// ******여기다가 메일/채팅 넣어주기
	if(jsonData.connectionType == 'pill'){
		var sdcNum = jsonData.sdcNum;
		//sdcNum이 0이면 badge를 삭제, sdcBadge가 만들어지지 않았는지 먼저 확인함
		if (sdcNum == 0) sdcBadge?.remove();
		//0 이상인 경우 badge가 없으면 만들어주고 숫자 넣기
		if (sdcNum > 0) {
			if(!sdcBadge){
				var badgeHTML = '<span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="sdcBadge"></span>'
				document.querySelector("#sdcBadgeParent").innerHTML += badgeHTML;
			}
			sdcBadge.innerHTML = sdcNum;
		}	
	}
	
	if (jsonData.connectionType == 'alramConnection') {
		$('.lineUp')[0]?.remove();
		const newText = document.createElement('span');			
		newText.classList.add('lineUp');
 		newText.innerText = `[${jsonData.sender} 님] ${jsonData.message}`
		let alramDIV = document.querySelector('.alramNoticeDIV')
		alramDIV.appendChild(newText);
		setTimeout(() => { newText.classList.add('animate') }, 0);
		setTimeout(() => { newText.remove() }, 10000);
		
//		$('#header-alram-dropdown').append(`
		$('a.alram-log-all-remove').parent().before(`
			<li>
				<div class="d-flex" data-alram-no="${jsonData.alramNo}">
					<a class="dropdown-item alram-log-link" href="${jsonData.link}"> 
						<span class="align-middle">${jsonData.message}</span>
					</a>
					<a class="dropdown-item alram-log-remove" href="#"> 
						<i class="bx bx-x"></i>
					</a>
				</div>
			</li>
			<li>
				<div class="dropdown-divider"></div>
			</li>
		`);
		if(!$('#alramExistenceCheck').hasClass('avatar-online')){
			$('#alramExistenceCheck').addClass('avatar-online');
		}
				
		let lis = $('#header-alram-dropdown')[0].children;
		if(lis.length > 17){
			for(let i=0; i<lis.length-17;i++){
				lis[i].style.display = 'none';
			}
		}
	}
	
	
	//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
	if (jsonData.enterChatId != null) {
		var roomId = jsonData.enterChatId;
		$("#roomId").val(roomId);
		$("#username").val(jsonData.username);
		openPopup(roomId);
	}
	
	
}

/**
 * 전체 사용자 목록 구성...
 */
function displayUsers(userList) {

	$("#users tr:not(:first)").remove();
	for (var i = 0; i < userList.length; i++) {
		if (userName == userList[i]) {
			usrName = userList[i] + "(me!)";
		} else {
			usrName = userList[i];
		}

		$.newTr = $("<tr id=" + userList[i] + "><td>" + usrName + "</td></tr>");
		$("#users").last().append($.newTr);

	}
}

/**
 * 에러 발생시...
 */
function processError(message) {
	/* messagesTextArea.value += "error...\n"; */
}

/*
 * 페이지를 벗어 날을때 웹소켓 닫기..
 */
window.onbeforeunload = function() {
	webSocket.close();
};





function sendAlram(message,receiver,classification,link) {
	webSocket.send(JSON.stringify({
		  'connectionType' : 'alramConnection' 
		, 'message' : message 
		, 'receiver' : receiver
		, 'classification' : classification
		, 'link' : link
	}));
}

function sendMessage(message,roomNo) {
	webSocket.send(JSON.stringify({
		  'connectionType' : 'msgConnection' 
		, 'message' : message
		, 'roomNo' : `${roomNo}`
	}));
}

function Alram(dptid){
	sendAlram("안녕하세요 알람입니다.", ['0000','0001','0004','0003'],"E",`/WareBridge/user/calendar`);
}





















