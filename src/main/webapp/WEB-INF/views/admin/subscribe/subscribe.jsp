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

						<h5>현재 구독중인 상품</h5>
						<div class="bs-stepper-content">
						    <form id="wizard-create-deal-form" onsubmit="return false">
						     	<div id="deal-type" class="content active dstepper-block fv-plugins-bootstrap5 fv-plugins-framework">
							        <div class=" g-3">
							          <div class="border border-primary col-12 mb-5">
						            <img src="<c:url value="/resources/files/shopping-girl-light.png"/>" class="img-fluid w-100 border rounded-2" alt="shopping girl" data-app-dark-img="illustrations/shopping-girl-dark.png" data-app-light-img="illustrations/shopping-girl-light.png">
							          </div>
							          <div class="col-12 mb-5">
							            <div class="row">
							              <div class="col-md mb-md-0 mb-2 ">
							                <div class="form-check custom-option custom-option-icon">
							                  <label class="form-check-label custom-option-content" for="customRadioPercentage">
							                    <span class="custom-option-body">
							                      <i class="bx bx-user"></i>
							                      <span class="custom-option-title ">Light (1인 ~ 30인)</span>
							                    </span>
							                    <input name="customRadioIcon" class="form-check-input" type="radio" value="" disabled  id="customRadioPercentage" >
							                  </label>
							                </div>
							              </div>
							              <div class="col-md mb-md-0 mb-2">
							                <div class="form-check custom-option custom-option-icon">
							                  <label class="form-check-label custom-option-content" for="customRadioFlat">
							                    <span class="custom-option-body">
							                      <i class="bx bx-user"></i>
							                      <span class="custom-option-title"> Basic (31인 ~ 100인) </span>
							                    </span>
							                    <input name="customRadioIcon" class="form-check-input" type="radio" value="" checked="" disabled id="customRadioFlat">
							                  </label>
							                </div>
							              </div>
							              <div class="col-md mb-md-0 mb-2">
							                <div class="form-check custom-option custom-option-icon">
							                  <label class="form-check-label custom-option-content" for="customRadioPrime">
							                    <span class="custom-option-body">
							                      <i class="bx bx-user"></i>
							                      <span class="custom-option-title"> Pro (101인 ~ 무제한)</span>
							                    </span>
							                    <input name="customRadioIcon" class="form-check-input" type="radio" value="" disabled id="customRadioPrime">
							                  </label>
							                </div>
							              </div>
							            </div>
							          </div>
							          <div class="col-sm-3 fv-plugins-icon-container mb-5">
							            <label class="form-label" for="dealAmount">이용일</label>
							            <input type="text" name="dealAmount" id="dealAmount" disabled class="form-control" value="2024년 4월 1일     ~     2025년 4월 1일" aria-describedby="dealAmountHelp">
<!-- 							            <div id="dealAmountHelp" class="form-text">Enter the discount percentage. 10 = 10%</div> -->
							          </div>
							          <div class="col-sm-2 fv-plugins-icon-container mb-4">
							            <label class="form-label" for="dealRegion">다음 결제일</label>
							            <input type="text" name="dealAmount" id="dealAmount" disabled class="form-control" value="2025년 4월 1일" aria-describedby="dealAmountHelp">
							          </div>
<!-- 							          <div class="col-12 d-flex justify-content-between"> -->
<!-- 							            <button class="btn btn-label-secondary btn-prev" disabled=""> <i class="bx bx-chevron-left bx-sm ms-sm-n2"></i> -->
<!-- 							              <span class="align-middle d-sm-inline-block d-none">다운그레이드</span> -->
<!-- 							            </button> -->
<!-- 							            <button class="btn btn-primary btn-next"> -->
<!-- 							              <span class="align-middle d-sm-inline-block d-none me-sm-1">업그레이드</span> -->
<!-- 							              <i class="bx bx-chevron-right bx-sm me-sm-n2"></i> -->
<!-- 							            </button> -->
<!-- 							          </div> -->
							        </div>
					      </div>
								</form>
					      </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
