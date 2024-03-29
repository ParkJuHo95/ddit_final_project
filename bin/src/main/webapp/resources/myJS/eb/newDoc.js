ClassicEditor
	.create( document.querySelector( '#ckeditor-editor' ), {
        htmlSupport: {
            allow: [
                {
                    name: /.*/,
                    attributes: true,
                    classes: true,
                    styles: true
                }
            ]
        }
//		, htmlEmbed: {
//                    showPreviews: true
//        }
		
    } )
	.then(editor => {
            // 에디터에서 내용이 변경될 때마다 textarea의 값을 업데이트함
            editor.model.document.on('change:data', () => {
                document.querySelector('#ckeditor-editor').value = editor.getData();
            });
        })
	.catch( error => {
	    console.error( error );
} );

//결재선 설정 모달 내에 fancytree 적용
$("#lineSelectTree").fancytree({
    extensions: ["glyph"],
    glyph: {
        preset: "awesome5",
        map: {
            folder: "fa-solid fa-building", // 폴더 아이콘을 fa-building으로 변경
            folderOpen: "fa-solid fa-building-circle-arrow-right", 
			employee: "fa-solid fa-user"
        }
    },
    selectMode: 1,
	// Fancytree가 처음 로드될 때 모든 노드를 확장
    init: function(event, data) {
        data.tree.visit(function(node) {
	        if (node.getLevel() <= 2) { // 두 번째 레벨까지만 확장
	            node.setExpanded(true);
	        }
	    });
    },
	//더블클릭 말고 1회 클릭 시 폴더가 토글되도록 변경함
	click: function(event, data) {
        if (data.node.isFolder()) {
            data.node.toggleExpanded();
        }else{
			addSnctLine(event, data);
		}
    },
	// employee 클래스를 가진 노드에 대해 아이콘 적용
    renderNode: function(event, data) {
        var node = data.node;
        if (node.isFolder() && node.hasClass("employee")) {
            var span = $("span.fancytree-icon", node.span);
            span.removeClass("fancytree-icon").addClass("fa fa-fw fa-user");
        }
    }
});

var appendContainer = $("#hiddenInfo")//$("#snctline\\.slId").parent();
var appendTable = $("#snctlineTableBody");
var cnt = 1;
function addSnctLine(event, data) {
    // 데이터 확인
    console.log("data:", data);
    console.log("appendContainer:", appendContainer);
	var innerdata = data.node.data;
	//	data.node.data.empJobposition / empName / empNo / dptName / data.node.key
	tagHTML = `<input type="hidden" id='snctline.snctdetails[${cnt-1}].sdtEmpNo' name='snctline.snctdetails[${cnt-1}].sdtEmpNo' value=${innerdata.empNo} />
            <input type="hidden" id='snctline.snctdetails[${cnt-1}].sdtOrder' name='snctline.snctdetails[${cnt-1}].sdtOrder' value=${cnt} />`
	tableHTML = `<tr><td>${innerdata.dptName}</td><td>${innerdata.empJobposition}</td><td>${innerdata.empName}</td><td>${cnt}</td><td><button type="button" class="btn">
				<span class="badge bg-label-warning me-1 deleteLineDetail">삭제</span></button></td></tr>`
	appendContainer.append(tagHTML);
	appendTable.append(tableHTML);
	cnt +=1;
}
	


function trialSet(objectId){
	var object = $(`${objectId}`);
	var trialData = object.data('trialSet');
	console.log(trialData);
	object.val(trialData);
}


$(document).on('click', '.trial', function(event){
	console.log('시연데이터 버튼 클릭')
	trialSet('#sdcTitle');
	trialCkeditor('#ckeditor-editor');
});


function trialCkeditor(objectId) {
   ClassicEditor.create(document.querySelector(objectId))
        .then(editor => {
            var trialData = $(objectId).data('trial-set');
            console.log(trialData);
			editor.setData('');
            editor.setData(trialData); // CKEditor 내용 설정
        })
        .catch(error => {
            console.error(error);
        });
}
