<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
<h4 class="card-header m-0 p-0">보낸 메일함</h4>
<hr>
<div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
	<button class="goToBin btn rounded-pill btn-outline-danger" data-mail-delete-target="/WareBridge/user/mail/outMail">삭제</button>
	<button class="forWardMail btn rounded-pill btn-outline-danger" data-mail-delete-target="/WareBridge/user/mail/outMail">전달</button>
</div>
<div class="table-responsive text-nowrap">
	<table class="table table-hover">
		<thead>
			<tr>
				<td><input class="form-check-input" type="checkbox" onclick="selectAll(this)" id="defaultCheck1"></td>
				<th style="font-size: 18px;">받는 사람</th>
				<th style="font-size: 18px;">메일 제목</th>
				<th style="font-size: 18px;">보낸 시간</th>
			</tr>
		</thead>
		<tbody class="table-border-bottom-0">
		<c:forEach items="${mailList }" var="mail">
			<tr class="mail-inside" data-mailcode="${mail.mailCode }">
				<td><input class="form-check-input" type="checkbox" data-mail-code = "${mail.mailCode }">
				<em class="cursor-pointer tf-icons bx bx-envelope-open bx-sm" ></em></td>
				<td><strong>${mail.mailGetter }</strong></td>
				<td><strong> ${mail.mailTitle }</strong></td>
				<td>${mail.mailDate }</td>
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
						<form:option value="mailGetter" label="받는 사람" />
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