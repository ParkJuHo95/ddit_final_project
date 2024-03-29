$(document).off('click','a.intoFile');  
$(document).on('click','a.intoFile',function(event){
	event.preventDefault();
	if($(this).data('fileLocation') != 'back'){
		let classList = this.previousElementSibling.classList;
		if(!classList.contains('bxs-folder')){
			return;
		}
	}
	let path = $(this).data("fileLocation");
	let url = `/WareBridge/user/repository/${path}`;
	innerBodyAjax(url);
})

$(document).off('click','.fileCheck');  
$(document).on('click','.fileCheck',function(event){
	event.preventDefault();
	$(this).parent().prev()[0].firstChild.click();
})

function selectAll(select) {
	const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
	checkboxes.forEach(checkbox => {
		checkbox.checked = select.checked;
	});
}


$(document).off('click','a.summaryIcon');  
$(document).on('click','a.summaryIcon',function(event){
	event.preventDefault();
	let fileName = $(this).data('fileName')
	let fileExtension = $(this).data('fileExtension')
	let url = `${cPath}/user/repository/summerize`;
	let data = `${fileName}.${fileExtension}`;
	var sumDiv = document.querySelector(`[id="${fileName}SumDiv"]`);
	
	fetch(url, {
		method : "post",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "text/plain"
		},
		body : data
	}).then((resp) => {
	    if(resp.ok){
			return resp.json(); //Response 객체의 json() 메서드를 사용하여 JSON 파싱
		} else {
			throw new Error(`HTTP 요청이 실패했습니다. 상태 코드: ${resp.status}`);
		}
	}).then(jsonObj => {
		var pTag = sumDiv.querySelector('p');
		pTag.textContent = '';
		let summaryData = JSON.parse(jsonObj.summary); // JSON 파싱
        let content = summaryData.choices[0].message.content;
		console.log("요약내용 : ", content);
		pTag.innerHTML = content;
	}).catch(err => {
		console.error(err);
		toastr.warning(err.message);
	});
});


function selectAll(select) {
	const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
	checkboxes.forEach(checkbox => {
		checkbox.checked = select.checked;
	});
}

$(document).off('submit','#modalFolder');  
$(document).on('submit','#modalFolder',function(event){
	event.preventDefault();
	let data = {};
	let formData = new FormData(this);
	for(let key of formData.keys()){
		data[key] = formData.get(key)
	};
	data.name
	let folders = $('input[data-real-file-name]');
	for(folder of folders){
		let folderName = $(folder).data("realFileName")
		if(folderName.split(".")[0] == data.name){
			toastr.warning("중복된 폴더명이 존재합니다.");
			return;
		}
	}
	let method = this.method;
//	let uri = '/WareBridge/user/repository'
	url = `/WareBridge/user/repository/makeFolder`;
	let redirectLocation = "/WareBridge/user/repository";
	crudAjax(method,url,data,redirectLocation);
})

function selectFile(){
	$('#hiddenFileSelect')[0].click();
}

$(document).off('change','#hiddenFileSelect');  
$(document).on('change','#hiddenFileSelect',function(){
	let parent = this.parentElement;
	parent.requestSubmit();
})

$(document).off('submit','#modalFile');  
$(document).on('submit','#modalFile',function(event){
	event.preventDefault();
	let url = '/WareBridge/user/repository/fileUp'
	let formData = new FormData(this);
	let files = $('input[data-real-file-name]');
	for(let key of formData.keys()){
		for(file of files){
			let fileName = $(file).data("realFileName")
			if(fileName == formData.get(key).name){
				toastr.warning("파일명이 중복된 파일이 존재합니다. 다시 시도해주세요.");
				return;
			}
		}
	};
	let location = '/WareBridge/user/repository';
	fileAjax(url,formData,location);
})

