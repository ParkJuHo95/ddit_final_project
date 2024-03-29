<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
<div class="table-responsive text-nowrap" style="height: 90%;">
	<h4  class="card-header">요청 목록</h4>
	<hr>
	<table class="table table-hover">
		<thead>
			<tr>
				<td style="width: 50px"><input class="form-check-input" type="checkbox" value="" id="defaultCheck1"></td>
				<th style="font-size: 18px;">상태</th>
				<th style="font-size: 18px;">요청 제목</th>
				<th style="font-size: 18px;">작성일</th>
				</tr>
			</thead>
			<tbody class="table-border-bottom-0">
				<tr>
					<td>
						<input class="form-check-input" type="checkbox" value="" id="defaultCheck2"> 
					</td>
					<td><strong class="badge bg-secondary">대기</strong></td>
					<td><strong> <a class="" href="#">교육 목적 방문 가능할까요</a> </strong></td>
					<td>12월13일</td>
				</tr>
				<tr>
					<td>
						<input class="form-check-input" type="checkbox" value="" id="defaultCheck2"> 
					</td>
					<td><strong class="badge bg-primary">승인</strong></td>
					<td><strong> <a class="" href="#">방문 요청 부탁드립니다.</a> </strong></td>
					<td>10월2일</td>
				</tr>
				<tr>
					<td>
						<input class="form-check-input" type="checkbox" value="" id="defaultCheck2"> 
					</td>
					<td><strong class="badge bg-danger">거절</strong></td>
					<td><strong> <a class="" href="#">방문 요청 바람</a> </strong></td>
					<td>9월16일</td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr>
	<div>
		<nav aria-label="Page navigation" class="mt-3">
			<ul class="pagination justify-content-center">
				<li class="page-item prev">
					<a class="page-link" href="javascript:void(0);">
						<i class="tf-icon bx bx-chevrons-left"></i>
					</a>
				</li>
				<li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
				<li class="page-item next">
					<a class="page-link" href="javascript:void(0);">
						<i class="tf-icon bx bx-chevrons-right"></i>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</div>