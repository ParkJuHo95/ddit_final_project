/**
 * 
 */
var btnSpace = $("#btnSpace");
var form = $("#dpt");

//$("#deptTree").fancytree("destroy");
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
    dblclick: dptSystemDblclick,
	noData: "부서를 설정해 주세요"
});
