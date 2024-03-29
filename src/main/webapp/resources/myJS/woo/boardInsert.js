var boardEditor;
// ckEditor 적용
ClassicEditor
	.create( document.querySelector( '#cbContent' ), {
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
		boardEditor = editor;
            // 에디터에서 내용이 변경될 때마다 textarea의 값을 업데이트함
            editor.model.document.on('change:data', () => {
                document.querySelector('#cbContent').value = editor.getData();
            });
        })
	.catch( error => {
	    console.error( error );
} );

ClassicEditor
	.create( document.querySelector( '#tbContent' ), {
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
		boardEditor = editor;
            // 에디터에서 내용이 변경될 때마다 textarea의 값을 업데이트함
            editor.model.document.on('change:data', () => {
                document.querySelector('#tbContent').value = editor.getData();
            });
        })
	.catch( error => {
	    console.error( error );
} );


function updateEditorContent(editor, newContent) {
    editor.setData(newContent);
}





$(document).on('click',"#insertBoardData", function(){
	$("input[name='cbName']").val("제목이란가");
    updateEditorContent(boardEditor, `<p>
    &nbsp;
</p>
<p>
    형식 맞춰서 넣음
</p>`);
});