<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>회사정보 관리</span>
					</div>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner ">
						<li class="menu-item active">
							<a href='<c:url value="/admin/company"/>' class="menu-link">
								<div class="sub-side-div">회사정보</div>
							</a>
						</li>
					</ul>
					<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div id="inner-card-body" class="card-body py-1 overflow-auto" style="height: 82vh">
					<form id="companyViewForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm(event);">
						<!-- Content -->
						<div class="row"> 
							<!-- Account -->
							<h5 class="card-header mb-4">회사정보</h5>
							<div class="card-body">	
									<div class="mb-4 col d-flex">
										<div class="col-auto">
											<label for="html5-text-input"  class="col-form-label me-3">현재 계정수&nbsp / &nbsp계약 계정수 </label>
										</div>
										<div class="col-auto">
											<div class="col-md-10">
												<input class="form-control" style="text-align: center;"  disabled="disabled" value="${cnt} &nbsp&nbsp&nbsp/ &nbsp&nbsp&nbsp 100"/>
											</div>
										</div>
									</div>
							</div>
						</div>
					<hr class="my-0" />
						<div class="card-body">
							
								<div class=""> <!-- class="row" 주석 -->
									<div class="mb-3 col-md-4">
										<label for="cmpNm" class="form-label text-light fw-semibold">상호(법인명)</label> 
										<input class="form-control" readonly type="text" id="cmpNm" name="cmpNm" value="${company.cmpNm}"  />
									</div>
									
									<div class="mb-3 col-md-4 ">
										<label for="cmpCeo" class="form-label text-light fw-semibold">대표자명</label> 
										<input class="form-control" readonly type="text" id="cmpCeo" name="cmpCeo" value="${company.cmpCeo}"  />
									</div>

									<div class="mb-3 col-md-4 ">
										<label for="cmpNo" class="form-label text-light fw-semibold">사업자등록번호</label> 
										<input class="form-control" readonly type="text" id="cmpNo" name="cmpNo" value="${company.cmpNo}"  />
									</div>
									<div class="mb-3 col-md-4 ">
										<label for="position" class="form-label text-light fw-semibold">계정 수 / 총계정 수</label>
										<input type="text" readonly class="form-control" id="position" name="position" value="${company.cmpCeo}" />
									</div>
									<div class="mb-3 col-md-4 ">
										<label for="cmpId"  class="form-label text-light fw-semibold">회사 아이디</label> 
										<input class="form-control" readonly type="text" id="cmpId" name="cmpId" value="${company.cmpId}" placeholder="사번" />
									</div>
									<div class="mb-3 col-md-4 ">
										<label for="cmpAddr" class="form-label text-light fw-semibold">사업장 주소</label>
										<input type="text" readonly class="form-control" id="cmpAddr" name="cmpAddr" value="${company.cmpAddr}" />
									</div>
									<div class="mb-3 col-md-4">
										<label for="cmpMail" class="form-label">회사 이메일</label> 
										<input class="form-control" type="text" id="cmpMail" name="cmpMail" value="${company.cmpMail}" placeholder="john.doe@example.com" />
									</div>
									<div class="mb-3 col-md-4">
										<label class="form-label" for="cmpTelno">대표번호</label>
										<div class="input-group input-group-merge">
											<input type="text" id="cmpTelno" name="cmpTelno" class="form-control" value="${company.cmpTelno}" placeholder="042-000-1111" />
										</div>
									</div>
<!-- 									<div class="mb-3 col-md-3 overflow-auto"> -->
<!-- 				                        <label for="formFileMultiple" class="form-label">파비콘 이미지</label> -->
<!-- 				                        <input  class="form-control " type="file" id="formFileMultiple" /> -->
<!-- 				                        <p class="form-text ">ico 파일로 16 x 16 사이즈로 등록하세요. <br> 파비콘은 미리보기를 제공하지 않습니다.</p> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-3"> -->
<!-- 										<label for="cmpWebTitle" class="form-label">웹 타이틀</label> -->
<%-- 										<input type="text"  class="form-control" id="cmpWebTitle" name="cmpWebTitle" value="${company.cmpWebTitle}" /> --%>
<!-- 									</div> -->
									<div class="mb-3 col-md-4">
										<label for="cmpEmpChargerid" class="form-label">담당자명</label>
										<input type="text"  class="form-control" id="cmpEmpChargerid" name="cmpEmpChargerid" value="${company.cmpEmpChargerid}" />
									</div>
									<c:choose>
										<c:when test="${company.cmpStatus eq '1' }">
											<div class="mb-3 col-md-3">
												<div class="col-md">
													<div>
							                        	<small class="text-light fw-semibold">계정상태</small>
													</div>
							                       	<div class="form-check form-check-inline mt-3">
							                       		<input class="form-check-input" type="radio" name="cmpStatus" disabled="disabled" value="1" id="status1" checked="checked" />
							                           	<label class="form-check-label" for="status1"> 정상 </label>
							                       	</div>
							                      	<div class="form-check form-check-inline mt-3">
							                         	<input class="form-check-input" type="radio" name="cmpStatus" disabled="disabled" value="0" id="status2"  />
							                         	<label class="form-check-label" for="status2"> 중지 </label>
							                      	</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="mb-3 col-md-3">
													<div class="col-md">
														<div>
								                        	<small class="text-light fw-semibold">계정상태</small>
														</div>
								                       	<div class="form-check form-check-inline mt-3">
								                       		<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="1" id="status1"  />
								                           	<label class="form-check-label" for="status1"> 정상 </label>
								                       	</div>
								                      	<div class="form-check form-check-inline mt-3">
								                         	<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="0" id="status2" checked="checked" />
								                         	<label class="form-check-label" for="status2"> 중지 </label>
								                      	</div>
													</div>
												</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="mt-2">
									<button type="submit" class="btn btn-primary me-2">저장</button>
									<button type="reset" class="btn btn-outline-secondary heeCancel">취소</button>
								</div>
							</div>	
						</form>
					</div>
					<!-- /Account -->
				</div>
			</div>
		</div>
	</div>
</div>