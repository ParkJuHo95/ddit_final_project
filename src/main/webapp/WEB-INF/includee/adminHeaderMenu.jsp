<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<nav class="layout-navbar container-fluid navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar" >
	<div class="	navbar-nav-right d-flex align-items-center" id="navbar-collapse">
		<ul class="navbar-nav flex-row align-items-center ms-auto">
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
				<a class="nav-link dropdown-t	oggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
					<div class="avatar">
						<img src="<%=request.getContextPath()%>/resources/icons/circle-user.png" alt class="w-px-30 h-auto rounded-circle" />
					</div>
				</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/user/home">
							<i class="bx bx-user me-2"></i>
							<span class="align-midd	le">사용자 페이지</span>
						</a>
					</li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/logout"> 
						<i class="bx bx-power-off me-2"></i> 로그아웃
						</a> 
					</li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
