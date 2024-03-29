<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>캘린더</span>
					</div>
					<button class="btn btn-primary btn-compose">일정등록</button>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical ">
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link">
								<div class="sub-side-div">개인 일정</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">팀 일정</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="javascript:;" class="menu-link">
										<div class="sub-sub-div">팀1</div>
									</a>
								</li>
							</ul>
						</li>
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link">
								<div class="sub-side-div">전사 일정</div>
							</a>
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
					<div class="card-body" style="height: 82vh">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
