<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
<h4 class="card-header m-0 p-0">예약 메일함</h4>
<hr>
<div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
	<button class="goToBin btn rounded-pill btn-outline-danger">삭제</button>
	<button class="btn rounded-pill btn-outline-danger">스팸처리</button>
	<button class="btn rounded-pill btn-outline-danger" data-btn-location="/user/mail/sendMail">답장</button>
	<button class="btn rounded-pill btn-outline-danger" data-btn-location="/user/mail/sendMail">전달</button>
	<button class="btn rounded-pill btn-outline-danger">읽음 처리</button>
</div>
<div class="table-responsive text-nowrap">
	<table class="table table-hover">
		<thead>
			<tr>
				<td><input class="form-check-input" type="checkbox" onclick="selectAll(this)" id="defaultCheck1"></td>
				<th style="font-size: 18px;">받는 사람</th>
				<th style="font-size: 18px;">메일 제목</th>
				<th style="font-size: 18px;">예약 시간</th>
			</tr>
		</thead>
		<tbody class="table-border-bottom-0">
			<c:forEach items="${mailList }" var="mail">
			<tr class="mail-inside" data-mailcode="${mail.mailCode }">
				<td><input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
				<i class="cursor-pointer tf-icons bx bx-bulb bx-sm"></i></td>
				<td><strong>${mail.mailGetter }</strong></td>
				<td><strong>${mail.mailTitle }</strong></td>
				<td>${mail.mailDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	${pagingHTML}
</div>
</div>