<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body" style="height: 82vh; overflow: scroll;">
	<h4 class="card-header m-0 p-0">메일 쓰기</h4>
	<div class="btn-toolbar demo-inline-spacing justify-content-end m-0 p-0" role="toolbar" aria-label="Toolbar with button groups">
		<div class="btn-group, text-end m-0 p-0" role="group"
			aria-label="First group">
			<button type="button" class="transMail btn rounded-pill btn-outline-danger">메일 번역</button>
			<button class="btn rounded-pill btn-outline-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBoth" aria-controls="offcanvasBoth">주소록</button>
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasBoth" aria-labelledby="offcanvasBothLabel">
				<div class="offcanvas-header">
					<h5 id="offcanvasBothLabel" class="offcanvas-title">주소록</h5>
					<div class="offcanvas-body my-auto mx-0 flex-grow-0">
						<p class="text-center">주소록</p>
						<button type="button" class="btn btn btn-primary d-grid w-100" data-bs-dismiss="offcanvas">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form:form id="sendMailForm" method="post" enctype="multipart/form-data" modelAttribute="mailVO"> 
		<div class="m-0 p-0">
			<label for="recipient" class="form-label">받는 분</label> 
			<input type="email" class="form-control"  placeholder="이메일 주소" name='mailSender' /> 
		</div>
		<div class="m-0 p-0">
			<label for="subject" class="form-label">제목</label>
			 <form:input type="text" class="form-control"  placeholder="제목을 입력하세요" path='mailTitle' />
		</div>
		<div class="m-0 p-0">
		    <label for="attachment" class="form-label m-0 p-0">첨부 파일</label> 
		    <input type="file" class="form-control " multiple name="attachment"  />
		</div>
		<div class="m-0 p-0">
			<label for="message" class="form-label m-0 p-0 ">내용</label>
			<div class="m-0 p-0">
			     <form:textarea  path="mailDetail" class="form-control" rows="8"/>
			</div>
		</div>
		<div class="text-end mt-3">
			<button type="button" class="btn btn-primary" onClick="confirmCancel()">작성 취소</button>
			<button type="button" class="imsiSave btn btn-primary">임시 저장</button>
			<button type="submit" class="btn btn-primary">메일 보내기</button>
		</div>
	</form:form>
</div>
