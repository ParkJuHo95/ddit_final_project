/**
 * 
 */
//Grid Options: Contains all of the grid configurations
var gridOptions = {
		defaultColDef: {
			maxWidth: 150
	    },
	    getRowId : (params) => params.data.pabNo,
		pagination: true,
		includeHiddenColumnsInQuickFilter: true,
		columnDefs : [
			{ field: "pabNo", hide:true},
		    { field: "pabName", sortable: true, pinned: "left",  headerName:"이름", sort: "asc"},
			{ field: "pabMail", 		headerName:"이메일" },
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
var prsnladbkgridApi = agGrid.createGrid(prsnladbkElement, gridOptions);


function loadGrid(){
	fetch(`${cPath}/user/address/prsnl/prsnladbkList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=>resp.json())
		.then(json=> prsnladbkgridApi.setGridOption("rowData", json));
}
loadGrid();
		
function onFilterTextBoxChanged() {
	prsnladbkgridApi.setGridOption(
	    'quickFilterText',
	    document.getElementById('filter-text-box').value
	);
}

