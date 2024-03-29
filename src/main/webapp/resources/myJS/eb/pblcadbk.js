/**
 * 
 */
//Grid Options: Contains all of the grid configurations
var gridOptions = {
		defaultColDef: {
			minWidth: 100,
			maxWidth: 250
	    },
	    getRowId : (params) => params.data.empNo,
		pagination: true,
		includeHiddenColumnsInQuickFilter: true,
		columnDefs : [
			{ field: "empNo", hide:true},
		    { field: "empName", sortable: true, pinned: "left",  headerName:"이름", sort: "asc", onCellDoubleClicked: startChat},
		    { field: "empDptId1", hide:true },
			{ field: "department.dptName", headerName:"소속부서", unSortIcon: true
	    	 , comparator: (valueA, valueB, nodeA, nodeB, isDescending) => {
		    	  let dptA = nodeA.data;
		    	  let dptB = nodeB.data;
		    	  return dptA.empDptId1.localeCompare(dptB.empDptId1);	
	    	 }
	    	},
		    { field: "empJobposition", sortable: true, headerName:"직책" },
		    { field: "empMail", headerName:"이메일",  onCellDoubleClicked: sendMail},
		    { field: "empCmptelno", headerName:"내선번호"  }
		]
	};
	
var pblcadbkElement = document.querySelector('#pblcadbkGrid');
var pblcadbkgridApi = agGrid.createGrid(pblcadbkElement, gridOptions);


function loadPblcadbkGrid(){
	fetch(`${cPath}/user/address/adbkList`, {method:"get", headers:{"accept":"application/json"}})
		.then(resp=>resp.json())
		.then(json=> pblcadbkgridApi.setGridOption("rowData", json));
}
loadPblcadbkGrid();

		
function onFilterTextBoxChanged() {
	pblcadbkgridApi.setGridOption(
	    'quickFilterText',
	    document.getElementById('filter-text-box').value
	);
}

function sendMail(params){
//    console.log('메일 열의 셀이 더블클릭되었습니다:', params);
	var mailGetter = params.data.empMail;
	bodyAjax(`${cPath}/user/mail/sendMail?mailGetter=${mailGetter}`);
}

function startChat(params){
	console.log('이름 열의 셀이 더블클릭되었습니다:', params);
	var empNo = params.data.empNo;
	console.log("클릭한 사람의 사번 :" , empNo," 채팅 연결 예정",);
}