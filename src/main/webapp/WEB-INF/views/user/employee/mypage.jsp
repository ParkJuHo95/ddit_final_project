<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	


<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>마이페이지</span>
					</div>
					<!-- 					<button class="btn btn-primary btn-compose">내정보</button> -->
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner ">
						<li class="menu-item active">
							<a href='<c:url value="/user/mypage/myInfo"/>' class="menu-link">
								<div class="sub-side-div">내정보</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/user/mypage/faceLogin"/>' class="menu-link">
								<div class="sub-side-div">얼굴인식 설정</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='/WareBridge/user/mypage/dietCalendar'  class="menu-link">
								<div class="sub-side-div">점심메뉴 추천</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='/WareBridge/user/mypage/certificate'  class="menu-link">
								<div class="sub-side-div">자격증 추천</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='/WareBridge/user/mypage/bookrecom'  class="menu-link">
								<div class="sub-side-div">도서 추천</div>
							</a>
						</li>
					</ul>
					<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div id="inner-card-body" class="card-body py-1 overflow-auto" style="height: 82vh">
					<form id="mypageForm"  method="POST" enctype="multipart/form-data" onsubmit="submitForm(event);">
						<!-- Content -->
						<div class="row"> 
							<!-- Account -->
							<h5 class="card-header">내정보</h5>
							<div class="card-body">	
								<div class="d-flex align-items-start align-items-sm-center gap-4">
<%-- 									<img src='<c:url value="/user/mypage/myInfo/imageView.do?empNo=0000"/>' class="d-block rounded profile_img img block" height="100" width="100" id="uploadedAvatar" /> --%>
										<spring:eval expression="@appInfo.empPicpath" var="empPath"/>
