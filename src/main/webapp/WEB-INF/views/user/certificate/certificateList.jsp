<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="table-responsive text-nowrap" style="height: 90%;">
		<div class="col row">
			<div class="col-10">
				<h4 class="card-header">자격증 추천</h4>
			</div>
			<div class="col-1 d-flex align-items-center">
				<input type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertCer" value="보유 자격증 입력" />
			</div>
		</div>
		<hr>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="font-size: 18px;">추천</th>
						<th style="font-size: 18px;">자격증</th>
					</tr>
				</thead>
				<tbody class="table-border-bottom-0">
					<tr>
						<td><strong class="badge bg-danger">${recom[0]['RANK']}&nbsp</strong></td>
						<td><strong> <a class="" href="#">${recom[0]['CER_NAME']}</a> </strong></td>
					</tr>
					<tr>
						<td><strong class="badge bg-primary">${recom[1]['RANK']}</strong></td>
						<td><strong> <a class="" href="#">${recom[1]['CER_NAME']}</a> </strong></td>
					</tr>
					<tr>
						<td><strong class="badge bg-info">${recom[2]['RANK']}</strong></td>
						<td><strong> <a class="" href="#">${recom[2]['CER_NAME']}</a> </strong></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="modal fade" id="insertCer" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content border border-primary">
				<div class="modal-header">
				</div>
				<form:form id="insertCerForm" data-form-location="/user/mypage/certificate/insert">
					<div class="modal-body text-center">
						<div class="mb-3 row justify-content-center align-items-center">
						<h6 style="color: #FF6F61; font-weight: bold;" class="col-md-6">보유 자격증 입력</h6>
						</div>
						<div class="mb-3 row justify-content-center align-items-center">
							<input type="text" name="cerName" class="form-control" placeholder="자격증명" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit"class="btn btn-primary" data-bs-dismiss="modal">입력</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>