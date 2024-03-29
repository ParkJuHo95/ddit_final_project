$(document).ready(function() {
	$(document).on('click', ".transSend", function(event) {
		var mailDetailContent = $(".SendMailTrans");
		var texts = mailDetailContent.val();
		$.ajax({
			url: `${cPath}/user/mail/transMail`,
			type: 'POST',
			data: {
				text: texts,
				lg: 'ko'
			}, // text 데이터를 서버로 전송
			success: function(response) {
				console.log(response);
				var jsonObject = JSON.parse(response.mt);
				var translatedText = jsonObject.message.result.translatedText
				console.log(translatedText);
				var newWindow = window.open('', '_blank', 'width=400,height=400');
				newWindow.document.write(translatedText);
			},
			error: function(error) {
				// 에러 처리
				console.error("Ajax 오류:", error);
			}
		});
	});
});
$(document).ready(function() {
	$(document).on('click', ".transESend", function(event) {
		var mailDetailContent = $(".SendMailTrans");
		var texts = mailDetailContent.val();
		$.ajax({
			url: `${cPath}/user/mail/transMail`,
			type: 'POST',
			data: {
				text: texts,
				lg: 'en'
			}, // text 데이터를 서버로 전송
			success: function(response) {
				console.log(response);
				var jsonObject = JSON.parse(response.mt);
				var translatedText = jsonObject.message.result.translatedText
				console.log(translatedText);
				var newWindow = window.open('', '_blank', 'width=400,height=400');
				newWindow.document.write(translatedText);
			},
			error: function(error) {
				// 에러 처리
				console.error("Ajax 오류:", error);
			}
		});
	});
});
$(document).ready(function() {
    $(document).on('click', ".transMail", function(event) {
        let mailDetailElement = $(".mailDetail")[0];
		let texts = mailDetailElement.textContent
        console.log(texts);
        // Ajax 요청
        $.ajax({
            url: `${cPath}/user/mail/transMail`,
            type: 'POST',
            data: {
                text: texts,
                lg: 'ko'
            }, // text 데이터를 서버로 전송
            success: function(response) {
				console.log(response);
				var jsonObject = JSON.parse(response.mt);
				var translatedText = jsonObject.message.result.translatedText
				console.log(translatedText);
                var newWindow = window.open('', '_blank', 'width=400,height=400');
					newWindow.document.write(translatedText);
            },
            error: function(error) {
                // 에러 처리
                console.error("Ajax 오류:", error);
            }
        });
    });
});
$(document).ready(function() {
    $(document).on('click', ".transEnMail", function(event) {
        let mailDetailElement = $(".mailDetail")[0];
		let texts = mailDetailElement.textContent
        console.log(texts);
        // Ajax 요청
        $.ajax({
            url: `${cPath}/user/mail/transMail`,
            type: 'POST',
            data: {
                text: texts,
                lg: 'en'
            }, // text 데이터를 서버로 전송
            success: function(response) {
				console.log(response);
				var jsonObject = JSON.parse(response.mt);
				var translatedText = jsonObject.message.result.translatedText
				console.log(translatedText);
                var newWindow = window.open('', '_blank', 'width=400,height=400');
					newWindow.document.write(translatedText);
            },
            error: function(error) {
                // 에러 처리
                console.error("Ajax 오류:", error);
            }
        });
    });
});
//임시 저장된 메일 업데이트
$(document).on('click', "tr.updateMail", function(event) {
    event.preventDefault(); // 이벤트 기본 동작 방지
    if ($(event.target).is(':checkbox')) {
    } else if ($(event.target).is('i.bx-bulb')) {
        event.preventDefault(); // 버블링 방지
    } else { 
        // 아니면 이벤트를 처리할 때
        let mailCode = $(this).data('mailcode'); // mailcode 가져오기
        let data = {
            selectedMails: mailCode // 선택된 메일코드를 데이터로 설정
        };
        let uri = $(this).data('mailDeleteTarget');
        let url = `${uri}/sMailSend`;
        let innerCardBody = document.querySelector("#inner-card-body");
        $.ajax({
            type: 'POST',
            url: url,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(resp) {
                let parser = new DOMParser();
                let newDoc = parser.parseFromString(resp, "text/html");
                let contents = newDoc.getElementById("inner-card-body");
                let preTag = contents.innerHTML;
                innerCardBody.innerHTML = preTag;
            }
        });
    }
});
//다중 체크 메일코드 
function getSelectedMails() {
    let selectedMails = [];
    $("input[type='checkbox']:checked").each(function () {
        let mailCode = $(this).data('mailCode')
        selectedMails.push(mailCode);
    });
    return selectedMails;
}
//한개 체크 메일 코드
function getSelectedMailCode() {
    let mailCode; 
    $("input[type='checkbox']:checked").each(function () {
        mailCode = $(this).data('mailCode');
    });
    return mailCode;
}