<%-- 										<spring:eval expression="@appInfo.empPicpath" var="empPath"/> --%>
										<c:if test="${empty employee.empPicpath}">
										    <img height="100" width="100" src="<c:url value='/resources/files/default_profile.png'/>" class="uploadedAvatar profileImg" id="uploadedAvatar">
										</c:if>
										<c:if test="${not empty employee.empPicpath}">
											<img height="100" width="100" src="data:image/png;base64,${employee.base64}" class="uploadedAvatar profileImg" id="uploadedAvatar">
										</c:if>
									<div class="button-wrapper">
										<label for="profileFile" class="btn btn-primary me-2 mb-4" tabindex="0"> 
											<span class="d-none d-sm-block">프로필사진 변경</span> 
											<i class="bx bx-upload d-block d-sm-none"></i> 
											<input type="file" id="profileFile" name="profileFile" class="account-file-input profileFile" hidden onclick="profileImg();"/>
										</label>
										<button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
											<i class="bx bx-reset d-block d-sm-none"></i>
											<span class="d-none d-sm-block">삭제</span>
										</button>
	<!-- 									<p class="form-text">JPG, GIF, PNG 확장자와 800KB 사이즈로 제한됩니다.</p> -->
									</div>
								</div>
							</div>
						</div>
					<hr class="my-0" />
						<div class="card-body">	
							
								<div class=""> <!-- class="row" 주석 -->
									<div class="mb-3 col-md-3">
										<label for="empName" class="form-label">이름</label> 
										<input class="form-control" readonly type="text" id="empName" name="empName" value="${employee.empName}"  />
									</div>
									
									<div class="mb-3 col-md-3">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#empChangePw">비밀번호 변경</button>
									</div>

									<div class="mb-3 col-md-3">
										<label for="empNo"  class="form-label">아이디(사번)</label> 
										<input class="form-control" readonly type="text" id="empNo" name="empNo" value="${employee.empNo }" />
									</div>
									<div class="mb-3 col-md-3">
										<label for="empCmpId" class="form-label">회사</label>
										<input type="text" readonly class="form-control" id="empCmpId" name="empCmpId" value="${employee.empCmpId }" />
									</div>
									<div class="mb-3 col-md-3">
										<label for="empDptId1" class="form-label">부서</label>
										<input type="text" readonly class="form-control" id="empDptId1" name="empDptId1" value="${employee.empDptId1 }" />
										<input type="text" readonly class="form-control" id="empDptId2" name="empDptId2" value="${employee.empDptId2 }" placeholder="TaskForce Team" />
									</div>
									<div class="mb-3 col-md-3">
										<label for="position" class="form-label">직위</label>
										<input type="text" readonly class="form-control" id="position" name="position" value="${employee.empJobposition }" />
									</div>
									<div class="mb-3 col-md-3">
										<label for="empMail" class="form-label">이메일</label> 
										<input class="form-control" type="text" id="empMail" name="empMail" value="${employee.empMail }"  />
										<span class="text-danger">${errors.empMail}</span>
									</div>
									<div class="mb-3 col-md-3">
										<label class="form-label" for="empMobile">휴대폰번호</label>
										<input type="text" id="empMobile" name="empMobile" class="form-control" value="${employee.empMobile }"/>
										<span class="text-danger">${errors.empMobile}</span>
									</div>
									<div class="mb-3 col-md-3">
										<label for="empCmptelno" class="form-label">내선번호</label> 
										<input type="text" class="form-control" id="empCmptelno" name="empCmptelno" value="${employee.empCmptelno }" />
										<span class="text-danger">${errors.empCmptelno}</span>
									</div>
									
									
									<c:choose>
										<c:when test="${employee.empStatus eq '1' }">
											<div class="mb-3 col-md-3">
												<div class="col-md">
													<div>
							                        	<small class="text-light fw-semibold">계정상태</small>
													</div>
							                       	<div class="form-check form-check-inline mt-3">
							                       		<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="1" id="status1" checked="checked" />
							                           	<label class="form-check-label" for="status1"> 정상 </label>
							                       	</div>
							                      	<div class="form-check form-check-inline mt-3">
							                         	<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="0" id="status2"  />
							                         	<label class="form-check-label" for="status2"> 중지 </label>
							                      	</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="mb-3 col-md-3">
													<div class="col-md">
														<div>
								                        	<small class="text-light fw-semibold">계정상태</small>
														</div>
								                       	<div class="form-check form-check-inline mt-3">
								                       		<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="1" id="status1"  />
								                           	<label class="form-check-label" for="status1"> 정상 </label>
								                       	</div>
								                      	<div class="form-check form-check-inline mt-3">
								                         	<input class="form-check-input" type="radio" name="empStatus" disabled="disabled" value="0" id="status2" checked="checked" />
								                         	<label class="form-check-label" for="status2"> 중지 </label>
								                      	</div>
													</div>
												</div>
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="mt-2">
									<button type="submit" class="btn btn-primary me-2" >저장</button>
									<button type="reset" class="btn btn-outline-secondary heeCancel">취소</button>
								</div>
							</div>	
					<!-- /Account -->
						</form>
						
						<!-- mypage  비밀번호 변경 모달 -->
						<div class="modal fade" id="empChangePw" tabindex="-1" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="modalCenterTitle">비밀번호 변경</h5>
						        <button  type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      	<form id="changePwForm" onsubmit="submitPw(event);" >
						      		<div class="modal-body">
						        		<div class="col-10 mb-3">
							            	<label for="currentPw" class="form-label">현재 비밀번호</label>
							            	<input type="password" name="currentPw"  id="currentPw" class="form-control myPassCheck" placeholder="현재 비밀번호를 입력해주세요." />
							            	<span  id="currentPwMsg"></span>
							          	</div>
							          	<div class="col-10 mb-3">
							            	<label for="newPw1" class="form-label">새 비밀번호</label>
							            	<input type="password" name="newPw"  id="newPw" class="form-control myPassCheck" placeholder="새 비밀번호를 입력해주세요." />
							          	</div>
							          	<div class="col-10 mb-3">
							            	<label for="empPass" class="form-label">새 비밀번호 확인</label>
							            	<input type="password" name="empPass"  id="empPass" class="form-control myPassCheck" placeholder="새 비밀번호를 다시 입력해주세요." />
							            	<span id="empPassMsg"></span>
							          	</div>
						      		</div>
						      <div class="modal-footer">
						        <button id="pwSaveModal"type="submit"   class="btn btn-primary">변경</button>
						       	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
						      </div>
						       	</form>
						       	<form action="/WareBridge/logout" method="post" style="display:none;">
						       		<button type="submit" id="btnLogout">로그아웃</button>
						       	</form>
						    </div>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>