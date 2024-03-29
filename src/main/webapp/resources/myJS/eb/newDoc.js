var docEditor;
ClassicEditor
	.create( document.querySelector( '#ckeditor-editor' ), {
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
    } )
	.then(editor => {
		docEditor = editor;
        // 에디터에서 내용이 변경될 때마다 textarea의 값을 업데이트함
        editor.model.document.on('change:data', () => {
            document.querySelector('#ckeditor-editor').value = editor.getData();
        });
    })
	.catch( error => {
	    console.error( error );
} );
function trialSet(objectId, trialData){
	var object = $(`${objectId}`);
	object.val(trialData);
}

function updateEditorContent(editor, newContent) {
    editor.setData(newContent);
}

$(document).off('click','.trial1');
$(document).on('click','.trial1', function(event){
	console.log('시연데이터 버튼1 클릭')
	trialSet('#sdcTitle', '정부사업 투찰 제안의 건');
	updateEditorContent(docEditor, `<figure class="table">
    <table class="custom-table">
        <tbody>
            <tr>
                <td class="header-cell">
                    시행일자
                </td>
                <td class="data-cell">
                    &nbsp;
                </td>
                <td class="header-cell">
                    협조부서
                </td>
                <td class="data-cell">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="header-cell">
                    합의
                </td>
                <td class="data-cell" colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="header-cell">
                    제목
                </td>
                <td class="data-cell" colspan="3">
                    정부사업 투찰 제안의 건: 2024년도 건축공간연구원 정보시스템 통합유지보수
                </td>
            </tr>
            <tr>
                <td class="data-cell" colspan="4">
                    <ul>
                        <li>
                            &nbsp;
                        </li>
                        <li>
                            공고 개요
                        </li>
                        <li>
                            <div class="infoleft" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);clear:both;color:rgb(0, 0, 0);display:inline-block;float:left;font-family:NanumGothicWeb, sans-serif;font-size:12px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;overflow:hidden;padding:3px 0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">
                                <h3 style="color:rgb(34, 34, 34);display:inline-block;float:left;font-size:13px;letter-spacing:0px;margin:-1px 0px 0px;padding:3px 0px 0px;">
                                    <strong>[공고일반]</strong>
                                </h3>
                            </div>
                            <div class="section" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);clear:both;color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif;font-size:12px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:15px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:800px;word-spacing:0px;">
                                <p class="hide" style="border:0px;font-size:0px;height:0px;list-style:none;margin:0px;overflow:hidden;padding:0px;position:absolute;top:-1e+06px;visibility:hidden;">
                                    &nbsp;
                                </p>
                                <figure class="table">
                                    <table class="table_info" style="border-bottom:2px solid rgb(88, 157, 218);border-collapse:collapse;border-top:2px solid rgb(88, 157, 218);clear:both;font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:1.3em;width:800px;" summary="공고일반 정보">
                                        <tbody>
                                            <tr>
                                                <th style="background:rgb(204, 222, 246);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:6px 4px 6px 12px;text-align:left;vertical-align:middle;word-break:break-all;">
                                                    <p style="border:0px;list-style:none;margin:0px;padding:0px;">
                                                        공고종류
                                                    </p>
                                                </th>
                                                <td style="background:rgb(244, 248, 253);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);font-family:돋움, Dotum, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:3px 4px;text-align:left;word-break:break-all;">
                                                    <div class="tb_inner">
                                                        실공고
                                                    </div>
                                                </td>
                                                <td style="background:rgb(204, 222, 246);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:6px 4px 6px 12px;text-align:left;vertical-align:middle;word-break:break-all;">
                                                    <p style="border:0px;list-style:none;margin:0px;padding:0px;">
                                                        게시일시
                                                    </p>
                                                </td>
                                                <td style="background:rgb(244, 248, 253);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);font-family:돋움, Dotum, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:3px 4px;text-align:left;word-break:break-all;">
                                                    <div class="tb_inner">
                                                        2024/03/27 15:50
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background:rgb(204, 222, 246);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:6px 4px 6px 12px;text-align:left;vertical-align:middle;word-break:break-all;">
                                                    <p style="border:0px;list-style:none;margin:0px;padding:0px;">
                                                        입찰공고번호
                                                    </p>
                                                </th>
                                                <td style="background:rgb(244, 248, 253);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);font-family:돋움, Dotum, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:3px 4px;text-align:left;word-break:break-all;">
                                                    <div class="tb_inner">
                                                        20240345768 - 00
                                                    </div>
                                                </td>
                                                <td style="background:rgb(204, 222, 246);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:6px 4px 6px 12px;text-align:left;vertical-align:middle;word-break:break-all;">
                                                    <p style="border:0px;list-style:none;margin:0px;padding:0px;">
                                                        참조번호
                                                    </p>
                                                </td>
                                                <td style="background:rgb(244, 248, 253);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);font-family:돋움, Dotum, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:3px 4px;text-align:left;word-break:break-all;">
                                                    <div class="tb_inner">
                                                        운영지원팀-574
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background:rgb(204, 222, 246);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:NanumGothicWeb, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:6px 4px 6px 12px;text-align:left;vertical-align:middle;word-break:break-all;">
                                                    <p style="border:0px;list-style:none;margin:0px;padding:0px;">
                                                        공고명
                                                    </p>
                                                </th>
                                                <td style="background:rgb(244, 248, 253);border-bottom:1px solid rgb(255, 255, 255);border-collapse:collapse;border-right:1px solid rgb(255, 255, 255);font-family:돋움, Dotum, sans-serif !important;font-size:12px;line-height:15.6px;overflow-wrap:break-word;padding:3px 4px;text-align:left;word-break:break-all;" colspan="3">
                                                    <div class="tb_inner">
                                                        2024년도 건축공간연구원 정보시스템 통합유지보수
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </figure>
                            </div>
                        </li>
                        <li>
                            &nbsp;
                        </li>
                        <li>
                            &nbsp;
                        </li>
                        <li>
                            <a class="bid-link" href="#" data-url="https://www.g2b.go.kr:8081/ep/invitation/publish/bidInfoDtl.do?bidno=20240345768&amp;bidseq=00&amp;releaseYn=Y&amp;taskClCd=5" data-bidno="20240345768-00">링크 연결 : 2024년도 건축공간연구원 정보시스템 통합유지보수</a>
                        </li>
                        <li>
                            &nbsp;
                        </li>
                        <li>
                            &nbsp;
                        </li>
                        <li>
                            드림정보시스템이 위 정부 사업에 투찰하여 사업을 진행하는 것에 대해 기안드립니다.
                        </li>
                        <li>
                            아래는 위 사업에 적합한 우리 회사의 경쟁력입니다.
                        </li>
                        <li>
                            &nbsp;
                            <ul>
                                <li>
                                    <strong>1. 전문성 및 경험</strong>:&nbsp;<br>
                                    드림정보시스템은 정보기술 분야에서 오랜 경험과 풍부한 전문성을 갖추고<br>
                                    있습니다. 이전에 수행한 정부 사업 및 기타 프로젝트에서 우리의&nbsp;<br>
                                    전문성과 뛰어난 성과가 입증되었습니다.
                                </li>
                                <li>
                                    &nbsp;
                                </li>
                                <li>
                                    <strong>2. 기술 혁신</strong>: 우리 회사는 항상&nbsp;<br>
                                    최신 기술 동향을 주시하며, 혁신적인 기술을 적용하여 고객의 요구를&nbsp;<br>
                                    충족시키고 있습니다. 이를 통해 정부 사업에서도 더 나은 솔루션을&nbsp;<br>
                                    제공할 수 있을 것으로 기대됩니다.
                                </li>
                                <li>
                                    &nbsp;
                                </li>
                                <li>
                                    <strong>3. 고객 중심 접근</strong>: 저희는 고객의 요구와 기대를 이해하고,
                                </li>
                                <li>
                                    그에 맞춰 맞춤형 솔루션을 제공하는 데 중점을 두고 있습니다.&nbsp;
                                </li>
                                <li>
                                    정부 사업에서도 고객의 니즈를 충족시키는데 최선을 다할 것입니다
                                </li>
                                <li>
                                    &nbsp;
                                </li>
                            </ul>
                        </li>
                        <li>
                            이러한 이유로, 저희 회사가 정부 사업에 투찰하여 사업을 진행하는 것에 대해 승인을 요청드립니다.&nbsp;
                        </li>
                        <li>
                            추가 문의사항이나 의견이 있으시면 언제든지 연락주시기 바랍니다.
                        </li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
</figure>
`);
});