//답장 버튼 기능 
$(document).on('click', ".replyMail", function(event){
	event.preventDefault(); //프리벤트
	let uri = $(this).data('mailDeleteTarget');
    let selectedMails = getSelectedMailCode();
	  $("input[type='checkbox']:checked").each(function () {
        mailCode = $(this).data('mailCode');
    });
	if (mailCode.length > 1 ) {
        alert("한개의 메일에만 답장 할 수 있습니다.");
        return;
    }
	let data = {selectedMails : selectedMails}
	let url = `${uri}/reply`;
	
	let innerCardBody = document.querySelector("#inner-card-body");
	$.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(resp) {
			let parser = new DOMParser();
            let newDoc = parser.parseFromString(resp, "text/html");
            let contents = newDoc.getElementById("inner-card-body");
            let preTag = contents.innerHTML;
            innerCardBody.innerHTML = preTag;
        }
    });
});
//메일 내부 답장 버튼 기능 
$(document).on('click', ".inReply", function(event){
	event.preventDefault(); //프리벤트
	let uri = $(this).data('targetLink');
	var mailCode = $('.inReply').data('mailCode');
	let data =  {selectedMails : mailCode};
	console.log("mailCode",data);
	let url = `${uri}/reply`;
	let innerCardBody = document.querySelector("#inner-card-body");
	$.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(resp) {
			let parser = new DOMParser();
            let newDoc = parser.parseFromString(resp, "text/html");
            let contents = newDoc.getElementById("inner-card-body");
            let preTag = contents.innerHTML;
            innerCardBody.innerHTML = preTag;
        }
		
    });
});
//전달버튼
$(document).on('click', ".forWardMail", function(event){
	event.preventDefault(); //프리벤트
	let uri = $(this).data('mailDeleteTarget');
    let selectedMails = getSelectedMailCode();
	  $("input[type='checkbox']:checked").each(function () {
        mailCode = $(this).data('mailCode');
    });
	if (mailCode.length > 1 ) {
        alert("한개의 메일에만 답장 할 수 있습니다.");
        return;
    }
	let data = {selectedMails : selectedMails}
	let url = `${uri}/forward`;
	let innerCardBody = document.querySelector("#inner-card-body");
	$.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(resp) {
			let parser = new DOMParser();
            let newDoc = parser.parseFromString(resp, "text/html");
            let contents = newDoc.getElementById("inner-card-body");
            let preTag = contents.innerHTML;
            innerCardBody.innerHTML = preTag;
        }
    });
});
//메일 복구 버튼
$(document).on('click', ".goToOrin", function(event) {
    event.preventDefault();
    let selectedMails = getSelectedMails();
	let uri = $(this).data('rollBack');
    if (selectedMails.length === 0) {
        alert("선택된 메일이 없습니다.");
        return;
    }
    let url = `${cPath}${uri}/rollBack`;
    let data = selectedMails;
    $.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
			toastr.success("메일이 복구 되었습니다.");
			innerBodyAjax(`${cPath}${response}`);
        }
    });
});
//메일 삭제 버튼
$(document).on('click', ".goToBin", function(event) {
    event.preventDefault();

    let uri = $(this).data('mailDeleteTarget');
    let selectedMails = getSelectedMails();

    if (selectedMails.length === 0) {
        alert("선택된 메일이 없습니다.");
        return;
    }
    let url = `${uri}/delete`;
    let data = selectedMails;
    $.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
	toastr.success("메일이 삭제 되었습니다.");
			innerBodyAjax(uri);
        }
    });
});
//메일 내부 삭제 버튼
$(document).on('click', ".inDelete", function(event) {
    event.preventDefault();
	var mailCode = $(this).data('mailCode');
	let uri = $(this).data('targetLink');
    let url = `${uri}/delete`;
    let data = selectedMails;
    $.ajax({
        type: 'POST',
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
	toastr.success("메일이 삭제 되었습니다.");
			innerBodyAjax(uri);
        }
    });
});

