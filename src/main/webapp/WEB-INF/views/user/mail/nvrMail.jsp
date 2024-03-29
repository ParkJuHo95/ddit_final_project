<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
<h4 class="card-header m-0 p-0">네이버 메일함</h4>
<hr>
<div class="table-responsive text-nowrap">
	<table class="table table-hover">
		<thead>
			<tr>
				<td></td>
				<th style="font-size: 18px;">받는 사람</th>
				<th style="font-size: 18px;">메일 제목</th>
				<th style="font-size: 18px;">보낸 시간</th>
			</tr>
		</thead>
		<tbody class="table-border-bottom-0">
		<c:forEach items="${naverList }" var="naver">
			<tr class="nvrmail-inside" data-mailcode="${naver.nvrCode }">
				<td><input class="form-check-input" type="checkbox" data-mail-code = "${naver.nvrCode }">
				<i class="cursor-pointer tf-icons bx bx-envelope-open bx-sm"></i></td>
				<td><strong>${naver.nvrGetter }</strong></td>
				<td><strong> ${naver.nvrTitle }</strong></td>
				<td>${naver.nvrDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	${pagingHTML}
	</div>
</div>