$(document).off('click','.trial2');
$(document).on('click','.trial2', function(event){
	console.log('시연데이터 버튼2 클릭')
	trialSet('#sdcTitle', '휴가신청서 : 4/3~4/5 연차');
	updateEditorContent(docEditor, `<figure class="table">
    <table>
        <tbody>
            <tr>
                <td class="ths">
                    휴가 종류
                </td>
                <td class="tds">
                    연차
                </td>
            </tr>
            <tr>
                <td class="ths">
                    기간 및 일시
                </td>
                <td class="tds">
                    시작일 : 4/3 (수)<br>
                    종료일 : 4/5 (금)
                </td>
            </tr>
            <tr>
                <td class="ths">
                    연차 일수
                </td>
                <td class="tds">
                    &nbsp;3일
                </td>
            </tr>
            <tr>
                <td class="tds" colspan="2">
                    ※ "휴가 사유" 작성란은 삭제되었습니다.<br>
                    - 경조휴가 등 휴가 사유를 반드시 적어야 하는 경우에는 [결재요청] 클릭 후 기안의견에 적어주세요.<br>
                    <br>
                    1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다.<br>
                     단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br>
                    2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                    3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
                </td>
            </tr>
        </tbody>
    </table>
</figure>`);
});
//결재선 설정 모달 내에 fancytree 적용
$("#lineSelectTree").fancytree({
    extensions: ["glyph"],
    glyph: {
        preset: "awesome5",
        map: {
            folder: "fa-solid fa-building", // 폴더 아이콘을 fa-building으로 변경
            folderOpen: "fa-solid fa-building-circle-arrow-right", 
			employee: "fa-solid fa-user"
        }
    },
    selectMode: 1,
	// Fancytree가 처음 로드될 때 모든 노드를 확장
    init: function(event, data) {
        data.tree.visit(function(node) {
	        if (node.getLevel() <= 2) { // 두 번째 레벨까지만 확장
	            node.setExpanded(true);
	        }
	    });
    },
	//더블클릭 말고 1회 클릭 시 폴더가 토글되도록 변경함
	click: function(event, data) {
        if (data.node.isFolder()) {
            data.node.toggleExpanded();
        }else{
			addSnctLine(event, data);
		}
    },
	// employee 클래스를 가진 노드에 대해 아이콘 적용
    renderNode: function(event, data) {
        var node = data.node;
        if (node.isFolder() && node.hasClass("employee")) {
            var span = $("span.fancytree-icon", node.span);
            span.removeClass("fancytree-icon").addClass("fa fa-fw fa-user");
        }
    }
});

