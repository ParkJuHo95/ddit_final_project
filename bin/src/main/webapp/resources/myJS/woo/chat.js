$(document).on('dblclick','.chat-user',function(){
	let targetNo = $(this).data('empNo');
	let url = `${cPath}/user/community/chat/openChatRoom`
	let data = {
		openUser : empNo,
		targetUser : targetNo
	}
	$.ajax({
		url : url,
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp){
			if(resp.check == "already"){
				//innerBodyAjax(`/WareBridge/user/community/chat`);
				setTimeout(() => $('#chatRoomTab').click(), 200);
				setTimeout(() => $(`.chat-room[data-room-no="${resp.result}"]`).dblclick(), 200);
			} else if (resp.check == "success"){
				innerBodyAjax(`/WareBridge/user/community/chat`);
				setTimeout(() => $('#chatRoomTab').click(), 400);
				setTimeout(() => $(`.chat-room[data-room-no="${resp.result}"]`).dblclick(), 500);
			} else {
				toastr.warning("시스템 에러 다시 시도해주세요")
			}
		},
		error : function(error){
			console.log("error",error)
		}
	});
})

$(document).on('dblclick','.chat-room',function(){
	let roomNo = $(this).data('roomNo');
	let url = `${cPath}/user/community/chat/loadMessages`;
	let title = $(this).children()[0].children[0].textContent.trim();
	$('.msg-title').html(title);
	$('#forRoomNo').val(roomNo);
//	$('.msg_send_btn')[0].dataset.roomNo = roomNo;
	let data = {
		roomNo : roomNo
	}
	$.ajax({
		url : url,
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp){
			let messages = resp.messages;
			let messageForm = "";
			for(message of messages){
				if(message.cmEmpNo != empNo) {
					messageForm += `
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<span>${message.empName}</span>
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>${message.cmMessage}</p>
									<span class="time_date"> ${message.createDate[3]}:${message.createDate[4]} | ${message.createDate[1]}월 ${message.createDate[2]}일 </span>
								</div>
							</div>
						</div>
					`
				} else {
					messageForm += `
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>${message.cmMessage}</p>
								<span class="time_date"> ${message.createDate[3]}:${message.createDate[4]} | ${message.createDate[1]}월 ${message.createDate[2]}일</span>
							</div>
						</div>
					`
				}
				
			}
			$('div.msg_history').html(messageForm);
			let msgDiv = $('div.msg_history')[0];
			msgDiv.scrollTop = msgDiv.scrollHeight;
		},
		error : function(error){
			console.log("error",error)
		}
	});
})



$(document).on('click','.msg_send_btn',function(){
	let textInput = $(this).prev()[0];
	let roomNo = $('#forRoomNo').val();
//	let roomNo = $(this).data('roomNo');
	let message = textInput.value;
	let now = new Date();
	let minute = "";
	if(now.getMinutes().toString().length == 1){
		minute = `0${now.getMinutes().toString()}`
	} else {
		minute = `${now.getMinutes().toString()}`
	}
	sendMessage(message,roomNo);
	let messageForm = `
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>${message}</p>
				<span class="time_date"> ${now.getHours()}:${minute} | ${now.getMonth()+1}월 ${now.getDate()}일</span>
			</div>
		</div>
	`
	let msgDiv = $('div.msg_history')[0];
	msgDiv.innerHTML += messageForm;
	msgDiv.scrollTop = msgDiv.scrollHeight;
	textInput.value = "";
})

function enterKey(event){
	if(event.keyCode == 13){
		$('.msg_send_btn')[0].click();
	}
}

$(document).on('click','.change-chatRoomTitle',function(){
	$('input[name="crjChatRoomNo"]').val($(this).data('roomNo'));
	let text = $(this).parents('.dropdown').prev().children().text();
	$('input[name="myTitle"]').val(text.trim());
	$('#modifyRoomTitleButton')[0].click();
})

$(document).on('submit','#modifyRoomTitleForm',function(event){
	event.preventDefault();
	let data = {}
	let formData = new FormData(this);
	for(let key of formData.keys()){
		data[key] = formData.get(key);
	};
	let MyroomNo = formData.get('crjChatRoomNo');
	let MyChangeName = formData.get('myTitle');
	
	$.ajax({
		url : `${cPath}/user/community/chat/modifyMyTitle`,
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp){
			if(resp.result > 0){
				let modifyTitle = resp.updateData.myTitle;
				let roomDiv = $(`.chat-room[data-room-no=${resp.updateData.crjChatRoomNo}]`);
				let roomTitle = roomDiv.children().children();
				roomTitle[0].innerHTML = modifyTitle;
				let btnRoomNo = $('#forRoomNo').val();
				if(btnRoomNo == MyroomNo){
					$('.msg-title').html(MyChangeName);
				}
			}
		},
		error : function(err){
			console.log(err)
		}
	})
})

$(document).on('click','.out-from-chatRoom',function(){
	let roomNo = $(this).data('roomNo');
	let myNo = empNo;
	let data = {
		crjChatRoomNo : roomNo,
		crjEmpNo : myNo
	}
	$.ajax({
		url : `${cPath}/user/community/chat/outFromRoom`,
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp){
			if(resp.result > 0){
				$(`.chat-room[data-room-no=${roomNo}]`).next().remove();
				$(`.chat-room[data-room-no=${roomNo}]`).remove();
			}
		},
		error : function(err){
			console.log(err)
		}
	})
})


$(document).on('click','.update-chatRoomUser',function(event){
	event.preventDefault();
	let roomNo = $(this).data('roomNo');
	$.ajax({
		url : `${cPath}/user/community/chat/loadAllUsers`,
		method : "post",
		data : {
			roomNo : roomNo
		},
		dataType : 'json',
		success : function(resp){
			let Users = resp.finalUsers;
			let listDivs = ""
			for(emp of Users){
				let jobPosition = "";
				if(emp.empJobposition != null){
					jobPosition = emp.empJobposition;
				}
				listDivs += `
					<div class="chat_people d-flex" data-emp-no="${emp.empNo}">
						<div>
							<input type="checkbox" class="insertChatRoomUserCB" data-emp-no="${emp.empNo}"/>
						</div>
						<div class="chat_ib">
							<span>
								${emp.empName } ${jobPosition}님
							</span>
						</div>
					</div>
					<hr>
				`
			}
			$("#updateUsersList").html(listDivs);
			$('#hidden4roomNo').val(roomNo);
			$('#updateChatRoomUserButton').click();
		},
		error : function(err){
			console.log(err)
		}
	})
})


$(document).on('click','#updateRoomUserButton',function(){
	let checkBoxs = $('.insertChatRoomUserCB:checked');
	let empNoList = []
	let roomNo = $('#hidden4roomNo').val();
	for(checkBox of checkBoxs){
		empNoList.push(checkBox.dataset.empNo);
	}
	let data = {
			empNoList : empNoList,
			roomNo : roomNo
		}
	
	$.ajax({
		url : `${cPath}/user/community/chat/insertUsers`,
		method : 'post',
		data : JSON.stringify(data),
		contentType : "application/json",
		dataType : 'json',
		success : function(resp){
			if(resp.result == "success"){
				innerBodyAjax(`/WareBridge/user/community/chat`);
				setTimeout(() => $('#chatRoomTab').click(), 600);
				//setTimeout(() => $(`.chat-room[data-room-no="${roomNo}"]`).dblclick(), 500);
			} else if(resp.result == "fail"){
				toastr.warning("추가 도중 오류 발생..다시 시도해주세요")
			};
			
		},
		error : function(err){
			console.log(err)
		}
	})
})

