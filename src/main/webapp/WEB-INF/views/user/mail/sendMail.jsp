<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.light-style {
	color: #ffab00;
}
</style>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>메일</span>
					</div>
					<button class="btn btn-primary btn-compose" data-btn-location="/user/mail/sendMail">메일 쓰기</button>
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active mb-3">
							<a href="<%=request.getContextPath()%>/user/mail/inMail" class="menu-link">
								<div class="sub-side-div">받은 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/mail/outMail" class="menu-link">
								<div class="sub-side-div">보낸 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/saveMail" class="menu-link">
								<div class="sub-side-div">임시 보관함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/VipMail" class="menu-link">
								<div class="sub-side-div">중요 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/mail/nvrMail" class="menu-link">
								<div class="sub-side-div">네이버 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/googleMail" class="menu-link">
								<div class="sub-side-div">구글 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/spamMail" class="menu-link">
								<div class="sub-side-div">스팸 메일함</div>
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/binMail" class="menu-link">
								<div class="sub-side-div">휴지통</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
	<div id="inner-card-body" class="card-body" style="height: 82vh; overflow: scroll;">
		<h4 class="card-header m-0 p-0">메일 쓰기</h4>
		<div class="btn-toolbar demo-inline-spacing justify-content-end m-0 p-0" role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group, text-end m-0 p-0" role="group" aria-label="First group">
				 <button type="button" class="nvr btn rounded-pill btn-outline-danger mx-1">네이버로 보내기</button>
				 <button type="button" class="transSend btn rounded-pill btn-outline-danger mx-1">한영번역</button>
	             <button type="button" class="transESend btn rounded-pill btn-outline-danger mx-1">영한번역</button>
			</div>
		</div>
		<form:form id="sendMailForm" method="post" enctype="multipart/form-data" modelAttribute="mailVO"> 
			<div class="m-0 p-0">
				<label for="recipient" class="form-label">받는 분</label> 
				<form:input type="email" class="form-control"  placeholder="이메일 주소" path='mailGetter' /> 
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
				     <form:textarea  path="mailDetail" class="SendMailTrans form-control" rows="8"/>
				</div>
			</div>
			<div class="text-end mt-3">
				<button type="button" class="btn btn-primary" onClick="confirmCancel()">작성 취소</button>
				<button type="button" class="imsiSave btn btn-primary">임시 저장</button>
				<button type="submit" class="btn btn-primary">메일 보내기</button>
			</div>
		</form:form>
	</div>
	</div>
			</div>
		</div>
	</div>
</div>
