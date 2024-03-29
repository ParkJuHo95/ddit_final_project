<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="table-responsive text-nowrap" style="height: 90%;">
		<div class="col d-flex">
			<div class="col-2">
				<h4  class="card-header">요청 목록</h4>
			</div>
			<div class="col-9"></div>
			<div class="col-1 align-self-center">
				<input type="button" class="btn btn-primary" value="방문등록"  data-btn-location="/admin/inquiry/visit/form"/>
			</div>
		</div>
		<hr>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<td style="width: 50px"><input class="form-check-input" type="checkbox" onclick="selectAll(this)"/></td>
					<th style="font-size: 18px;">상태</th>
					<th style="font-size: 18px; width: 700px">문의 제목</th>
					<th style="font-size: 18px;">작성일</th>
				</tr>
			</thead>
			<tbody class="table-border-bottom-0">
				<c:forEach items="${visitList }" var="visit" varStatus="status">
					<tr>
						<td>
							<input class="form-check-input" type="checkbox" data-checked-number=${visit.visitId }> 
						</td>
						<td>
							<c:choose>
								<c:when test="${visit.visitStatus eq '대기'}">
									<strong class="badge bg-secondary">대기</strong>
								</c:when>
								<c:when test="${visit.visitStatus eq '승인'}">
									<strong class="badge bg-primary">승인</strong>
								</c:when>
								<c:when test="${visit.visitStatus eq '거절'}">
									<strong class="badge bg-danger">거절</strong>
								</c:when>
							</c:choose>
						</td>
						<td>
							<strong> <a class="" href="<c:url value='/admin/inquiry/visit/detail'/>" data-detail-number="${visit.visitId }">${visit.visitSubject }</a> </strong>
						</td>
						<td>
							${visit.requestDate}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>
	<div>
	 	<c:url var="actionUrl" value='/admin/inquiry/visit'/>
		<form:form id="submitForm" action="${actionUrl}" modelAttribute="paging" method="get">
			<input type='hidden' name="page" />
			<form:input type='hidden' path="simpleCondition.searchType"/>
			<form:input type='hidden' path="simpleCondition.searchWord"/>
		</form:form> 
		<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm">
			<div class="col-1" >
				<form:select class="form-select" path="paging.simpleCondition.searchType">
					<form:option value="" label="전체" />
					<form:option value="sub" label="제목" />
					<form:option value="con" label="내용" />
				</form:select>
			</div>
			<div class="col-3 d-flex align-items-start">
				<form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"/>
				<input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
			</div>
			<div class="col-3">
				${pagingHTML }
			</div>
			<div class="col-4">
			</div>
			<div class="col-1">
				<input type="button" class="btn btn-danger check-delete-button" value="삭제" data-click-location="/admin/inquiry/visit/delete"/>
			</div>
		</div>
	</div>
</div>




