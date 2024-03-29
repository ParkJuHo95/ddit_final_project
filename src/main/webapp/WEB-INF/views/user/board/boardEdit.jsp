<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.warebridge.board.controller.CompanyBoardUpdateController"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h4>게시글 수정</h4>
	<form:form id="updateForm" method="post"  modelAttribute="cmdObj" enctype="multipart/form-data">
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<form:input type="text" path="cbName" placeholder="제목 입력"/>
									</dd>
								</dl>
								<hr>
							</div>
							<section class="mg-b-10u">
								<dl>
									<dt>기존파일</dt>
									<dd>
										<c:forEach items="${cmdObj.attatchList}" var="atch">
								            <span>${atch.atchName }</span>
								            <a data-att-no="${atch.atchNo}" class="btn btn-danger" href="javascript:;">
								                삭제
								            </a>
								        </c:forEach>
									</dd>
								</dl>
								<dl>
									<dt>파일</dt>
									<dd>
										<input type="file" name="boFiles" multiple />
										<input type="file" name="boFiles" multiple />
									</dd>
								</dl>	
							</section>
							<hr>
							<div class="cont">
								<form:textarea path="cbContent" placeholder="내용 입력"></form:textarea>
							</div>
						</div>
						<div class="bt_wrap">
							<button id="updateAA" data-board-no="${cmdObj.cbNo}" type="submit" class="btn btn-primary">전송</button>
							<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
						</div>
					</div>
		</form:form>
		<form action="delete" method="post" id="deleteForm"></form>>
</div>
<script>
document.querySelectorAll("[data-att-no]").forEach(el=>{
	el.addEventListener("click", e=>{
		e.preventDefault();
		let atchNo = el.dataset.atchNo;
		fetch(`<c:url value='/user/board/company/atch'/>/\${atchNo}`, {
			method:"delete"
			, headers:{
				"accept":"application/json"
			}
		}).then(resp=>resp.json())
		.then(json=>{
			if(json.success){
				el.parentElement.remove();    				
			}
		}).catch(err=>console.error(err));
	});
});
</script>

