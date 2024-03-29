let cPath = document.querySelector("body").dataset?.contextPath;
let cmpId = document.querySelector("body").dataset?.cmpId;
let empNo = document.querySelector("body").dataset?.empNo;
let empName = document.querySelector("body").dataset?.userName;
let empRole = document.querySelector("body").dataset?.userRole;

toastr.options.positionClass = "toast-top-right"

function bodyAjax(url,inner){ 
	let contentsPlace = document.querySelector("#div-body");
	removeScript();
	$.ajax({
		type : 'get',           // 타입 (get, post, put 등등)    
		url : url,           // 요청할 서버url    
		dataType : 'html',
		beforeSend: function(xhr) {
	        popCheck = inner
	    },
		success : function(resp) {
			contentsPlace.innerHTML = resp;
		},    
		error : function(request, status, error) { 
			console.error(error);
		},
		complete : function(){
			$("<script/>", {
		        src: `${cPath}/resources/myJS/subMenu.js`,
		        type: "text/javascript"
		    }).appendTo("body");

	    
			if(
				url.includes("calendar") && !url.includes('input') || 
				url.includes("/user/book/") || 
				url.includes("roomCalendar") || 
				url.includes("eworks") || 
				url.includes("organization") || 
				url.includes("admin/security") || 
				url.includes("user/address") || 
				url.includes("dietCalendar")
			){
				let location = ""
				
				if(url.includes("calendar")){
					location = `${cPath}/resources/myJS/pjh/myCalendar.js`
				}
				if(url.includes("/user/book/")){
					location = `${cPath}/resources/myJS/rentalCalendar.js`
				}
				if(url.includes("roomCalendar")){
					location = `${cPath}/resources/myJS/kch/menuCalendar.js`
				}
				if(url.includes("eworks")){
					location = `${cPath}/resources/myJS/eb/eworks.js`
				}
				if(url.includes("organization")){
					location = `${cPath}/resources/myJS/eb/departmentSystem.js`
				}
				if(url.includes("admin/security")){
					location = `${cPath}/resources/myJS/kch/adminList.js`
				}
				if(url.includes("dietCalendar")){
					location = `${cPath}/resources/myJS/kch/menuCalendar.js`
				}
				if(url.includes("user/address")){
					location = `${cPath}/resources/myJS/eb/pblcadbk.js`
				}

				$("<script/>", {
			        src: location,
					type: "text/javascript"
			    }).appendTo("body");
			    
			};
	
		/*	if(url.includes("eworks") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/eb/eworks.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			
			if(url.includes("organization") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/eb/departmentSystem.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("user/address") ){
				if(url.includes("/WareBridge/user/address/prsnl/insertForm")){
					
				} else {
					$("<script/>", {
				        src: `${cPath}/resources/myJS/eb/pblcadbk.js`,
				        type: "text/javascript"
				    }).appendTo("body");
				}
			}
			if(url.includes("admin/security") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/kch/adminList.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}*/
		}
	})
}



