//명함인식 - Flask에 요청 & 응답받기
function cardForm(event) {
 	event.preventDefault();
 	let form = event.target;
 	let formData = new FormData(form);
 	$.ajax({
 		url:"http://192.168.141.13:5000/ai_card",
 		type:"POST",
 		data: formData,
	 	processData: false, 
        contentType: false, 
 		dataType: 'json',
 		success:function(resp){
			if(resp){
//				console.log("명함인식 결과 : ",resp)
				$("#pabName").val(resp.pabName)
				$("#pabMail").val(resp.pabMail)
				$("#pabMobile").val(resp.pabMobile)
				$("#pabDptmnt").val(resp.pabDptmnt)
				$("#pabPosition").val(resp.pabPosition)
				$("#pabCmptel").val(resp.pabCmptel)
				$("#pabCmpfax").val(resp.pabCmpfax)

			}
//			alert(resp.message)
 		}
 	});
}



//주소록 insert 요청
$(document).on("click", ".cardInsert", function(event) {
 	event.preventDefault();
	var form = $(event.target).closest('form'); // 클릭된 버튼이 속한 폼 선택
	let url = `${cPath}/user/address/prsnl/prsnlAdbk/create`;
	let redirectionUrl = `${cPath}/user/address/prsnl`;
	var formData = new FormData(form[0]);
	console.log(url);
 	$.ajax({
 		url: url,
 		type:"POST",
 		data: formData,
	 	processData: false, 
        contentType: false, 
 		dataType: 'json',
 		success:function(resp){
//			console.log("주소록 insert 결과 : ",resp)
			if(resp === "OK"){
				toastr.success("주소록 추가 성공!")
				
				innerBodyAjax(redirectionUrl)
			}else{
				toastr.warning("다시 시도해주세요.")
			}
			
//			alert(resp.message)
 		}
 	});
})
