<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<nav
	class="layout-navbar container-fluid navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
	id="layout-navbar">

	<div class="navbar-nav-right col d-flex align-items-center"
		id="navbar-collapse">
		<div class="col-1"></div>
		<div class="alramNoticeDIV col-9">
			<span class="lineUp">
			</span>
		</div>
		<div class="col-2 align-items-end ms-5">
			<ul class="navbar-nav flex-row align-items-center ms-auto">
				<li class="nav-item navbar-dropdown dropdown-user dropdown">
					<div class="avatar nav-link hide-arrow w-px-50 h-auto" data-bs-toggle="modal" data-bs-target="#orgModal">
						 <img src="<%=request.getContextPath()%>/resources/icons/diagram.png"
								alt=""  />
					</div>
				</li>
				<li class="nav-item navbar-dropdown dropdown-user dropdown">
					<a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
						<div class="avatar">
							<img src="<%=request.getContextPath()%>/resources/icons/AiIcon.png"
								alt="" class="w-px-30 h-auto rounded-circle" />
						</div>
					</a>
					<ul id="header-dropdown" class="dropdown-menu dropdown-menu-end">
						<li>
							<a class="dropdown-item home-ai-link" href="#" data-ai-location="/WareBridge/user/mypage/dietCalendar"> 
								<span class="align-middle">점심메뉴</span>
							</a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li>
							<a class="dropdown-item home-ai-link" href="#" data-ai-location="/WareBridge/user/mypage/certificate"> 
								<span class="align-middle">자격증</span>
							</a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li>
							<a class="dropdown-item home-ai-link" href="#" data-ai-location="/WareBridge/user/mypage/bookrecom"> 
								<span class="align-middle">도서</span>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item navbar-dropdown dropdown-user dropdown">
					<a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-auto-close="outside" data-bs-toggle="dropdown">
						<div class="avatar" id="alramExistenceCheck">
							<img src="<%=request.getContextPath()%>/resources/icons/bell.png"
								alt="" class="w-px-30 h-auto rounded-circle" />
						</div>
					</a>
					<ul id="header-alram-dropdown" class="dropdown-menu dropdown-menu-end" >
						<li>
							<a class="dropdown-item alram-log-all-remove" href="#"> 
								전체 지우기
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item navbar-dropdown dropdown-user dropdown">
					<a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
						<div class="avatar">
							<img
								src="<%=request.getContextPath()%>/resources/icons/circle-user.png"
								alt="" class="w-px-30 h-auto rounded-circle" />
						</div>
					</a>
					<ul id="header-dropdown" class="dropdown-menu dropdown-menu-end">
						<li>
							<a id="header-mypage" class="dropdown-item" href="<%=request.getContextPath()%>/user/mypage/myInfo"> 
								<i class="bx bx-user me-2"></i> <span class="align-middle">마이페이지</span>
							</a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/home"> 
									<i class="bx bx-user me-2"></i> <span class="align-middle">관리자페이지</span>
								</a>
							</li>
							<li>
								<div class="dropdown-divider"></div>
							</li>
				        </security:authorize>
						<li>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/logout"> 
								<i class="bx bx-power-off me-2"></i> 로그아웃
							</a> 
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
