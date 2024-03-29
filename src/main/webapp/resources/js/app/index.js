var orgchartBody;

document.addEventListener("DOMContentLoaded", ()=>{
	console.log(bootstrap); // 2
	
	$("[data-log-out]").on("click", (event)=>{
		 let $aTag = $(event.target);
		 let formSelector = $aTag.data("logOut");
		 $(formSelector).submit();
	});
	
	if(!document.querySelector("#treeData")){
		Swal.fire({
			icon: 'info',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
			title: '처음 접속하셨나요?',    
			text: '이동 버튼을 누르시면 조직 설정 페이지로 이동합니다.', 
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonText: '이동', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) {
			  window.location.href=`${cPath}/admin/organization/bulkDepartment`; //전체 페이지 로딩되어야함
//		      bodyAjax(`${cPath}/admin/organization/bulkDepartment`);
		   }
		});
	}
	else{
	
	$("#deptTree").fancytree({
//		source : $.getJSON({
//			url : `${cPath}/fancytree/case2/json`
//    	}),
        extensions: ["glyph"],
        glyph: {
            preset: "awesome5",
            map: {
                folder: "fa-solid fa-building", // 폴더 아이콘을 fa-building으로 변경
                folderOpen: "fa-solid fa-building-circle-arrow-right", 
                doc: "fa-solid fa-tablet" // 파일 아이콘을 fa-file-alt로 변경
            }
        },
        selectMode: 1,
		// Fancytree가 처음 로드될 때 모든 노드를 확장
		init : init,			    
	    //클릭 시 action >> 해당 부서의 상세정보 가져오기
		click: retrieveDptEmployee,
		//더블클릭 시 폴더가 토글됨 변경함
	    dblclick: function(event, data) {
		        if (data.node.isFolder()) {
		            data.node.toggleExpanded();
		        }
		    }

// if (!data.node.folder) {
//            location.href = `${cPath }/prod/prodView.do?what=" + data.node.key`;
//        }
//        return data.node.folder;


                // 더블클릭 시 action >> 해당 부서의 팀원 가져오기
//                dblclick: function(event, data) {
//                    if (!data.node.folder) {
//                        location.href = "${pageContext.request.contextPath }/prod/prodView.do?what=" + data.node.key;
//                    }
//                    return data.node.folder;
//                }
            });
}
    $('#orgModalBtn').click(function() {
      $('#orgModal').modal('show'); // 모달 보이기
    });

	orgchartBody = $('#orgchartBody');
});
//클릭 시 action >> 해당 부서 인원 가져오기
function retrieveDptEmployee(event, data) {
	orgchartBody.empty();    
	// 데이터 확인
    console.log("data:", data);
	var dptId = data.node.key;
	var url = `${cPath}/admin/organization/orgEmployeeList/${dptId}`
	
    fetch(url, {method:"get", headers:{"accept":"application/json"}})
        .then(resp=>resp.json())
        .then(json=> {

            console.log(json);
			json.forEach(emp =>
				orgchartBody.append(`<tr>
		                <td>${emp.department.dptName}</td>
		                <td>
		                	<div class="dropdown myDropdown">
							  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
							    ${emp.empName}
							  </button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item href-link" href="/user/mail/sendMail?mailGetter=${emp.empMail}">
							    <i class="bx bx-mail-send me-1"></i> 메일보내기</a>
							    <a class="dropdown-item tree-user" href="#" data-tree-user="${emp.empNo}">
							    <i class="bx bx-chat me-1"></i> 채팅하기</a>
							  </div>
							</div>
		                </td>
		                <td>${emp.empJobposition ? emp.empJobposition : '사원'}</td>
		                <td>${emp.department.dptOffice}</td>
		                <td>${emp.empJobduty ? emp.empJobduty : ''}</td>
		            </tr>
			`)
		)
	});
};

function init(event, data) {
	data.tree.visit(function(node){
		node.setExpanded(true);
	});
}
$(document).on("click", ".href-link", function(event){
	$('#orgModal').modal('hide');
})


$(document).on('click','.tree-user',function(event){
	event.preventDefault();
	$('#orgModal').modal('hide');
	let targetNo = $(this).data('treeUser');
	let url = `${cPath}/user/community/chat/openChatRoom`
	let data = {
		openUser : empNo,
		targetUser : targetNo
	}
	$.ajax({
		url : url,
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp){
			bodyAjax("/WareBridge/user/community/chat");
			if(resp.check == "already"){
				//innerBodyAjax(`/WareBridge/user/community/chat`);
				setTimeout(() => $('#chatRoomTab').click(), 200);
				setTimeout(() => $(`.chat-room[data-room-no="${resp.result}"]`).dblclick(), 200);
			} else if (resp.check == "success"){
				innerBodyAjax(`/WareBridge/user/community/chat`);
				setTimeout(() => $('#chatRoomTab').click(), 400);
				setTimeout(() => $(`.chat-room[data-room-no="${resp.result}"]`).dblclick(), 500);
			} else {
				toastr.warning("시스템 에러 다시 시도해주세요")
			}
		},
		error : function(error){
			console.log("error",error)
		}
	});
})
