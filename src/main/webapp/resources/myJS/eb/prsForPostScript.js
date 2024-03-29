function loadPrsA(){
	fetch(`${cPath}/admin/organization/personnelSystem/jobrankList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=> resp.json())
		.then(json=> gridApi.setGridOption("rowData", json));
}

function loadPrsB() {
 fetch(`${cPath}/admin/organization/personnelSystem/jobpositionList`, {method:"get", headers:{"accept":"application/json"}})
	.then(resp=>resp.json())
	.then(json=>jobPositionGridApi.setGridOption("rowData", json));
}

function onRowDoubleClicked_prsnl(event) {
    var rowData = event.data; // 클릭된 행의 데이터
	var url = '';
    // 데이터 확인
//    console.log("Row data:", rowData);
	var clickedForm = '';
	var btnSpace='';
	var formId = '';
    // 데이터를 가져와서 폼에 표시

    var prsCode = rowData.prsCode;
	if(rowData.prsClscd==='A'){
		url = `${cPath}/admin/organization/personnelSystem/jobrank/${prsCode}`
		formId='#psa'
		clickedForm=$(formId);
		btnSpace=$("#btnSpaceA");
	}else{
		url = `${cPath}/admin/organization/personnelSystem/jobposition/${prsCode}`
		formId='#psb'
		clickedForm=$(formId);
		btnSpace=$("#btnSpaceB");
	}
    fetch(url, {method:"get", headers:{"accept":"application/json"}})
        .then(resp=>resp.json())
        .then(json=> {
//            console.log(json);
            clickedForm.find("#prsCode").val(json.prsCode).prop('readOnly', true);
            clickedForm.find("#prsName").val(json.prsName);
            clickedForm.find("#prsEmpChangerid").val(json.prsEmpChangerid).prop('disabled', true);
            clickedForm.find("#prsChangedat").val(json.prsChangedat).prop('disabled', true);
        });

    // 등록 버튼을 수정 버튼으로 변경
    btnSpace.html(`<button type="submit" value="modify" class="btn btn-primary btn-personnelsystem" data-form-id=${formId}>수정</button>
					<button type="submit" value="remove" class="btn btn-danger btn-personnelsystem" data-form-id=${formId}>삭제</button>`);
}

$(document).on('click', 'button[type="submit"].btn-personnelsystem', function(event) {
    event.preventDefault();
	var url;
    var btnSpace;
	var form = $(event.target).closest('form'); // 클릭된 버튼이 속한 폼 선택
    var formId = form.attr('id'); // 폼의 ID 가져오기
//    console.log(formId);
	var formData = new FormData(form[0]);
	
    // 버튼의 값에 따라 url 설정
	if (formId =='psa'){
		url = `${cPath}/admin/organization/personnelSystem/jobrank/`;
		btnSpace = $("#btnSpaceA");
	}else{
		url = `${cPath}/admin/organization/personnelSystem/jobposition/`;
		btnSpace = $("#btnSpaceB");
	}
	
    var submitBtnValue = $(event.target).val();
	console.log(submitBtnValue);
    switch (submitBtnValue) {
        case 'modify':
            url += 'modify';
            break;
        case 'remove':
            url += 'remove';
            break;
        default:
            url += 'create';
            break;
    }

	console.log("=============url",url);
	fetch(url,  {
    method: "POST",
    body: formData,
    headers: {"accept": "application/json"}
	})
    .then(resp=>{
		console.log(resp);
        if (resp.ok) {
            return resp.text(); // 성공일 때는 응답 본문을 가져옴
        } else {
            throw new Error(resp.json()); // 실패일 때는 에러 메시지를 생성
        }
	})
    .then(json=> {
		console.log("응답결과 : ",json);
		renewPrsnlForm(formId);
		loadPrsA();
		loadPrsB();
		toastr.success(`${json}`);
    }).catch(err => toastr.info(`${err}`));
});

function renewPrsnlForm(formId) {
	var btnSpace = (formId === 'psa') ? $("#btnSpaceA") : $("#btnSpaceB");
	$(`#${formId}`)[0].reset();
	$(`#${formId}`).find("#prsCode").prop('readOnly', false);
	btnSpace.html(`<button type="submit" value="create" class="btn btn-primary btn-personnelsystem" data-form-id="${formId}">등록</button>`);
}


$(document).on('click',".createBtn.prsbtn",function(event){
	var formId =  $(event.target).data('formId');
	console.log(formId);
	renewPrsnlForm(formId);
});
	
