
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
            // 에디터에서 내용이 변경될 때마다 textarea의 값을 업데이트함
            editor.model.document.on('change:data', () => {
                document.querySelector('#cbContent').value = editor.getData();
            });
        })
	.catch( error => {
	    console.error( error );
} );