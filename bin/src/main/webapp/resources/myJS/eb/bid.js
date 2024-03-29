/**
 * 
 */
$(document).on('click',".bid-link",function(event){
 	event.preventDefault();
	var title = $(this).text();
	var url = $(this).attr('data-url');
    var bidno = $(this).attr('data-bidno');

	//팝업창 설정
    var options = "width=1000, height=700, resizable=yes, status=no, scrollbar=yes";
    // 새 창으로 링크 열기
    window.open(url, title, options);

    // 다른 컨트롤러로 요청 보내기
    fetch(`${cPath}/user/bid/hstry`, {
        method: 'POST', // 또는 GET, PUT, DELETE 등 필요에 따라 변경
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ 
                "bhBiBidno": bidno,
                "bhCmpId": 'dreaminfosystem',
                "bhEmpNo": '2021-00001'
        	})
    }).then(response => {
		console.log("bid.js에서 받은 resp : ", response);
    }).catch(error => {
        console.error('Error:', error);
    });
});