var appendContainer = $("#hiddenInfo")//$("#snctline\\.slId").parent();
var appendTable = $("#snctlineTableBody");
var cnt = 1;
function addSnctLine(event, data) {
    // 데이터 확인
    console.log("data:", data);
    console.log("appendContainer:", appendContainer);
	var innerdata = data.node.data;
	//	data.node.data.empJobposition / empName / empNo / dptName / data.node.key
	tagHTML = `<input type="hidden" id='snctline.snctdetails[${cnt-1}].sdtEmpNo' name='snctline.snctdetails[${cnt-1}].sdtEmpNo' value=${innerdata.empNo} class="clearDetail"/>
            <input type="hidden" id='snctline.snctdetails[${cnt-1}].sdtOrder' name='snctline.snctdetails[${cnt-1}].sdtOrder' value=${cnt} class="clearDetail"/>`
	tableHTML = `<tr class="clearDetail"><td>${innerdata.dptName}</td><td>${innerdata.empJobposition}</td><td>${innerdata.empName}</td><td>${cnt}</td></tr>`
	appendContainer.append(tagHTML);
	appendTable.append(tableHTML);
	cnt +=1;
}

//새 결재 문서 화면에서 결재선 초기화 버튼
$(document).on('click','.clearSnctline', function(event){
	console.log('결재선 초기화');
	cnt = 1;
	document.querySelectorAll(".clearDetail").forEach(function(element){
		element.remove();
	});
})




