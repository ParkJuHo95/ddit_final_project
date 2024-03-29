/**
 * 
 */
//Grid Options: Contains all of the grid configurations
var gridOptionsPrsnlAdbk = {
		defaultColDef: {
			maxWidth: 150
	    },
	    getRowId : (params) => params.data.pabNo,
		pagination: true,
		includeHiddenColumnsInQuickFilter: true,
		columnDefs : [
			{ field: "pabNo", hide:true},
		    { field: "pabName", sortable: true, pinned: "left",  headerName:"이름", sort: "asc"},
			{ field: "pabMail", 		headerName:"이메일", onCellDoubleClicked: sendPrsnlMail },
		    { field: "pabMobile", 		headerName:"직책" },
		    { field: "pabGroup", 	sortable: true, 	headerName:"주소록 그룹" },
		    { field: "pabCompany", 	sortable: true, 	headerName:"회사" },
		    { field: "pabDptmnt", 	sortable: true, 	headerName:"부서" },
		    { field: "pabPosition", 		headerName:"직책" },
		    { field: "pabTask", 		headerName:"담당 업무" },
		    { field: "pabCmptel", 		headerName:"회사 전화" },
		    { field: "pabCmpaddr", 		headerName:"회사 주소" },
		    { field: "pabBirthday", 		headerName:"생일" },
		    { field: "pabHometel", 		headerName:"집전화" },
		    { field: "pabCmpfax", 		headerName:"회사 팩스" },
		    { field: "pabRemark", 		headerName:"메모" }
		]
	};
	
var prsnladbkElement = document.querySelector('#prsnladbkGrid');
var prsnladbkgridApi = agGrid.createGrid(prsnladbkElement, gridOptionsPrsnlAdbk);


function loadGridPrsnlAdbk(){
	fetch(`${cPath}/user/address/prsnl/prsnladbkList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=>resp.json())
		.then(json=> prsnladbkgridApi.setGridOption("rowData", json));
}
loadGridPrsnlAdbk();
		
function onFilterTextBoxChanged() {
	prsnladbkgridApi.setGridOption(
	    'quickFilterText',
	    document.getElementById('filter-text-box').value
	);
}

function sendPrsnlMail(params){
//    console.log('메일 열의 셀이 더블클릭되었습니다:', params);
	var mailGetter = params.data.pabMail;
	bodyAjax(`${cPath}/user/mail/sendMail?mailGetter=${mailGetter}`);
}

