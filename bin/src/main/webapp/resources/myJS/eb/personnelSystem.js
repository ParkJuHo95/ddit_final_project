/**
 * 
 */
//Grid Options: Contains all of the grid configurations
var gridOptions = null;
	gridOptions = gridOptions ?? {
		defaultColDef: {
	        sortable: false,
			maxWidth: 130,
	    },
	    getRowId : (params) => params.data.prsCode,
		columnDefs : [
		    { field: "prsCode", sortable: true, pinned: "left", cellClass:"text-center", headerName:"직위코드" },
		    { field: "prsName", headerName:"직위"  }
		],
		onRowDoubleClicked: onRowDoubleClicked
	};
	
var jobrankGridElement = document.querySelector('#jobrankGrid');
var gridApi = agGrid.createGrid(jobrankGridElement, gridOptions);
function loadA(){
	fetch(`${cPath}/admin/organization/personnelSystem/jobrankList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=>resp.json())
		.then(json=> gridApi.setGridOption("rowData", json));
}
	loadA();
		
function onRowDoubleClicked(event) {
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
            console.log(json);
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
	    console.log(formId);
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
        .then(resp=>resp.json())
        .then(json=> {
			console.log("응답결과 : ",json);
			renewForm(formId);
			loadA();
			loadB();
			alert(`${json}`);
        });
	});
	
	function renewForm(formId) {
		var btnSpace = (formId === 'psa') ? $("#btnSpaceA") : $("#btnSpaceB");
		$(`#${formId}`)[0].reset();
		$(`#${formId}`).find("#prsCode").prop('readOnly', false);
		btnSpace.html(`<button type="submit" value="create" class="btn btn-primary btn-personnelsystem" data-form-id="${formId}">등록</button>`);
	}
	
	$(document).on('click',".createBtn",function(event){
		var formId =  $(event.target).data('formId');
		console.log(formId);
		renewForm(formId);
	});
	
	var gridOptionsB = null;
		gridOptionsB = gridOptionsB ?? {
			defaultColDef: {
		        sortable: false,
				maxWidth: 130,
		    },
		    getRowId : (params) => params.data.prsCode,
			
			columnDefs : [
			    { field: "prsCode", sortable: true, pinned: "left", cellClass:"text-center", headerName:"직책코드" },
			    { field: "prsName", headerName:"직책"  },
			],
			onRowDoubleClicked: onRowDoubleClicked
		};
		

	// 직책 그리드 생성
	var jobPositionGridElement = document.querySelector('#jobpositionGrid');
	var jobPositionGridApi = agGrid.createGrid(jobPositionGridElement, gridOptionsB);
	
	
	function loadB() {
	 fetch(`${cPath}/admin/organization/personnelSystem/jobpositionList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=>resp.json())
		.then(json=>jobPositionGridApi.setGridOption("rowData", json));
	}
	
	loadB();


