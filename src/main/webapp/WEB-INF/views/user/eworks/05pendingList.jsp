<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
th:nth-child(4), td:nth-child(4) {
	width: 30%;
}
</style>
<div class="row">

	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<!-- Bordered Table -->
					<div class="card-body" id="inner-card-body" style="height: 82vh">
						<h5 class="card-header">결재 예정 문서</h5>
						<div class="table-responsive text-nowrap">
							<table class="table">
								<thead>
									<tr>
										<th>기안일</th>
										<th>결재양식</th>
										<th>긴급</th>
										<th>제목</th>
										<th>기안자</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty sdcList }">
											<c:forEach items="${sdcList }" var="sdc">
												<tr>
													<td>${sdc.sdcReportdat }</td>
													<td>${sdc.snctform.sfName }</td>
													<td>
													<c:if test="${sdc.sdcEmrgcyyn == 'Y'}"><i class="fas fa-bolt" style="color: red;"></i></c:if>
													</td>
													<td><a href="/user/eworks/docDetail/${sdc.sdcId}" class="href-link"><strong>${sdc.sdcTitle }</strong></a>
													</td>
													<td>${sdc.docWriter.empName }</td>
													<td><c:choose>
													<%-- 0 임시저장, 1 결재대기, 2 반려, 3 승인, 4 취소--%>
													    <c:when test="${sdc.sdcResult eq '0'}">
													        <span class="badge bg-label-info me-1">임시저장</span>
													    </c:when>
													    <c:when test="${sdc.sdcResult eq '1'}">
													        <span class="badge bg-label-info me-1">결재대기</span>
													    </c:when>
													    <c:when test="${sdc.sdcResult eq 'N'}">
													        <span class="badge bg-label-warning me-1">반려</span>
													    </c:when>
													    <c:otherwise>
													       <span class="badge bg-label-success me-1">승인</span>
													    </c:otherwise>
													</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">조회할 문서 없음</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<hr>
						<div>
						 	<c:url var="actionUrl" value='/user/eworks/pendingList'/>
							<form:form id="submitForm" action="${actionUrl}" modelAttribute="paging" method="get">
								<input type='hidden' name="page" />
								<form:input type='hidden' path="simpleCondition.searchType"/>
								<form:input type='hidden' path="simpleCondition.searchWord"/>
							</form:form> 
							<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm">
								<div class="col-1" >
									<form:select class="form-select" path="paging.simpleCondition.searchType">
										<form:option value="" label="선택" />
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
								</div>
							</div>
						</div>
					</div>
					<!-- Bootstrap Table with Caption -->
				</div>
			</div>
		</div>
	</div>
</div>
