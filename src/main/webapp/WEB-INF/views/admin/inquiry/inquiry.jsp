<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>문의</span>
					</div>
					<button class="btn btn-primary" data-btn-location="/admin/inquiry/form">문의 작성</button>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu ">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href='<c:url value="/admin/inquiry"/>' class="menu-link">
								<div class="sub-side-div">사용 문의</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/inquiry/visit"/>' class="menu-link">
								<div class="sub-side-div">방문 요청</div>
							</a>
						</li>
					</ul>
<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
						<div class="table-responsive text-nowrap" style="height: 90%;">
							<div class="col d-flex">
								<div class="col-2">
									<h4  class="card-header">문의 목록</h4>
								</div>
								<div class="col-9"></div>
								<div class="col-1 align-self-center">
									<input type="button" class="btn btn-primary btn-compose" value="문의등록"  data-btn-location="/admin/inquiry/form"/>
								</div>
							</div>
							<hr>
							<table class="table table-hover" style="text-align: center;">
								<thead>
									<tr>
										<td style="width: 50px"><input class="form-check-input" type="checkbox" onclick="selectAll(this)"></td>
										<th style="font-size: 18px;">상태</th>
										<th style="font-size: 18px; width: 700px">문의 제목</th>
										<th style="font-size: 18px;">작성일</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach items="${inquiryList }" var="inquiry" varStatus="status">
										<tr>
											<td>
												<input class="form-check-input" type="checkbox" data-checked-number="${inquiry.inqryId }"> 
<%-- 												 id="defaultCheck<c:out value='${status.count+1 }'/>" --%>
											</td>
											<td>
												<c:if test="${not empty inquiry.inqryAnswer}">
													<strong class="badge bg-primary">완료</strong>
												</c:if>
												<c:if test="${empty inquiry.inqryAnswer}">
													<strong class="badge bg-secondary">대기</strong>
												</c:if>
											</td>
											<td>
												<strong> <a class="" href="<c:url value='/admin/inquiry/detail'/>" data-detail-number="${inquiry.inqryId }">${inquiry.inqrySubject }</a> </strong>
											</td>
											<td>
												${inquiry.inqryDat}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<hr>
						<div>
						 	<c:url var="actionUrl" value='/admin/inquiry'/>
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
									<input type="button" class="btn btn-danger check-delete-button" value="삭제" data-click-location="/admin/inquiry/delete"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

