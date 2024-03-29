<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>게시판</span>
					</div>
					<button class="btn btn-primary btn-compose"
						data-btn-location="/user/board/company/insert">게시글 등록</button>
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
						<a href="/WareBridge/user/board/company" class="menu-link"> <div class="sub-side-div">전사 게시판</div> </a>
						</li>
						<li class="menu-item">
							<a class="menu-link  menu-toggle"> 
								<div class="sub-side-div">팀 게시판</div> 
							</a>
							<ul class="menu-sub">
								<c:forEach items="${dptList}" var="dpt" varStatus="status">
									<li class="menu-item">
										<a href="/WareBridge/user/board/team?who=D${status.count}" class="menu-link">
											<div class="sub-sub-div">${dpt}</div>
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div class="card-body overflow-auto" id="inner-card-body" style="height: 82vh">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


