
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
.light-style {
	color: #ff0000;
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
								받은 메일함 
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/mail/outMail" class="menu-link">
								보낸 메일함
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/mail/nvrMail" class="menu-link">
								보낸 메일함(NAVER)
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/saveMail" class="menu-link">
								임시 보관함
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/googleMail" class="menu-link">
								구글 메일함
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/spamMail" class="menu-link">
							 스팸 메일함
							</a>
						</li>
						<li class="menu-item mb-3">
							<a href="<%=request.getContextPath()%>/user/binMail" class="menu-link">
								휴지통
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
						<h4 class="card-header m-0 p-0">받은 메일함</h4>
						<hr>
						<div class="btn-toolbar demo-inline-spacing" role="toolbar"
							aria-label="Toolbar with button groups">
							<button class="goToBin btn rounded-pill btn-outline-danger"
								data-mail-delete-target="/WareBridge/user/mail/inMail">삭제</button>
							<button class="replyMail btn rounded-pill btn-outline-danger"
								data-mail-delete-target="/WareBridge/user/mail/outMail">답장</button>
							<button class="forWardMail btn rounded-pill btn-outline-danger"
								data-mail-delete-target="/WareBridge/user/mail/outMail">전달</button>
						</div>
						<div class="table-responsive text-nowrap">
							<table class="table table-hover">
								<thead>
									<tr>
										<td><input class="form-check-input" type="checkbox"
											onclick="selectAll(this)" id="defaultCheck1"></td>
										<th style="font-size: 18px;">보낸 사람</th>
										<th style="font-size: 18px;">메일 제목</th>
										<th style="font-size: 18px;">받은 시간</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach items="${mailList }" var="mail">
										<tr class="mail-inside" data-mailcode="${mail.mailCode }">
											<c:choose>
												<c:when test="${mail.mailRead eq 'X'}">
													<td>
														<input class="mailCheck form-check-input" type="checkbox" data-mail-code="${mail.mailCode }">
														<i class="light-style cursor-pointer tf-icons bx bx-envelope bx-sm"></i>
													</td>
													<td><strong>${mail.mailSender}</strong></td>
													<td><strong>${mail.mailTitle}</strong></td>
													<td><strong>${mail.mailDate}</strong></td>
												</c:when>
												<c:otherwise>
													<td>
														<input class="mailCheck form-check-input" type="checkbox" data-mail-code="${mail.mailCode }">
														<i class="cursor-pointer tf-icons bx bx-envelope-open bx-sm"></i>
													</td>
													<td>${mail.mailSender}</td>
													<td>${mail.mailTitle}</td>
													<td>${mail.mailDate}</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<hr>
							<div>
							 	<c:url var="actionUrl" value='/user/mail/outMail'/>
								<form:form id="submitForm" action="${actionUrl}" modelAttribute="paging" method="get">
									<input type='hidden' name="page" />
									<form:input type='hidden' path="simpleCondition.searchType"/>
									<form:input type='hidden' path="simpleCondition.searchWord"/>
								</form:form> 
								<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm">
									<div class="col-1" >
										<form:select class="form-select" path="paging.simpleCondition.searchType">
											<form:option value="mailGetter" label="보낸 사람" />
											<form:option value="mailTitle" label="메일 제목" />
										</form:select>
									</div>
									<div class="col-3 d-flex align-items-start">
										<form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"/>
										<input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
									</div>
									<div class="col-1">
									</div>
									<div class="col-3">
										${pagingHTML }
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>					