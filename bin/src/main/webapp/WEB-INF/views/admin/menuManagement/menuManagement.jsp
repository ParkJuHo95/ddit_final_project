<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>메뉴 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link">
								<div class="sub-side-div">전자결재 관리</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">예약 관리</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/room" class="menu-link">
										<div class="sub-sub-div">시설 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/car" class="menu-link">
										<div class="sub-sub-div">차량 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/equip" class="menu-link">
										<div class="sub-sub-div">장비 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/bookList" class="menu-link">
										<div class="sub-sub-div">예약 조회</div>
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
					<div  id="inner-card-body" class="card-body" style="height: 82vh">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
