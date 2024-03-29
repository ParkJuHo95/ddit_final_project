<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	



<div id="inner-card-body" class="card-body py-1 overflow-auto" style="height: 82vh">
<form id="employeeForm" method="POST" enctype="multipart/form-data" >
	<!-- Content -->
	<div class="row"> 
		<!-- Account -->
		<h5 class="card-header">사원 상세정보</h5>
		<div class="card-body">	

			<div class="d-flex align-items-start align-items-sm-center gap-4">
<%-- 				<img src='<c:url value="/user/mypage/myInfo/imageView.do?empNo=0000"/>' class="d-block rounded profile_img img block" height="100" width="100" id="uploadedAvatar" /> --%>
				<spring:eval expression="@appInfo.empPicpath" var="empPath"/>
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
<!-- 									<p class="fofrm-text">JPG, GIF, PNG 확장자와 800KB 사이즈로 제한됩니다.</p> -->
			</div>
		</div>


		</div>
	</div>
	<hr class="my-0" />
	<div class="card-body">	
		<div class="">
			<div class="mb-3 col-md-3">
				<label for="empName" class="form-label">이름</label> 
				<input class="form-control" readonly type="text" id="empName" name="empName" value="${employee.empName}"  />
			</div>
			<div class="mb-3 col-md-3">
				<label for="empNo"  class="form-label">아이디(사번)</label> 
				<input class="form-control" readonly type="text" id="empNo" name="empNo" value="${employee.empNo }" />
			</div>
			<div class="mb-3 col-md-3">
				<label for="empCmpId" class="form-label">회사</label>
				<input type="text" readonly  class="form-control" id="empCmpId" name="empCmpId" value="${employee.empCmpId }" />
			</div>
			<div class="mb-3 col-md-3">
				<label for="empDptId1" class="form-label">부서</label>
				<select class="form-select" name="empDptId1">
						<option value>부서</option>
					<c:forEach items="${dptList }" var="dpt">
						<option value="${dpt.dptId }">${dpt.dptName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="mb-3 col-md-3">
				<label for="position" class="form-label">직책</label>
				<select class="form-select" name="empJobposition" >
						<option value>직책</option>
					<c:forEach items="${jobpositionList }" var="jp">
						<option value="${jp.prsName }" data-just-in-case="${jp.prsCode }">${jp.prsName }</option>
					</c:forEach>
				</select>
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
	                       		<input class="form-check-input" type="radio" name="empStatus" value="1" id="status1" checked="checked" />
	                           	<label class="form-check-label" for="status1"> 정상 </label>
	                       	</div>
	                      	<div class="form-check form-check-inline mt-3">
	                         	<input class="form-check-input" type="radio" name="empStatus" value="0" id="status2"  />
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
		                       		<input class="form-check-input" type="radio" name="empStatus" value="1" id="status1"  />
		                           	<label class="form-check-label" for="status1"> 정상 </label>
		                       	</div>
		                      	<div class="form-check form-check-inline mt-3">
		                         	<input class="form-check-input" type="radio" name="empStatus" value="0" id="status2" checked="checked" />
		                         	<label class="form-check-label" for="status2"> 중지 </label>
		                      	</div>
							</div>
						</div>
				</c:otherwise>
			</c:choose>
		</div>
			<div class="mt-2">
				<button type="submit" data-emp-no="${employee.empNo}"  class="btn btn-primary me-2 empSubmit" >저장</button>
				<button type="reset" class="btn btn-outline-secondary heeCancel">취소</button>
			</div>
		</div>	
	</form>
</div>