function innerBodyAjax(url,inner,data){
	removeScript();
	let innerCardBody = document.querySelector("#inner-card-body");
	$.ajax({
        type: 'get',
        url: url,
        dataType: 'html',
		beforeSend: function() {
			popCheck = inner
	    },
		data:data,
        success: function (resp) {
            let parser = new DOMParser();
            let newDoc = parser.parseFromString(resp, "text/html");
            let contents = newDoc.getElementById("inner-card-body");
            let preTag = contents.innerHTML;
            innerCardBody.innerHTML = preTag;
        },
        error: function (request, status, error) {
            console.error(error);
        },
		complete : function(){
			console.log(url);
		
			if(
				url.includes("calendar") && !url.includes('input') || 
				url.includes("user/book") || 
				url.includes("dietCalendar") || 
				url.includes("faceLogin") || 
				url.includes("menu")
			){

				let location = ""
				
				if(url.includes("calendar")){
					location = `${cPath}/resources/myJS/pjh/myCalendar.js`
				}
				if(url.includes("faceLogin")){
					location = `${cPath}/resources/myJS/pjh/capture.js`
				}
				if(url.includes("user/book")){
					location = `${cPath}/resources/myJS/rentalCalendar.js`
				}
				if(url.includes("dietCalendar")){
					location = `${cPath}/resources/myJS/kch/menuCalendar.js`
				}

				$("<script/>", {
			        src: location,
					type: "text/javascript"
			    }).appendTo("body");
			};
			
			if(url.includes("sendMail") || url.includes("rental") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/sendMailScript.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("personnelSystem") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/eb/personnelSystem.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("organization") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/eb/departmentSystem.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("newDoc") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/eb/newDoc.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("address/prsnl") ){
				if(url.includes("insertForm")){

				} else {
					$("<script/>", {
				        src: `${cPath}/resources/myJS/eb/prsnladbk.js`,
				        type: "text/javascript"
				    }).appendTo("body");
				}
			}
			if(url.includes("admin/security") ){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/kch/adminList.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
			if(url.includes("board") && url.includes("/insert")){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/woo/boardInsert.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			}
		}
    });
}



function submitAjax(url,method,data,location){ 
	$.ajax({
		type : method,
		url : url,
		data : data ,
		success : function(resp) {
			if(resp.result != 0){
				toastr.success("성공!");
				console.log(resp);
				if(resp.location != null){
					innerBodyAjax(`${cPath}${resp.location}`);
				}
				if(location != null){
					innerBodyAjax(location)
				}
			} else {
				toastr.warning("다시 시도해주세요")
			}
		},    
		error : function(error) { 
			console.log(error);
			toastr.warning("입력실패.. 다시 시도해주세요");
		}
	})
}
function submitFormAjax(url,method,data,location){ 
	$.ajax({
		type : method,
		url : url,
		data : data ,
		processData: false, // formData를 query string으로 변환하지 않음
        contentType: false, // formData를 전송할 때 content type을 설정하지 않음
		success : function(resp) {
			toastr.success("완료되었습니다");
			console.log(resp);
			if(resp.location != null){
				innerBodyAjax(`${cPath}${resp.location}`);
				if(resp.receiver){
					sendAlram(resp.message, [resp.receiver], 'E', `${cPath}${resp.link}`)
				}
			}
			if(location != null){
				innerBodyAjax(location)
			}
		},    
		error : function(error) { 
			console.log(error);
			var errorText = error.responseJSON;
   			toastr.warning(errorText);
		}
	})
}


function crudAjax(method,url,data,redirectLocation){
	$.ajax({
		type : method,           // 타입 (get, post, put 등등)    
		url : url,           // 요청할 서버url    
		//dataType : 'json',
		contentType : 'application/json',
		data : JSON.stringify(data),
		success : function(resp) {
			innerBodyAjax(redirectLocation)
		},    
		error : function(request, status, error) { 
			console.error(error);
		},
	})
}





//================================전체기능=======================================




$(document).on('click',"aside .menu-link",function(event){
	event.preventDefault();
	let myparent = $(this).parents("li");
	myparent.siblings().removeClass("active");
	myparent.addClass("active");
	let url = this.href
	bodyAjax(url);
})


$(document).on('click',"div.inner-sub-menu a.menu-link",function(event){
	event.preventDefault();
	let myparent = $(this).parents("li");
	myparent.siblings().removeClass("active");
	myparent.addClass("active");
	if(this.classList.contains('menu-toggle')) return;
	url = this.href
	innerBodyAjax(url)
})


$(document).on('click',"#header-mypage",function(event){
	event.preventDefault();
	let myparent = $($('aside .menu-link')[1]).parents("li");
	myparent.siblings().removeClass("active");
	myparent.removeClass("active");
	let url = this.href
	bodyAjax(url);
})


$(document).on('click', "[data-btn-location]", function (event) {
    event.preventDefault(); // 기본 동작 방지
    let uri = $(this).data('btnLocation');
    let url = `${cPath}${uri}`;
	innerBodyAjax(url)
	
/*	msgWebSocket.send(JSON.stringify({
		"connectionType": "msgConnection",
		"message": "메시지 발송 테스트   .."
	}));*/
});


//form 제출
$(document).on('click', "[data-post-location]", function (event) {
    event.preventDefault(); // 기본 동작 방지
    let uri = $(this).data('postLocation');
    let url = `${cPath}${uri}`;
	console.log(url);
	let method = "post";
	let form = $(this).closest('form'); // 클릭된 요소가 속한 가장 가까운 폼
    let formData = new FormData(form[0]); 
	submitFormAjax(url, method, formData)
});


$(document).on('click',".href-link",function(event){
	event.preventDefault();
	let url = $(this).attr('href');
	innerBodyAjax(`${cPath}${url}`);
})


//================================홈 링크================================
$(document).on('click','.btn-home-button',function(){
	let url = $(this).data('btnHomeLocation');
	$(`aside a`).each((idx,a)=>{
		if(a.href.includes(url)){
			a.click();
		}
	})
	setTimeout(() => {
		$('.btn-compose').click();
	}, 200);
})

$(document).on('click','.home-card-title',function(event){
	event.preventDefault();
	let url = $(this).data('titleLocation');
	bodyAjax(url);
})


//=================================AI링크=================================
$(document).on('click','.home-ai-link',function(event){
	event.preventDefault();
	let url = $(this).data('aiLocation');
	$('#header-mypage').click();
	setTimeout(() => {
		innerBodyAjax(url);
	}, 200);
})


//================================알람====================================
$(document).on('click','.alram-log-remove',function(event){
	event.preventDefault();
	let myLi = $(this).parents('li')[0];
	let liDivider = $(myLi).next()[0];
	myLi.remove();
	liDivider.remove();
	
	let alramNo = $(this).parent().data('alramNo');
	console.log(alramNo);
	
	afterAlramCheck(alramNo);
	

	
	let lis = $('#header-alram-dropdown')[0].children;
	if(lis.length > 17){
		for(let i=0; i<lis.length-17;i++){
			lis[i].style.display = 'none';
		}
		for(let i=lis.length-17;i<lis.length;i++){
			lis[i].style.display = 'block';
		}
	} else {
		for(let i=0;i<lis.length;i++){
			lis[i].style.display = 'block';
		}
	}
	
	if($('#header-alram-dropdown').children().length < 2){
		$('#alramExistenceCheck').removeClass('avatar-online');
	}
})

$(document).on('click','.alram-log-all-remove',function(event){
	let lis = $(this).parent().siblings();
	for(li of lis){
		$(li).find('a.alram-log-remove')[0]?.click();
	}
})



$(document).on('click','.alram-log-link',function(event){
	event.preventDefault();
	let url = this.href;
	let firstUrl = "";
	if(url.includes('/user/mail')) {
		firstUrl = `${cPath}/user/mail/inMail`
	} else if(url.includes('/user/repository')) {
		firstUrl = `${cPath}/user/repository?who=E`
	} else if(url.includes('/user/eworks')) {
		firstUrl = `${cPath}/user/eworks`
	} else if(url.includes('/user/community')) {
		firstUrl = `${cPath}/user/community/chat`
	} else if(url.includes('/user/board')) {
		firstUrl = `${cPath}/user/board/company`
	} else if(url.includes('/user/book')) {
		firstUrl = `${cPath}/user/book/bookSub`
	} else if(url.includes('/user/address')) {
		firstUrl = `${cPath}/user/address`
	} else if(url.includes('/user/calendar')) {
		firstUrl = "";
	}
	
	if(firstUrl != ""){
		setTimeout(() => bodyAjax(firstUrl), 200);
		setTimeout(() => innerBodyAjax(url), 200);
	} else {
		setTimeout(() => bodyAjax(url), 200);
	}
	
	
	let myLi = $(this).parents('li')[0];
	let liDivider = $(myLi).next()[0];
	myLi.remove();
	liDivider.remove();

	if($('#header-alram-dropdown').children().length < 1){
		$('#alramExistenceCheck').removeClass('avatar-online');
	}
})

function afterAlramCheck(alramNo){
	$.ajax({
		url : `${cPath}/user/alram/update`,
		method : 'post',
		data : {
			'alramNo' : alramNo	
		},
		success : function(resp){
			console.log('삭제 성공')			
		}
	})
}


//========================채팅 pill개수 만드는 함수===================================
countChat4pill();
function countChat4pill(){
	let counts = $('.for-chat-pill');
	if(counts.length > 0){
		let totalCnt = "";
		for(count of counts){
			let cnt = count.textContent;
			if(cnt == "99+"){
				totalCnt = "99+";
			} else {
				totalCnt += cnt;
			}
		}
		if(totalCnt > 99){
			totalCnt = "99+";
		}
		$('#newTextBadge')[0].innerText = totalCnt;
	}
}


//================================앞/뒤로가기=======================================
$(document).on('ajaxComplete', function(event, jqXHR, settings){
	if(settings.method == 'post') return false;
	if(settings.url.indexOf("cam_capture_") != -1) return false;
	if(settings.url.indexOf("/user/calendar/") != -1) return false;
	if(settings.url.indexOf("/WareBridge/login") != -1) return false;
	if(settings.url.indexOf("user/alram") != -1)  return false;
	if(settings.url.indexOf("/user/repository") != -1) {
		if(settings.url.indexOf("/user/repository/") != -1) {
			urlArray = settings.url.split('/');
			settings.url =settings.url.replace(`/${urlArray[urlArray.length-1]}`,"");
		} else {
			settings.url = settings.url.split('?')[0];
		}
	}
	if(settings.url.indexOf('/user/book/') != -1){
		settings.url = '/WareBridge/user/book/bookSub'
	}
	
	if(popCheck == 'pop') return false;
	if(jqXHR.state()=='rejected') return false;
	history.pushState({
	}, '',
	settings.url);
});



window.addEventListener('popstate', function(event){
	let url = new URL(event.target.location).href;
	
	let sidemenu = $("aside .menu-link");
	let whichAjax = "";
	for(menu of sidemenu){
		if(menu.href == url || url.includes('mypage')){
			whichAjax = "bodyAjax"
			break;
		} else {
			whichAjax = "innerBodyAjax"
		}
	}
	window[whichAjax](url,"pop");
	return false;
});

//=======================script정리===============================

function removeScript(){
	let scripts = $('script');
	
	let scriptList = [
		`${cPath}/resources/myJS/subMenu.js`,
		`${cPath}/resources/myJS/pjh/myCalendar.js`,
		`${cPath}/resources/myJS/rentalCalendar.js`,
		`${cPath}/resources/myJS/kch/menuCalendar.js`,
		`${cPath}/resources/myJS/sendMailScript.js`,
		`${cPath}/resources/myJS/eb/personnelSystem.js`, //deptTree이름바꿈
		`${cPath}/resources/myJS/eb/departmentSystem.js`,
		`${cPath}/resources/myJS/eb/pblcadbk.js`,
		`${cPath}/resources/myJS/eb/newDoc.js`,
		`${cPath}/resources/myJS/eb/prsnladbk.js`,
		`${cPath}/resources/myJS/eb/eworks.js`,
		`${cPath}/resources/myJS/pjh/capture.js`
//		departmentSystem
	]
	
	for(script of scripts){
		for(url of scriptList){
			if(script.src.includes(url)){
				script.remove();				
			}
		}
	}
}

window.onload = function(){
	let location = window.location.href;
	if(location == 'http://localhost/WareBridge/') return false;
/*	if(location == 'http://localhost/WareBridge/admin/home') return false;
	if(location == 'http://localhost/WareBridge/user/home') return false;
	
	if(location.includes('http://localhost/WareBridge/login')) return false;*/
	if(location.includes('/WareBridge/admin/home')) return false;
	if(location.includes('/WareBridge/user/home')) return false;
	
	if(location.includes('/WareBridge/login')) return false;
	if(location.includes('/user/book/roomCalendar/')) return false;
	if(location.includes('/user/repository/')) return false;
		
/*	if(location.includes('user/repository/')){
		let locationArray = location.split("/");
		let result = "";
		for(let i=0; i<locationArray.length-1;i++){
			if(i == locationArray.length-1){
				continue;
			} else {
				result += locationArray[i]+"/";
			}
		}
		location = result;
	}*/
	/*innerBodyAjax(location);*/
	setTimeout(() => innerBodyAjax(location), 200);
}