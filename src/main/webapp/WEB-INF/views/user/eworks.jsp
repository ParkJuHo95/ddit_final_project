<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>전자결재</span>
					</div>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-compose" data-bs-toggle="modal" data-bs-target="#selectModal">
					  새 결재문서 작성
					</button>
					
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">상신 문서함</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">상신 결재 문서</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">임시 저장 문서</div>
									</a>
								</li>
							</ul>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">수신 문서함</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">결재 대기 문서</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">수신/참조 문서</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">결재 예정 문서</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">결재 완료 문서</div>
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
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
					
					전자결재main
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

