<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div id="inner-card-body" class="card-body" style="height: 82vh">
<!-- 	<div class="row " > 리스트 -->
		<div class="table-responsive text-nowrap" style="height: 90%;">
			<div class="col d-flex">
				<div class="">
					<h5>사원 통합관리</h5>
					<div class="mt-4 mb-4">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalScrollable">사원계정 등록</button>
<!-- 						<button  type="button"  class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#deleteAdmin"  >사원계정 삭제</button> -->
					</div>
				</div>
			</div>
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<td style="width: 50px"><input class="form-check-input" type="checkbox" onclick="selectAll(this)"></td>
						<th style="font-size: 14px;">No.</th>
	<!-- 					<th style="font-size: 18px;">No.</th> -->
						<th style="font-size: 18px;">이름</th>
						<th style="font-size: 18px;">사번(아이디)</th>
						<th style="font-size: 18px;">부서</th>
						<th style="font-size: 18px;">직책</th>
						<th style="font-size: 18px; ">이메일</th>
						<th style="font-size: 18px;">계정상태</th>
					</tr>
				</thead>
				<tbody class="table-border-bottom-0">
					<c:forEach items="${empList }" var="emp" varStatus="status">
						<tr>
							<td>
								<input class="form-check-input" type="checkbox" id="checkedEmp" data-checked-number="${emp.empNo }"> 
							</td>
							<td>${emp.rnum}</td>
							<td>
								${emp.empName}
							</td>
							<td>
								<a class="empView" data-emp-no="${emp.empNo}" href="#">${emp.empNo }</a> 
							</td>
							<td>${emp.empDptId1}</td>
							<td >${emp.empJobposition}</td>
							<td >${emp.empMail}</td>
							<td>
								<c:choose>
									<c:when test="${emp.empStatus eq '1'}">
										 <strong class="badge bg-label-primary me-1">정상</strong>
									</c:when>
									<c:otherwise>
										<strong class="badge bg-label-warning me-1">중지</strong>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
