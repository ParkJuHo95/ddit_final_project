//일괄등록 엑셀파일 전송용 & 받아온 결과데이터 랜더링
function bulkEmployee(event) {
	let resultDetail = document.getElementById("resultDetail");
 	event.preventDefault();
//	console.log("엑셀용")
 	let form = event.target;
 	let formData = new FormData(form);
	let uploadedFile = formData.get("excelFile")
	
	if(uploadedFile.size == 0){
		toastr.warning("선택된 파일이 없습니다!");
		return false;
	}
	let extension = uploadedFile.name.split(".")[1]
	console.log("확장자 : ", extension)
	if(extension != "xls" && extension != "xlsx"){
		toastr.warning("엑셀파일(xls, xlsx)만 업로드해주세요.")
		return false;
	} 
	
	console.log("formData: ", formData.get("excelFile"))
 	$.ajax({
 		url:form.action,
 		type:form.method,
 		data: formData,
	 	processData: false, 
        contentType: false, 
 		dataType: 'json',
 		success:function(resultMap){
//			console.log("resp : ",resp)
			
			let detailContent = `
			    <div class="card shadow-none bg-transparent border border-secondary mb-3">
			        <div class="card-body">
			            <span>파일에서 확인한</span> <span class="alert-dark"> 총 ${resultMap.totalCnt}건</span> 중 
			            <span class="alert-success ">정상 ${resultMap.successCnt}개,</span> &nbsp;&nbsp;&nbsp;<span class="alert-danger">오류 ${resultMap.failCnt}개</span> 입니다.
			`;
			
			if (resultMap.errorRows && resultMap.errorRows.length > 0) {
			    detailContent += `
			        <br><br> 해당 엑셀 시트 <span class="alert-danger">${resultMap.errorRows}번째 행</span>에서 오류를 발견했습니다.
			    `;
			}
			
			detailContent += `
			        </div>
			    </div>
			`;
			
			resultDetail.innerHTML = detailContent;

 		}
 	});
}

//사원 상세뷰
$(document).on('click',".empView", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	console.log("this: ",this)
	let who = $(this).data('empNo');
	var url = `${cPath}/admin/organization/employeeInfo?who=${who}`; 
	innerBodyAjax(url)
})

//사원정보 수정 - 폼 제출
$(document).on('click',".empSubmit", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
	let who = $(this).data('empNo');
	var url = `${cPath}/admin/organization/employeeInfo?who=${who}`;
	let form = document.getElementById("employeeForm");
	console.log("form : ", form)
 	let formData = new FormData(form);
	console.log("폼데이터", formData)
	$.ajax({
		type : form.method,
		url : url,
		data : formData,
		dataType : 'html',
		processData:false,
		contentType:false,
		success : function(resp) {
			console.log("respppppp: ", resp)
			if(resp){
				toastr.success("성공적으로 수정되었습니다.");
			} else {
				toastr.warning("다시 시도해주세요.")
			}
		},    
		error : function(error) { 
			toastr.warning("처리실패. 다시 시도해주세요");
		}
	})
})

$(document).on('click',"#insertEmpData", function(){
//	alert("안녕")
	$("#insertEmpName").val("김가진")
	$("#insertEmpNo").val("2024-00401")
	$("#insertEmpDptId1").val("SUP-D01-02")
	$("#insertEmpJobposition").val("사원")
	$("#insertEmpMail").val("2024-00401@dreaminfosystem.co.kr")
	$("#insertEmpMobile").val("010-0204-1501")
	$("#insertEmpCmptelno").val("042-220-4580")
});

//사원 등록
$(document).on('click',"#myModal", function (event) {
    event.preventDefault(); // 기본 링크 동작 방지
//	let who = document.getElementById("empNo").value;
	let redirectionUrl = `${cPath}/admin/organization/employeeList`
	let form = document.getElementById("regiEmpForm");
	console.log("form : ", form)
 	let formData = new FormData(form);
	console.log("폼데이터", formData)
	$.ajax({
		type : form.method,
		url:`${cPath}/admin/organization/regiEmployee`,
		data : formData,
		dataType : 'json',
		processData:false,
		contentType:false,
		success : function(resp) {
			console.log("Regi : ", resp)
			if(resp === "OK"){
				toastr.success("사원 계정 등록에 성공했습니다!")
				$('#cancelRegi').click();
				innerBodyAjax(redirectionUrl)
			}else{
				toastr.warning("등록에 실패했습니다.")
			}
		},    
		error : function() { 
			toastr.warning("서버오류. 다시 시도해주세요");
		}
	})
})