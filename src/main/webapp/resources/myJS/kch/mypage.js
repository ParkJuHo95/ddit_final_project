//mypage.jsp 마이페이지 변경 폼
function submitForm(event) {
 	event.preventDefault();
 	let form = event.target;
 	let formData = new FormData(form);
 	$.ajax({
 		url:form.action,
 		type:form.method,
 		data: formData,
	 	processData: false, 
        contentType: false, 
 		dataType: 'json',
 		success:function(resp){
			if(resp == "success"){
				toastr.success("정상적으로 처리되었습니다.");
				innerBodyAjax("/WareBridge/user/mypage/myInfo");
			} else {
				toastr.warning("등록 실패")
			}
 		}
 	});
}



//마이페이지 프로필 이미지  - 미리보기
function profileImg() {
	// 첨부 input 변수 가져오기
	let addfile = document.querySelector(".profileFile");
	// 첨부된 이미지 요소
	let imgPath = document.querySelector(".uploadedAvatar");
	
	 addfile.addEventListener("change", (event) => {
        let thisTarget = event.target;

        // 파일이 선택되지 않은 경우 종료
        if (!thisTarget.files || !thisTarget.files[0]) {
            alert("선택된 파일이 없습니다.");
            return;
        }

        let fileType = thisTarget.files[0].type;

        // 마임 타입이 이미지가 아니면 종료
        if (!fileType.match(/image\//)) {
            alert("지원하지 않는 확장자 입니다.");
            return;
        }
	
		// 파일 리더 생성
		let reader = new FileReader();
	
		// 파일을 읽었을 때의 이벤트 처리
		reader.onload = function() {
			// 이미지 경로 설정
			imgPath.src = reader.result;
		};
	
		// 파일을 읽기 시작
		reader.readAsDataURL(thisTarget.files[0]);
		//미리보기 로직 종료.
		
		
	});
}


//마이페이지 - 오늘 먹은 메뉴 추가
function addDietList(event) {
 	event.preventDefault();
	let form = document.getElementById("insertMenuForm")
 	var selectedValue = document.getElementById("mId").value;
//	console.log(selectedValue)
	var formData = new FormData();
    formData.append('mId', selectedValue);
	
 	$.ajax({
 		url:form.action,
 		type:form.method,
 		data: formData,
        processData: false,
        contentType: false,
        dataType: 'text',
        success: function (resp) {
            console.log("메뉴추가resp",resp);
			if (resp === 'OK') {
				calendar?.refetchEvents() //이벤트 데이터를 다시 불러와 캘린더를 다시 렌더링하는 역할. 현재 캘린더의 이벤트 데이터를 새로고침하는 데 사용됨
			}

        }
 	});
}


//마이페이지 - 현재비밀번호 일치 여부 확인
let chk1 = false, chk2 = false, chk3 = false; // 입력값 중 하나라도 만족하지 못한다면 회원 가입 처리를 막기 위한 논리형 변수 선언 
$(document).on("keyup",".myPassCheck",function(){
	var currentPwVal = $("#currentPw").val();

	if (currentPwVal === ''){
		$("#currentPwMsg").text("현재 비밀번호를 입력해주세요.").css("color", "red");
		chk1 = false;
	}else{
		$.ajax({
			type:"POST"
			,url:`${cPath}/user/mypage/changePw`
			,data: JSON.stringify({ currentPwVal: currentPwVal})
			,dataType: "json"
			,contentType: "application/json"
			,success:function(resp){
				if (resp["resultMsg"].includes("불")) {
		            $("#currentPwMsg").text("비밀번호 불일치").css("color", "red");
					chk1 = false;
	        	} else {
		            $("#currentPwMsg").text("비밀번호 일치").css("color", "green");
					chk1 = true;
		        }
			}
		});
	}
});


//마이페이지 - 비밀번호 변경 전송
function submitPw(event){
	let newPw = $("#newPw").val();
	let empPass = $("#empPass").val();
//	console.log("새 비번 : ", empPass)
    event.preventDefault();

	if(chk1 === false && chk2 === false && chk3 ===false){
		toastr.error("정상적인 흐름이 아닙니다!!")
		return false;
	}else{
		if (chk1 === false) {
        	$("#currentPw").focus();
        	$("#currentPwMsg").text("현재 비밀번호를 입력해주세요.").css("color", "red");
	    }
		if(empPass === ''){
			$("#empPassMsg").text("새 비밀번호 확인은 필수입니다.").css("color", "red");
		}else if(newPw !== empPass){
			$("#empPassMsg").text("새 비밀번호가 일치하지 않습니다.").css("color", "red")
		}else{
			chk1=true, chk2 = true, chk3 = true;
			$('#empChangePw').modal('hide');
			$.ajax({
				type:"POST"
				,url:`${cPath}/user/mypage/changePw/update`
				,data: JSON.stringify({ empPass: empPass})
				,dataType: "text"
				,headers: {
					"Content-Type": "application/json"
				}
				,success:function(resp){
					console.log("resp : ", resp)
					if (resp==='OK') {
					alert("정상적으로 변경되었습니다. 로그인페이지로 이동됩니다.")
					$("#btnLogout").click();
		        	}
				}
			});
		}
	}
	
};


$(document).on('click','.heeCancel',function(){
	console.log("this : ", this)
	history.back();
})