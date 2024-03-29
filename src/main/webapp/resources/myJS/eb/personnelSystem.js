/**
 * 
 */
//Grid Options: Contains all of the grid configurations
var gridOptionsA = null;
	gridOptionsA = gridOptionsA ?? {
		defaultColDef: {
	        sortable: false,
			maxWidth: 130,
	    },
	    getRowId : (params) => params.data.prsCode,
		columnDefs : [
		    { field: "prsCode", sortable: true, pinned: "left", cellClass:"text-center", headerName:"직위코드" },
		    { field: "prsName", headerName:"직위"  }
		],
		onRowDoubleClicked: onRowDoubleClicked_prsnl
	};
	
var jobrankGridElement = document.querySelector('#jobrankGrid');
var gridApi = agGrid.createGrid(jobrankGridElement, gridOptionsA);

	loadPrsA();

	
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
			onRowDoubleClicked: onRowDoubleClicked_prsnl
		};
		

	// 직책 그리드 생성
	var jobPositionGridElement = document.querySelector('#jobpositionGrid');
	var jobPositionGridApi = agGrid.createGrid(jobPositionGridElement, gridOptionsB);
	
	loadPrsB();
