<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>조직 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item">
							<a href='<c:url value="/admin/organization"/>' class="menu-link">
								<div class="sub-side-div">조직 설계</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/organization/personnelSystem"/>' class="menu-link">
								<div class="sub-side-div">직위체계</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/organization/employeeList"/>' class="menu-link">
								<div class="sub-side-div">사원통합관리</div>
							</a>
						</li>
						<li class="menu-item active open">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">일괄등록</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item active">
									<a href="<c:url value="/admin/organization/bulkDepartment"/>" class="menu-link">
										<div class="sub-sub-div">부서 일괄 등록</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<c:url value="/admin/organization/bulkPersonnelSystem"/>" class="menu-link">
										<div class="sub-sub-div">직위 일괄 등록</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<c:url value="/admin/organization/bulkEmployee"/>" class="menu-link">
										<div class="sub-sub-div">사원 일괄 등록</div>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card overflow-auto">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
					<h5>직위 일괄등록</h5>
					<!-- Account -->
					<div class="">
						<div class="d-flex align-items-start align-items-sm-center gap-4">
				<!-- 			my-4 = 간격 -->
							<div class="my-4"> 
								<p id="download_form" class="btn_minor_s btn_sample_down">
									<span class="separator">|</span>
									<span class="txt">샘플양식 다운로드</span>
								</p>
								<p class="desc ">
									샘플양식을 다운로드 후<br>형식에 맞게 내용을 수정하여 일괄등록할 수 있습니다.
								</p>
							</div>
							<div class="col row d-flex">
								<div class="col-4">
									<a href="<c:url value='/admin/organization/bulkPersonnelSystem.jsp/downloadSample'/>">
										<span class="btn btn-primary btn-lg me-2 mb d-none d-sm-block">엑셀 파일 다운로드</span> 
									 </a>
								</div>
							</div>
						</div>
					</div>
					<hr class="my-0" />
					<br>
					<div class="">
						<div class="align-items-start align-items-sm-center gap-4">
							<div class="my-2">
								<p id="download_form" class="btn_minor_s btn_sample_down">
									<span class="separator">|</span>
									<span class="txt">부서 일괄등록</span>
								</p>
								<p class="desc">
									다운받은 엑셀 파일 양식에 맞추어 등록한 신규 부서를 생성합니다.
								</p>
							</div>
							<form method="POST" onsubmit="bulkEmployee(event);" enctype="multipart/form-data">
								<div class="col row d-flex">
					                <div class="col-6 mb-4">
										<div class="input-group">
					                        <input type="file" class="form-control" name="excelFile" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
					                        <button class="btn btn-outline-primary" type="submit" id="inputGroupFileAddon03">업로드</button>
					                     </div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<hr class="my-3" />
					<div class="" id="resultArea">
						<div class="align-items-start align-items-sm-center gap-4">
							<div class="my-2">
				    			<p id="download_form" class="btn_minor_s btn_sample_down">
									<span class="separator">|</span>
									<span class="txt">직위 일괄등록 결과</span>
								</p>
				   				<p class="desc">파일 업로드 후 아래 화면에서 등록 결과를 확인 할 수 있습니다.</p>
				   				<div class="col-6 mb-4 " id="resultDetail">
				   				
				   				
								</div>
							</div>
						</div>
					<!-- /Account -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>