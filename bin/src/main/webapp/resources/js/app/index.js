var orgchartBody;

document.addEventListener("DOMContentLoaded", ()=>{
	console.log(bootstrap); // 2
	
	$("[data-log-out]").on("click", (event)=>{
		 let $aTag = $(event.target);
		 let formSelector = $aTag.data("logOut");
		 $(formSelector).submit();
	});
	
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
							    <a class="dropdown-item href-link" href="/user/chatting/endpoint=${emp.empNo}">
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


//$(document).on("click", "[data-mail-send-location]", function(event){
//	let uri = $(this).data('mailSendLocation');
//	bodyAjax(`${cPath}${uri}`);
//	$('#orgModal').modal('hide');
//})

