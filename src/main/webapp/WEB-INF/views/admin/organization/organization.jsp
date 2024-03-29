<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

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
					<p>조직도 fancytree 적용하기...</p>
					<!-- 	조직도 fancytree -->
						<div class="col-3">
							<div id="deptTree">
								<ul id="treeData" style="display: none;">
									<li id="SUP" class="folder">지원부
										<ul>
											<li id="SUP-D01" class="folder">인사과
												<ul>
													<li id="SUP-D01-01" class="file">교육팀</li>
													<li id="SUP-D01-02" class="file">인사팀</li>
												</ul></li>
										<li id="SUP-D02" class="folder">총무과
											<ul>
												<li id="SUP-D01-01" class="file">회계팀</li>
												<li id="SUP-D01-02" class="file">시설관리팀</li>
												<li id="SUP-D01-02" class="file">구매팀</li>
											</ul></li>
										<li id="SUP-D03" class="folder">법무과
											<ul>
												<li id="SUP-D01-01" class="file">법무팀</li>
											</ul></li>
										</ul>
									</li>
								
								<li id="SER" class="folder">서비스부
									<ul>
										<li id="SER-D01" class="folder">제품관리과
											<ul>
												<li id="SER-D01-01" class="file">제품기획팀</li>
												<li id="SER-D01-02" class="file">제품마케팅팀</li>
											</ul></li>
									<li id="SER-D02" class="folder">영업과
										<ul>
											<li id="SER-D01-01" class="file">영업1팀</li>
											<li id="SER-D01-02" class="file">영업2팀</li>
										</ul></li>
									</ul>
								</li>
									<li id="TF" class="folder">TF팀
										<ul>
											<li id="ESG" class="file">ESG경영 TF
											</li>
											<li id="BI" class="file">비스니스혁신 TF
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						<!-- //	조직도 fancytree -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
