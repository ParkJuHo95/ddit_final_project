
var video = document.getElementById('video');
var canvas = document.createElement('canvas');
var context = canvas.getContext('2d');
var formData = new FormData();

var imgIndex = 1;

function captureImgs() {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    context.drawImage(video, 0, 0, canvas.width, canvas.height);
    canvas.toBlob(function(blob) {
		formData.append(`file${imgIndex}`, blob, `image${imgIndex}.jpg`);
	}, 'image/jpeg', 0.9);
}

function captureImgSend(empNo) {
	formData.append('empNo', empNo)
/*	for(key of formData.keys()){
		console.log(key);
	}*/
	$.ajax({
//		url: "http://127.0.0.1:5000/cam_capture_upload.ajax",
		url: "http://192.168.141.18:5000/cam_capture_upload.ajax",
		processData: false,
		contentType: false,
		data: formData,
		type: "POST",
		success: function(response) {
			toastr.success("업로드 완료!")
		}
	});
}
$(document).off('mousedown','.longClickSample');
$(document).on('mousedown','.longClickSample',function(){
    var interval = setInterval(function () {
        if(imgIndex <= 50){
			captureImgs();
			console.log(imgIndex)
			$('.longClickSample')[0].value = `사진(${imgIndex++})`
		} else {
			$('.longClickSample')[0].value = `업로드 클릭!`
		}
    }, 100);

    $(document).on('mouseup', function () {
        clearInterval(interval);
    });
})

navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
	video.srcObject = stream;
	video.play();
}).catch(function(error) {
	console.error(error);
});