//메일 임시저장
$(document).on('click', ".imsiSave", function(event) {
	event.preventDefault();
	let form = $('#sendMailForm');
	let fd = new FormData(form.get(0));
	$.ajax({
		type: "POST",
		url: `${cPath}/user/mail/saveSendMail`,
		data: fd,
		processData: false,
		contentType: false,
		success: function(response) {
			innerBodyAjax('/WareBridge/user/mail/outMail');
		},
		error: function(error) {
			toastr.success("메일이 임시저장 되었습니다.");
			console.error(error);
		}
	});
});
//메일 작성 취소
function confirmCancel() {
	var isConfirmed = confirm('작성을 취소하시겠습니까? 내용은 저장 되지 않습니다.');
	if (isConfirmed) history.back();
}
/*//메일 즁요 표시
$(document).on('click', "i.bx-bulb", function(event) {
	event.preventDefault();
	if ($(this).hasClass("light-style")) {
		$(this).removeClass("light-style");
	} else {
		$(this).addClass("light-style");
	}
});
*///메일 안으루 들어가기
$(document).on('click', 'tr.mail-inside', function(event) {
	if ($(event.target).is(':checkbox')) {
	} else if ($(event.target).is('i.bx-bulb')) {
		event.preventDefault();
	} else {
		let mailCode = $(this).data('mailcode')
		var url = `${cPath}/user/mail/mailDetail/${mailCode}`;
		innerBodyAjax(url);
	}
});
$(document).on('click', 'tr.nvrmail-inside', function(event) {
	if ($(event.target).is(':checkbox')) {
	} else if ($(event.target).is('i.bx-bulb')) {
		event.preventDefault();
	} else {
		let mailCode = $(this).data('mailcode')
		var url = `${cPath}/user/mail/nvrmailDetail/${mailCode}`;
		innerBodyAjax(url);
	}
});
//메일 보내기
$(document).on('submit', '#sendMailForm', function(event) {
	event.preventDefault();
	let fd = new FormData(event.target);
	$.ajax({
		type: "POST",
		url: `${cPath}/user/mail/sendMail`,
		data: fd,
		processData: false,
		contentType: false,
		success: function(response) {
			innerBodyAjax('/WareBridge/user/mail/outMail');
			sendAlram("메일이 도착했습니다.", [0000], "E", '/WareBridge/user/mail/inMail');
			toastr.success("메일이 발송 되었습니다.");
		},
		error: function(error) {
			console.error(error);
		}
	});
});
//답장...
$(document).on('submit', '#sendReplyMailForm', function(event) {
	event.preventDefault();
	let fd = new FormData(event.target);
	$.ajax({
		type: "POST",
		url: `${cPath}/user/mail/replyMail`,
		data: fd,
		processData: false,
		contentType: false,
		success: function(response) {
			toastr.success("메일이 발송 되었습니다.");
			sendAlram("메일이 도착했습니다.", [0000], "E", '/WareBridge/user/mail/inMail');
			innerBodyAjax('/WareBridge/user/mail/outMail');
		},
		error: function(error) {
			console.error(error);
		}
	});
});
//네이버 메일 보내기 화면으로 이동
$(document).on('click', '.nvr', function(event) {
	console.log("google")
		var url = `${cPath}/user/mail/sendMail/nvr`;
		innerBodyAjax(url);
});
//네이버 메일 보내기
$(document).on('submit', '#nvrMailForm', function(event) {
	event.preventDefault();
	let nvr = new FormData(event.target);
	$.ajax({
		type: "POST",
		url: `${cPath}/user/mail/sendMail/nvr`,
		data: nvr,
		processData: false,
		contentType: false,
		success: function(response) {
			toastr.success("네이버 메일이 발송 되었습니다.");
			innerBodyAjax('/WareBridge/user/mail/nvrMail');
		},
		error: function(error) {
			console.error(error);
		}
	});
});