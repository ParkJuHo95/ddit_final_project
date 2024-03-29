/**
 * 
 */
var btnSpace = $("#btnSpace");
var form = $("#dpt");
$("#deptTree").fancytree({
    extensions: ["glyph"],
    glyph: {
        preset: "awesome5",
        map: {
            folder: "fa-solid fa-building", // 폴더 아이콘을 fa-building으로 변경
            folderOpen: "fa-solid fa-building-circle-arrow-right", 
            doc: "fa-solid fa-tablet" // 파일 아이콘을 fa-file-alt로 변경
        }
    },
	init : function(event, data){
		data.tree.visit(function(node){
			node.setExpanded(true);
		});
	},
    selectMode: 1,
	//더블클릭 말고 1회 클릭 시 폴더가 토글되도록 변경함
	click: function(event, data) {
	        if (data.node.isFolder()) {
	            data.node.toggleExpanded();
	        }
	    },
    // 더블클릭 시 action >> 해당 부서의 상세정보 가져오기
    dblclick: dblclick,
	noData: "부서를 설정해 주세요"
});

// if (!data.node.folder) {
//            location.href = `${cPath }/prod/prodView.do?what=" + data.node.key`;
//        }
//        return data.node.folder;

function dblclick(event, data) {
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
		renewForm(form[0]);
		toastr.success(`${json}`);
//		bodyAjax(`${cPath}/admin/organization`);
	}).catch(err=>{
		console.error(err);
		toastr.warning(err);
	});
});

function renewForm() {
	form.find("#dptParentdptid option").show();
	form[0].reset();
	form.find("#dptId").prop('readOnly', false);
	btnSpace.html(`<button type="submit" value="create" class="btn btn-primary" data-form-id="dpt">등록</button>`);
}

$(document).on('click',".createBtn",function(event){
	renewForm();
});