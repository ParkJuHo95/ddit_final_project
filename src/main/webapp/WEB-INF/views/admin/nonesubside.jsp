<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<div class="card-body">
				<h4 class="card-header">
				<strong>회사정보</strong>
				</h4>
				<table class="table table-striped" style="text-align: center;">
					<tbody class="table-border-bottom-0">
						<tr>
							<td class="form-label">상호(법인명) :</td>
							<td id="cmpNm">${company.cmpNm}</td>
						</tr>
						<tr>
							<td class="form-label">대표자명 :</td>
							<td id="cmpNm">${company.cmpCeo}</td>
						</tr>
						<tr>
							<td class="form-label">사업자등록번호 :</td>
							<td id="cmpNm">${company.cmpNo}</td>
						</tr>
						<tr>
							<td class="form-label">계정 수 / 총계정 수</td>
							<td id="cmpNm">${company.cmpCeo}</td>
						</tr>
						<tr>
							<td class="form-label">사업장 주소 :</td>
							<td id="cmpNm">${company.cmpAddr}</td>
						</tr>
						<tr>
							<td class="form-label">대표번호 :</td>
							<td id="cmpNm">${company.cmpTelno}</td>
						</tr>
						<tr>
							<td class="form-label">담당자명 :</td>
							<td id="cmpNm">${company.cmpEmpChargerid}</td>
						</tr>
						<tr>
							<td class="form-label">도입 날짜 :</td>
							<td id="cmpNm">2024-01-27</td>
						</tr>
						<tr>
							<td class="form-label">공용 용량 :</td>
							<td id="cmpNm">무제한</td>
						</tr>
						<tr>
							<td class="form-label">사용 기간 :</td>
							<td id="cmpNm">2024-01-27 ~ 2026-01-26</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-header">
							<strong>문의 상황</strong>
						</h4>
						<div class="table-container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="font-size: 18px;">상태</th>
										<th style="font-size: 18px;">요청 제목</th>
										<th style="font-size: 18px;">작성일</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach items="${inquiryList }" var="inquiry" varStatus="status">
										<tr>
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
					</div>
				</div>
				<div class="col-md-12 mt-3">
					<div class="card">
						<div class="card-body">
						<h4 class="card-header">
							<strong>관리자 목록</strong>
						</h4>
							<table class="table">
								<thead>
									<tr>
										<th>관리자</th>
										<th>부서</th>
										<th>직위</th>
										<th>변동일</th>
										<th>부여자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminList }" var="admin">
										<tr>
											<td><a href="#" class="empView" data-emp-no="${admin.admTo }">${admin.admToName }</a></td>
											<td>${admin.dptName }</td>
											<td>${admin.empJobposition }</td>
											<td>${admin.admDat }</td>
											<td><a href="#" class="empView" data-emp-no="${admin.admFrom }">${admin.admFromName }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>