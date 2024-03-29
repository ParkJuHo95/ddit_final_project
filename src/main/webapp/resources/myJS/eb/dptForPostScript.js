
function dptSystemDblclick(event, data) {
    // 데이터 확인
    console.log("data:", data);
	var dptId = data.node.key;
	var url = `${cPath}/admin/organization/department/${dptId}`
	
    fetch(url, {method:"get", headers:{"accept":"application/json"}})
        .then(resp=>resp.json())
        .then(json=> {
            console.log(json);
            form.find("#dptId").val(json.dptId).prop('readOnly', true);
            form.find("#dptName").val(json.dptName);
			form.find("#dptParentdptid option").show();
            var pDptValue = form.find("#dptParentdptid option." + json.dptParentdptid).val(); //class를 dptParentdptid로 가지고 있는 option의 value값 받아옴
			form.find("#dptParentdptid").val(pDptValue); //value값 이용해서 옵션 값 설정
			form.find("#dptParentdptid option[value='" + json.dptName + "']").hide();
            form.find("#dptOrder").val(json.dptOrder);
            form.find("#dptLocalext").val(json.dptLocalext);
//            form.find("#dptHead").val(json.dptHead);
            form.find("#dptOffice").val(json.dptOffice);
        });

    // 등록 버튼을 수정 버튼으로 변경
    btnSpace.html(`<button type="submit" value="modify" class="btn btn-primary dptbtn" >수정</button>
					<button type="submit" value="remove" class="btn btn-danger dptbtn" >삭제</button>`);
}
	
$(document).on('click', 'button[type="submit"].dptbtn', function(event) {
    event.preventDefault();
	var url = `${cPath}/admin/organization/department/`;
//	var form = $(this).closest('form'); // 상단에 이미 가져왔음..
	var formData = new FormData(form[0]);
	
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
			if(resp.ok){
				return resp.json();
			}else{
				throw new Error(`${resp}`);
			}
		})
    .then(json=> {
		console.log("응답결과 : ",json);
		renewDptForm(form[0]);
		toastr.success(`${json}`);
		bodyAjax(`${cPath}/admin/organization`);
	}).catch(err=>{
		console.error(err);
		toastr.warning(err);
	});
});

function renewDptForm() {
	form.find("#dptParentdptid option").show();
	form[0].reset();
	form.find("#dptId").prop('readOnly', false);
	btnSpace.html(`<button type="submit" value="create" class="btn btn-primary dptbtn" data-form-id="dpt">등록</button>`);
}

$(document).off('click',".createBtn.dptbtn");
$(document).on('click',".createBtn.dptbtn",function(event){
	renewDptForm();
});