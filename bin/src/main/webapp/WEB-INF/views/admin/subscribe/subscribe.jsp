<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    


<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>구독 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href='<c:url value="/admin/subscribe/subsList"/>' class="menu-link">
								<div class="sub-side-div">구독상품 조회</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/subscribe/insertSubs"/>' class="menu-link">
								<div class="sub-side-div">구독상품 결제</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/subscribe/pay"/>' class="menu-link">
								<div class="sub-side-div">결제내역 조회</div>
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
					<div id="inner-card-body" class="card-body" style="height: 82vh">

						<div class="card mb-4">
						      <!-- Current Plan -->
						      <h5 class="card-header">현재 구독상품</h5>
						      <div class="card-body">
						        <div class="row">
						          <div class="col-md-6 mb-1">
						            <div class="mb-4">
						              <h6 class="mb-2">현재 구독중인 상품은 prod.prodName}입니다.</h6>
<!-- 						              <p>A simple start for everyone</p> -->
						            </div>
						            <div class="mb-4">
						              <h6 class="mb-2">만료일 : {subs.subsEnd}</h6>
						              <p>만료일 3일전에 알림을 보내드립니다.</p>
						            </div>
						            <div class="mb-4">
						              <h6 class="mb-2"><span class="me-2">연 ${prod.prodPrice}원</span> <span class="badge bg-label-primary">Popular</span></h6>
						              <p>Standard plan for small to medium businesses</p>
						            </div>
						          </div>
						          <div class="col-md-6 mb-1">
						            <div class="alert alert-warning mb-4" role="alert">
						              <h6 class="alert-heading mb-1">We need your attention!</h6>
						              <span>Your plan requires update</span>
						            </div>
						            <div class="plan-statistics">
						              <div class="d-flex justify-content-between">
						                <span class="fw-medium mb-2">구독</span>
						                <span class="fw-medium mb-2">{subs.subsEnd}</span>
						              </div>
						              <div class="progress">
						                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
						              </div>
						              <p class="mt-1 mb-0">6 days remaining until your plan requires update</p>
						            </div>
						          </div>
						          <div class="col-12">
						            <button class="btn btn-primary me-2 mt-2" data-bs-toggle="modal" data-bs-target="#pricingModal">Upgrade Plan</button>
						            <button class="btn btn-label-secondary cancel-subscription mt-2">Cancel Subscription</button>
						          </div>
						        </div>
						      </div>
						      <!-- /Current Plan -->
						    </div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
