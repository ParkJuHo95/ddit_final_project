<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>주소록</span>
					</div>
					<button type="button" class="btn btn-primary btn-compose" data-btn-location="/user/address/prsnl/insertForm">주소록 등록</button>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href='<c:url value="/user/address" />' class="menu-link">
								<div class="sub-side-div">공용 주소록</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/user/address/prsnl" />' class="menu-link">
								<div class="sub-side-div">개인 주소록</div>
							</a>
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
					<div class="card-body" id="inner-card-body" style="height: 82vh">
						<h5 class="card-header">주소록</h5>
						  <form class="d-flex">
	                        <div class="input-group">
	                          <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	                          <input type="text" id="filter-text-box" oninput="onFilterTextBoxChanged()" class="form-control w-75" placeholder="빠른검색">
	                        </div>
	                      </form>
							<div id="pblcadbkGrid" class="ag-theme-quartz-auto-dark w-100" style="height: 500px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

