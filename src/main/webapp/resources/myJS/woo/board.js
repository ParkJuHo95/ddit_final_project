function boardAjax(method,url,data,redirectLocation){
	$.ajax({
		type : method,           // 타입 (get, post, put 등등)    
		url : url,           // 요청할 서버url    
		//dataType : 'json',
		contentType : 'application/json',
		data : JSON.stringify(data),
		success : function(resp) {
			innerBodyAjax(redirectLocation)
		},    
		error: function(xhr, status, error) {
            console.error(error);
            // 서버에서 받은 에러 메시지를 가져옴
            var errorMessage = xhr.responseText;
            // TOASTR로 에러 메시지 표시
            toastr.error(errorMessage);
        }
	})
}

$(document).off('click',"div.title a.boardA");
$(document).on('click',"div.title a.boardA", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let boardNo = $(this).data('boardno');
	var url = `${cPath}/user/board/company/${boardNo}`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.title a.boardATeam");
$(document).on('click',"div.title a.boardATeam", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let boardNo = $(this).data('boardno');
	var url = `${cPath}/user/board/team/${boardNo}`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.title a.boardB");
$(document).on('click',"div.title a.boardB", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let boardNo = $(this).data('boardno');
	var url = `${cPath}/user/board/company/${boardNo}`; 
	innerBodyAjax(url)
})
$(document).off('click',"div.title a.boardTeam");
$(document).on('click',"div.title a.boardTeam", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let boardNo = $(this).data('boardno');
	var url = `${cPath}/user/board/team/${boardNo}`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.bt_wrap a.on");
$(document).on('click',"div.bt_wrap a.on", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	var url = `${cPath}/user/board/company`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.bt_wrap a.onteam");
$(document).on('click',"div.bt_wrap a.onteam", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	var url = `${cPath}/user/board/team`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.bt_wrap a.on1");
$(document).on('click',"div.bt_wrap a.on1", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	var boardNo = $(this).data('board-no');
	var url = `${cPath}/user/board/company/${boardNo}/update`; 
	innerBodyAjax(url)
})

$(document).off('click',"div.bt_wrap a.onteam1");
$(document).on('click',"div.bt_wrap a.onteam1", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	var boardNo = $(this).data('board-no');
	var url = `${cPath}/user/board/team/${boardNo}/update`; 
	innerBodyAjax(url)
})


/*document.getElementById("insert").addEventListener("click",function(event){*/

$(document).off('click', "#insertAA");
$(document).on('click', "#insertAA", function (event) {
	event.preventDefault();
    let url = `${cPath}/user/board/company/insert`;
    let formData = new FormData(document.querySelector('form'));
    fetch(url, {
        method: 'POST',
        body: formData,
    })
    .then(response => {
		console.log(response);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
		return response.json();
    })
    .then(data => {
		console.log(data.newBoard.cbSeq)
		let cnt = data.cnt;
		let boardNo = data.newBoard.cbSeq;
		innerBodyAjax(`${cPath}/user/board/company/${boardNo}`);
		console.log(boardNo);
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
});

$(document).off('click', "#insertTeam");
$(document).on('click', "#insertTeam", function (event) {
	event.preventDefault();
    let url = `${cPath}/user/board/team/insert`;
	console.log(event)
    let formData = new FormData(document.querySelector('form'));
    fetch(url, {
        method: 'POST',
        body: formData,
    })
    .then(response => {
		console.log(response);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
		return response.json();
    })
    .then(data => {
		console.log(data.newBoard.tbSeq)
		let cnt = data.cnt;
		let boardNo = data.newBoard.tbSeq;
		innerBodyAjax(`${cPath}/user/board/team/${boardNo}`);
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
});

$(document).off('click', "#insertCC");
$(document).on('click', "#insertCC", function (event) {
	event.preventDefault();
    let url = `${cPath}/user/reply/write`;
    let formData = new FormData(document.querySelector('form'));
    fetch(url, {
        method: 'POST',
        body: formData,
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
		return response.json();
    })
    .then(data => {
		console.log(data)
		let boardNo = data.commentVO.cmtCbNo;
		innerBodyAjax(`${cPath}/user/board/company/${boardNo}`);
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
});

$(document).off('click', "#updateAA");
$(document).on('click', "#updateAA", function (event) {
    event.preventDefault();
    let formData = new FormData(document.querySelector('form'));
	let boardNo = $(this).data('boardNo');	
	let url = `${cPath}/user/board/company/${boardNo}/update`;
    fetch(url, {
        method: 'POST',
        body: formData,
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        let cnt = data.cnt;
        innerBodyAjax(`${cPath}/user/board/company/${boardNo}`);
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
});
function getSelectedPosts() {
    let selectedPosts = [];
    $("input[type='checkbox']:checked").each(function () {
        let boardNo = $(this).data('checkDelete')
        selectedPosts.push(boardNo);
    });
    return selectedPosts;
}

$(document).off('click', "[data-btn-notice]");
$(document).on('click', "[data-btn-notice]", function (event) {
    event.preventDefault(); // 버튼의 기본 동작 방지
    let uri = $(this).data('btnNotice');
    let selectedPosts = getSelectedPosts();
    // 선택된 게시물이 없을 경우 알림을 표시하고 반환
    if (selectedPosts.length === 0) {
        alert("선택된 게시물이 없습니다.");
        return;
    }

    let url = `${cPath}${uri}/${selectedPosts[0]}/notice`;
    let data = {
		'a':'a'
	}
	data = JSON.stringify(data)
    boardAjax('POST', url,data,`${cPath}/user/board/company`);
	sendAlram("새로운 전사 공지가 등록되었습니다",[`${cmpId}`], "C", '/WareBridge/user/board/company');
	
	});
	
	
$(document).off('click', "[data-btn-unnotice]");
$(document).on('click', "[data-btn-unnotice]", function (event) {
    event.preventDefault(); // 버튼의 기본 동작 방지
    let uri = $(this).data('btnUnnotice');
    let selectedPosts = getSelectedPosts();
    // 선택된 게시물이 없을 경우 알림을 표시하고 반환
    if (selectedPosts.length === 0) {
        alert("선택된 게시물이 없습니다.");
        return;
    }

    let url = `${cPath}${uri}/${selectedPosts[0]}/unnotice`;
    let data = {
		'a':'a'
	}
	data = JSON.stringify(data)
    boardAjax('POST', url,data,`${cPath}/user/board/company`);
	});
	
$(document).off('click', "[data-btn-teamnotice]" );
$(document).on('click', "[data-btn-teamnotice]", function (event) {
    event.preventDefault(); // 버튼의 기본 동작 방지
    let uri = $(this).data('btnTeamnotice');
    let selectedPosts = getSelectedPosts();
    // 선택된 게시물이 없을 경우 알림을 표시하고 반환
    if (selectedPosts.length === 0) {
        alert("선택된 게시물이 없습니다.");
        return;
    }

    let url = `${cPath}${uri}/${selectedPosts[0]}/notice`;
    let data = {
		'a':'a'
	}
	data = JSON.stringify(data)
    boardAjax('POST', url,data,`${cPath}/user/board/team`);
	sendAlram("팀 공지가 등록되었습니다",[`${cmpId}`], "T", '/WareBridge/user/board/team');
	});
	
$(document).off('click', "[data-btn-teamunnotice]");
$(document).on('click', "[data-btn-teamunnotice]", function (event) {
    event.preventDefault(); // 버튼의 기본 동작 방지
    let uri = $(this).data('btnTeamunnotice');
    let selectedPosts = getSelectedPosts();
    // 선택된 게시물이 없을 경우 알림을 표시하고 반환
    if (selectedPosts.length === 0) {
        alert("선택된 게시물이 없습니다.");
        return;
    }

    let url = `${cPath}${uri}/${selectedPosts[0]}/unnotice`;
    let data = {
		'a':'a'
	}
	data = JSON.stringify(data)
    boardAjax('POST', url,data,`${cPath}/user/board/team`);
	});

$(document).off('click', "[data-btn-delete]");
$(document).on('click', "[data-btn-delete]", function (event) {
    event.preventDefault(); // 기본 동작 방지
    let uri = $(this).data('btnDelete');
    let selectedPosts = getSelectedPosts();
    // 선택된 게시글이 없으면 알림 또는 처리 방식 추가
    if (selectedPosts.length === 0) {
        alert("선택된 게시글이 없습니다.");
        return;
    }
	console.log(selectedPosts);
	
	let url = `${cPath}${uri}/${selectedPosts[0]}/delete`;
	let data = {
		'a':'a'
	}
	data = JSON.stringify(data)
    boardAjax('POST', url,data,`${cPath}/user/board/company`);
});
/*시연용 데이터*/
/*$(document).on('click',"#insertBoardData", function(){
	$("input[name='cbName']").val("제목이란가");
    $("textarea[name='cbContent']").text("제목이란가");
});*/



/*$(document).on('click', ".download-link", function (event) {
    event.preventDefault(); 
    var atchNo = $(this).data('atchNo');
	console.log(atchNo);
	$.ajax({
        url: `${cPath}/user/companyboard/download/${atchNo}`,
        type: "GET",
        success: function (data) {
        },
        error: function (request, status, error) {
            console.error("Error downloading file: " + error);
        }
    });
});
*/