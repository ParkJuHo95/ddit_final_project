<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<li class="menu-item active">
							<a href="<%=request.getContextPath()%>/user/mail" class="menu-link">
								<div class="sub-side-div">받은 메일함</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/outMail" class="menu-link">
								<div class="sub-side-div">보낸 메일함</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/saveMail" class="menu-link">
								<div class="sub-side-div">임시 보관함</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/bookMail" class="menu-link">
								<div class="sub-side-div">예약 메일함</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/spamMail" class="menu-link">
								<div class="sub-side-div">스팸 메일함</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/vipMail" class="menu-link">
								<div class="sub-side-div">중요 메일함</div>
							</a>
						</li>
						<li class="menu-item">
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
						<div id="inner-card-body" class="card-body" style="height: 82vh">
					    <h3>${mail.mailTitle }</h3>
					    <div class="d-flex justify-content-between align-items-center flex-wrap">
					        <div class="d-flex align-items-center">
					            <div class="flex-grow-1">
					                <h5>보낸 사람: ${mail.mailSender }</h5>
					                <h5>받는 사람: ${mail.mailGetter }</h5>
					            </div>
					        </div>
					        <div class="d-flex align-items-center">
					            <span class="g3"role="gridcell" tabindex="-1">${mail.mailDate }</span>
					            <hr class="mx-2">
					        </div>
					    </div>
					    <div class="d-flex align-items-center">
			                <button type="button" class="transMail btn rounded-pill btn-outline-danger mx-1">한영번역</button>
			                <button type="button" class="transEnMail btn rounded-pill btn-outline-danger mx-1">영한번역</button>
			                <button data-mail-code="${mail.mailCode}" class="inDelete btn rounded-pill btn-outline-danger" data-target-link="/WareBridge/user/mail/outMail">삭제</button>
							<button data-mail-code="${mail.mailCode}" class="inReply btn rounded-pill btn-outline-danger"  data-target-link="/WareBridge/user/mail/outMail">답장</button>
							<button data-mail-code="${mail.mailCode}" class="inFW btn rounded-pill btn-outline-danger" data-target-link="/WareBridge/user/mail/outMail">전달</button>
				        </div>
					    <hr>
					    <div class="mailDetail">
						    ${mail.mailDetail }
					    </div>
					    <hr>
					    <div class="cursor-pointer">
						   <c:if test="${not empty mail.filesVO[0].fileName}">
						   <p class="mb-2">첨부파일</p>
							   <c:forEach items="${mail.filesVO}" var="file">
							       <a class="btn rounded-pill btn-outline-dark mx-1" href="<c:url value='/mail/download/${file.fileName}'/>">
							           <i class="bx bx-file"></i> ${file.fileOutname}
							       </a>
							   </c:forEach>
							</c:if>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>