<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
<h4 class="card-header m-0 p-0">휴지통</h4>
	<hr>
	<div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
		<button class="goToOrin btn rounded-pill btn-outline-danger" data-roll-back="/user/binMail">메일함 복구</button>
	</div>
	<div class="table-responsive text-nowrap">
		<table class="table table-hover">
			<thead>
				<tr>
					<td><input class="form-check-input" type="checkbox" onclick="selectAll(this)" id="defaultCheck1"></td>
					<th style="font-size: 18px;">보낸 사람</th>
					<th style="font-size: 18px;">메일 제목</th>
					<th style="font-size: 18px;">받은 시간</th>
				</tr>
			</thead>
			<tbody class="table-border-bottom-0">
			<c:forEach items="${mailList }" var="mail">
				<tr>
					<td><input class="form-check-input" data-mail-code="${mail.mailCode }" type="checkbox">
					<i class="cursor-pointer tf-icons bx bx-bulb bx-sm"></i></td>
					<td><strong>${mail.mailSender }</strong></td>
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