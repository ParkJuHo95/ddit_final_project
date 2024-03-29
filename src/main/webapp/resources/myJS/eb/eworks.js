var docId;

$("#docClsfcTree").fancytree({
    extensions : [ "glyph" ],
    glyph : {
        preset : "awesome5",
        map : {
            folder : "fa-solid fa-folder", 
            folderOpen : "fa-solid fa-folder-open", 
            doc : "fa-solid fa-document" 
        }
    },
    selectMode : 1,
	// Fancytree가 처음 로드될 때 모든 노드를 확장
    init: function(event, data) {
        data.tree.visit(function(node) {
            node.setExpanded(true);
        });
    },
	//더블클릭 말고 1회 클릭 시
	click: function(event, data) {
		//폴더인 경우 폴더가 열고 닫히도록
        if (data.node.isFolder()) {
            data.node.toggleExpanded();
		//파일인 경우 id를 docId에 저장
        } else {
            docId = data.node.key;
		//console.log("선택된 문서의 ID:", docId);
        }
    }
});

var newDocBtn = document.querySelector('.newDoc');

newDocBtn.addEventListener("click", function(){
	// 선택된 li의 ID 가져오기 SF_ID(snctFormId, ex.dreaminfosystem01PRS001)
	//	console.log("선택된 요소의 id", docId);
	//요청보내기
	event.preventDefault(); // 기본 동작 방지
	let url = `${cPath}/user/eworks/newDoc/${docId}`;
	innerBodyAjax(url)
});