<!-- 	</div> 리스트 -->
	
	<div> <!-- 페이징 & 검색조건 -->
		<form id="searchForm" method="get" action='<c:url value="/admin/organization/employeeList"/>' >
			<input type="hidden" name="page" placeholder="page"/>
			<input type="hidden" name="dptName" placeholder="searchType"/>
			<input type="hidden" name="prsName" placeholder="searchType"/>
			<input type="hidden" name="empName" placeholder="searchWord"/>
		</form>
		<div data-pg-role="searchUI" data-pg-target="#searchForm" class="d-flex">
			<div class="col-1">	
				<select class="form-select" name="dptName" data-pg-init-value="${condition.dptName }">
					<option value>부서</option>
					<c:forEach items="${dptList }" var="dpt">
						<option value="${dpt.dptName }">${dpt.dptName }</option>
					</c:forEach>
				</select>
			</div>
			<div  class="col-1 d-flex align-items-start">
				<select class="form-select col-3" name="prsName" data-pg-init-value="${condition.prsName }">
					<option value>직책</option>
					<c:forEach items="${jobpositionList }" var="jp">
						<option value="${jp.prsName }" class="${jp.prsCode }">${jp.prsName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-2">
				<input type="text" class="form-control" name="empName" placeholder="사원명"  />
			</div>
			<div class="col-1">
				<button class="btn btn-outline-primary" data-pg-role="searchBtn">검색</button>
			</div>
			<div id="pagingArea" class="col-3 d-flex">
				${pagingHTML }
			</div>
		</div>
	</div> <!-- 페이징 & 검색조건 -->
	
	
	<!-- Modal content-->
	<div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable" role="document">
        <form id="regiEmpForm" method="POST" enctype="multipart/form-data" >
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h5 class="modal-title" id="modalScrollableTitle">사원정보 입력</h5>
	        <button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close" ></button>
	      </div>
	      <hr class="my-3" />
	      <div class="modal-body">
				<!-- Content -->
				<div class="row"> 
					<!-- Account -->
					<div class="card-body">	
						<div class="d-flex align-items-start align-items-sm-center gap-4">
							<spring:eval expression="@appInfo.empPicpath" var="empPath"/>
							<c:if test="${empty employee.empPicpath}">
							    <img height="100" width="100" src="<c:url value='/resources/files/default_profile.png'/>" class="uploadedAvatar" id="uploadedAvatar">
							</c:if>
							<c:if test="${not empty employee.empPicpath}">
								<img height="100" width="100" src="<c:url value='${empPath }${employee.empPicpath}'/>" class="uploadedAvatar" id="uploadedAvatar">
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
							</div>
						</div>
			
					</div>
				</div>
			<hr class="my-4" />
				<div class="card-body">	
						<div class="row">
							<div class="mb-3 col-md-10">
								<label for="insertEmpName" class="form-label">이름</label> 
								<input class="form-control"  type="text" id="insertEmpName" name="empName" value="${employee.empName}"  />
							</div>
							<div class="mb-3 col-md-10">
								<label for="insertEmpNo"  class="form-label">아이디(사번)</label> 
								<input class="form-control"  type="text" id="insertEmpNo" name="empNo" value="${employee.empNo }" />
							</div>
							<div class="mb-3 col-md-10">
								<label for="insertEmpDptId1" class="form-label">부서</label>
								<select class="form-select" id="insertEmpDptId1" name="empDptId1">
										<option value>부서</option>
									<c:forEach items="${dptList }" var="dpt">
										<option value="${dpt.dptId }">${dpt.dptName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="mb-3 col-md-10">
								<label for="insertEmpJobposition" class="form-label">직책</label>
								<select class="form-select" id="insertEmpJobposition" name="empJobposition" >
										<option value>직책</option>
									<c:forEach items="${jobpositionList }" var="jp">
										<option value="${jp.prsName }" data-just-in-case="${jp.prsCode }">${jp.prsName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="mb-3 col-md-10">
								<label for="insertEmpMail" class="form-label">이메일</label> 
								<input class="form-control" type="text" id="insertEmpMail" name="empMail" value="${employee.empMail }"  />
								<span class="text-danger">${errors.empMail}</span>
							</div>
							<div class="mb-3 col-md-10">
								<label class="form-label" for="insertEmpMobile">휴대폰번호</label>
								<input type="text" id="insertEmpMobile" name="empMobile" class="form-control" value="${employee.empMobile }"/>
								<span class="text-danger">${errors.empMobile}</span>
							</div>
							<div class="mb-3 col-md-10">
								<label for="insertEmpCmptelno" class="form-label">내선번호</label> 
								<input type="text" class="form-control" id="insertEmpCmptelno" name="empCmptelno" value="${employee.empCmptelno }" />
								<span class="text-danger">${errors.empCmptelno}</span>
							</div>
							<div class="mb-3 col-md-10">
								<div class="col-md">
									<div>
			                        	<label for="status1" class="form-label">계정상태</label>
									</div>
		                        	<div class="form-check form-check-inline mt-1">
		                        		<input class="form-check-input" type="radio" name="empStatus" value="1" id="status1" checked="">
	                           		 	<label class="form-check-label" for="status1"> 정상 </label>
		                         	</div>
		                         	<div class="form-check form-check-inline mt-1">
		                            	<input class="form-check-input" type="radio" name="empStatus" value="0" id="status2"  >
		                            	<label class="form-check-label" for="status2"> 중지 </label>
		                         	</div>
								</div>
							</div>
						</div>
					</div>	
			<!-- /Account -->
					</div>
					<div class="modal-footer">
						<button type="button" id="insertEmpData"  class="btn btn-secondary">시연용 데이터</button>
						<button type="submit" id="myModal"  class="btn btn-primary">등록</button>
				        <button type="button" id ="cancelRegi" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
					</div>
	    		</div>
			</form>
  		</div>
	</div>	
	<!-- Button ModalScrollable -->
</div>