$(document).off('click','#FTPFileDeleteBTN');  
$(document).on('click','#FTPFileDeleteBTN',function(){
	let boxs = $('input[data-real-file-name]:checked');
	if(boxs.length == 0 ){
		toastr.warning("선택된 파일이 존재하지 않습니다.")
		return;
	}
	
	let files = [];
	for(box of boxs){
		let fileName = $(box).data('realFileName');
		let extension = $(box.parentElement).siblings()[3];
		if(extension.textContent=="폴더"){
			fileName = fileName.split(".")[0];
		}
		files.push(fileName);
	}
	let data = {
		files : files
	}
	let url = "/WareBridge/user/repository/remove";
	let redirectLocation = "/WareBridge/user/repository"
	crudAjax('post',url,data,redirectLocation)
})

$(document).off('click',"input.downLoadBtn");
$(document).on('click',"input.downLoadBtn",function(){
	let boxs = $('input[data-real-file-name]:checked');
	if(boxs.length == 0 ){
		toastr.warning("선택된 파일이 존재하지 않습니다.")
		return;
	}
	
	let sign = true;
	
	let files = [];
	
	for(box of boxs){
		let fileName = $(box).data('realFileName');
		let extension = $(box.parentElement).siblings()[3];
		if(extension.textContent=="폴더"){
			fileName = fileName.split(".")[0];
			sign = false;
		}
		files.push(fileName);
	}
	
	if(files.length > 3) sign = false;

	let data = {
		files : files
	}
	let url = "";
	
	if(sign){
		url = "/WareBridge/user/repository/fileDown";
		fetch(url, {
			method : "post",
			headers : {
				"Accept" : "multipart/mixed",
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		}).then((resp) => {
		    if
			(resp.status == 225){
				url = "/WareBridge/user/repository/zipDown";
				postRequest(url,data);
				throw new Error("파일 크기가 50MB를 넘어 zip파일로 변한 됩니다.")
			} else if
			(resp.ok){
				return resp.formData();
			} else {
				throw new Error(`상태코드 ${resp.status}`, {cause:resp});
			}
		}).then( fd => {
			for(let key of fd.keys()){
				if(fd.get(key) instanceof File){
					var name = fd.get(key)['name']
					var link = document.createElement('a');
					var myhref = window.URL.createObjectURL(fd.get(key));
					link.href = myhref;
					link.download = name;
					link.click();
					link.remove();
					window.URL.revokeObjectURL(myhref);
				}
			}
		}).catch(err => console.error(err));
	} else {
		url = "/WareBridge/user/repository/zipDown";
		postRequest(url,data);
	}
})

function postRequest(url,data){
	$.post({
		url : url
		, xhrFields : {
			responseType : "blob"
		}
		, data : JSON.stringify(data)
		, headers : {
			"Content-Type"  : "application/json;charset=UTF-8"
		}
	}).done((resp, status, jqXHR)=>{
		let disposition = jqXHR.getResponseHeader("content-disposition");
		let filename =  parseDownloadName(disposition);
		let url = window.URL.createObjectURL(resp);
		let hiddenA = document.createElement("a");
		hiddenA.download = filename??"download.zip";
		hiddenA.href = url;
		hiddenA.click();
		hiddenA.remove();
	});
}

function fileAjax(url,data,redirectLocation){
	$.ajax({
		type : 'post',  
		url : url, 
		contentType:false,
		processData:false,
		data : data,
		success : function(resp) {
			toastr.success("성공적으로 등록되었습니다.");
			innerBodyAjax(redirectLocation)
		},    
		error : function(request, status, error) { 
			toastr.warning("입력실패.. 다시 시도해주세요");
			console.error(error);
		},
	})
}


const parseDownloadName = (contentDispositionHeader)=>{
//		Content-Disposition 헤더 의 값
//		case1 : attachment; filename*=UTF-8''%ED%8C%8C%EC%9D%BC%20%20%EB%AA%85
//		case2 : attatchment; filename="filename"
//		case3 : attatchment; filename*=UTF-8'%ED%8C%8C%EC%9D%BC%20%20%EB%AA%85'
	const [, name1, charset2, name2, charset3, name3] = 
			contentDispositionHeader 
			&& contentDispositionHeader.match(/filename\*?=(?:(?:"(.+)")|(?:(.+)''(.+))|(?:(.+)'(.+)'))/) 
			|| [];
	return name1 
			|| (name2 && decodeURIComponent(name2, charset2))
			|| (name3 && decodeURIComponent(name3, charset3));	
}