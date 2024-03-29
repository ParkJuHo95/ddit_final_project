layoutMenuEl = document.querySelectorAll('#layout-menu');

layoutMenuEl.forEach(function (element) {
	menu = new Menu(element, {
		orientation: 'vertical',
		closeChildren: false
	});
	window.Helpers.scrollToActive((animate = false));
	window.Helpers.mainMenu = menu;
});

menuToggler = document.querySelectorAll('.layout-menu-toggle');

menuToggler.forEach(item => {
	item.addEventListener('click', event => {
		event.preventDefault();
		window.Helpers.toggleCollapsed();
	});
});


function selectAll(selectAll)  {
const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	});
}


/*$("div.inner-sub-menu").on('click',"a.menu-link",function(event){
	event.preventDefault();
	let myparent = $(this).parents("li");
	let innerCardBody = document.querySelector("#inner-card-body");
	url = this.href
	$.ajax({    
		type : 'get',           // 타입 (get, post, put 등등)    
		url : url,           // 요청할 서버url    
		dataType : 'html',
		success : function(resp) {    
			myparent.siblings().removeClass("active");
			myparent.addClass("active");
			let parser = new DOMParser();
			let newDoc = parser.parseFromString(resp, "text/html");
			let contents = newDoc.getElementById("inner-card-body");
			let preTag = contents.innerHTML;
			innerCardBody.innerHTML = preTag;
		},    
		error : function(request, status, error) { 
			console.error(error);
		},
		complete : function(){
			if(url.includes("calendar")){
				$("<script/>", {
			        src: `${cPath}/resources/lib/fullcalendar-6.1.10/dist/index.global.min.js`,
			        type: "text/javascript"
			    }).appendTo("body");
				$("<script/>", {
			        src: `${cPath}/resources/myJS/myCalendar.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			};
		}
	})
})*/

/*$("div.card-header").on('click',".btn",function(event){
	console.log(" 클릭 이벤트");
	let innerCardBody = document.querySelector("#inner-card-body");
	let uri = $(this).data('btnLocation');
	let url = `${cPath}${uri}`
	$.ajax({    
		type : 'get',           // 타입 (get, post, put 등등)    
		url : url,           // 요청할 서버url    
		dataType : 'html',
		success : function(resp) {    
			let parser = new DOMParser();
			let newDoc = parser.parseFromString(resp, "text/html");
			let contents = newDoc.getElementById("inner-card-body");
			let preTag = contents.innerHTML;
			innerCardBody.innerHTML = preTag;
		},    
		error : function(request, status, error) { 
			console.error(error);
		},
		complete : function(){
			$("<script/>", {
			        src: `${cPath}/resources/myJS/bodyMenu.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			if(url.includes("sendMail")){
				$("<script/>", {
			        src: `${cPath}/resources/myJS/sendMailScript.js`,
			        type: "text/javascript"
			    }).appendTo("body");
			};
		}
	})
})*/

/*$("div.card-body").on('click', "[data-btn-location]", function (event) {
	console.log('a');
    event.preventDefault(); // 기본 동작 방지
    let innerCardBody = document.querySelector("#inner-card-body");
    let uri = $(this).data('btnLocation');
    let url = `${cPath}${uri}`;

    $.ajax({
        type: 'get',
        url: url,
        dataType: 'html',
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
        complete: function () {
            // 이 부분은 필요에 따라 추가적인 작업을 할 수 있는 부분입니다.
            if (url.includes("sendMail")) {
                $("<script/>", {
                    src: `${cPath}/resources/myJS/sendMailScript.js`,
                    type: "text/javascript"
                }).appendTo("body");
            }
        }
    });
});*/
/*$("div.title a.boardA").on('click', function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let boardNum = $(this).data('boardNum')
	let innerCardBody = document.querySelector("#inner-card-body");
    var url = `${cPath}/user/board/detail/${boardNum}`; // JSP 파일 경로
    $.ajax({
        type: 'get',
        url: url,
        dataType: 'html',
        success: function (resp) {
            let parser = new DOMParser();
            let newDoc = parser.parseFromString(resp, "text/html");
            let contents = newDoc.getElementById("inner-card-body");
            let preTag = contents.innerHTML;
            innerCardBody.innerHTML = preTag;
        },
        error: function (request, status, error) {
            // 에러 발생 시 처리
            console.error(error);
        }
    });
});*/
