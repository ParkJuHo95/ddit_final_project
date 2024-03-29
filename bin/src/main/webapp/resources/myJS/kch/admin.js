//초기비밀번호 변경폼
$(document).on("click", ".initPwSubmit", function(event){
	alert("변경")
	event.preventDefault();
	let form = document.getElementById("initPwForm");
	let formData = new FormData(form);
	let url = `${cPath}/admin/security/initPw`
	$.ajax({
		url:url,
		type:"POST",
		data:formData,
		processData: false,
		contentType: false,
		dataType:"json",
		success: function(resp){
			if(resp == 1){
				toastr.success("초기 비밀번호 설정 완료!")
				innerBodyAjax(url);
			}else{
				toastr.warning("실패, 다시 시도해주세요!")
			}
		}
	});
});

