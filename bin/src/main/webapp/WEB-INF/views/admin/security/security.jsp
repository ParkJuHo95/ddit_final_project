<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>보안 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href='<c:url value="/admin/security"/>' class="menu-link">
								<div class="sub-side-div">관리권한 설정</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/security/initPw"/>' class="menu-link">
								<div class="sub-side-div">초기비밀번호 설정</div>
							</a>
						</li>
<!-- 						<li class="menu-item"> -->
<%-- 							<a href='<c:url value="/admin/security/changePw"/>' class="menu-link"> --%>
<!-- 								<div class="sub-side-div">비밀번호 변경</div> -->
<!-- 							</a> -->
<!-- 						</li> -->
						<li class="menu-item">
							<a href='<c:url value="/admin/security/logList"/>' class="menu-link">
								<div class="sub-side-div">사원 로그 조회</div>
							</a>
						</li>
					</ul>
<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
						<div class="table-responsive text-nowrap" style="height: 90%;">
			                <h5 class="card-header">사내관리자</h5>
   							<div class="mt-2 mb-4">
								<button type="button"  class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#insertAdmin">추가</button>
								<button  type="button"  class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#deleteAdmin"  >삭제</button>
							</div>
			                <div class="table-responsive text-nowrap">
			                  <table class="table border-top"  style="text-align: center;">
			                    <thead>
			                      <tr>
			                        <th><input onclick="selectAll(this);" class="form-check-input"  type="checkbox" value="" ></th>
			                        <th>관리자</th>
			                        <th>부서</th>
			                        <th>직위</th>
			                        <th>변동일</th>
<!-- 			                        <th>관리자 해제일</th> -->
			                        <th>부여자</th>
			                      </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${adminList }" var="admin">
			                    		<tr>
					                        <td><input  class="form-check-input" type="checkbox" value="" ></td>
					                        <td>
					                        	<a href="#" class="empView" data-emp-no="${admin.admTo }">${admin.admToName }</a>
					                        </td>
					                        <td>${admin.dptName }</td>
					                        <td>${admin.empJobposition }</td>
					                        <td>${admin.admDat }</td>
<%-- 					                        <td>${admin.empJobposition }</td> --%>
					                        <td>
					                        	<a href="#" class="empView"  data-emp-no="${admin.admFrom }">${admin.admFromName }</a>
				                        	</td>
					                      </tr>
			                    	</c:forEach>
			                    </tbody>
			                  </table>
			                </div>
	              		</div>
		                <hr>
		                <div > <!-- 페이징 & 검색조건 -->
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
								<div class="col-1 d-flex align-items-start">
									<select class="form-select col-3" name="prsName" data-pg-init-value="${condition.prsName }">
										<option value>직위</option>
										<c:forEach items="${prsList }" var="prs">
											<option value="${prs.prsName }" class="${prs.prsCode }">${prs.prsName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-2 ">
									<input type="text" class="form-control" name="empName" placeholder="사원명"  value="${condition.empName }"/>
								</div>
								<div class="col-1 ">
									<button class="btn btn-outline-primary" data-pg-role="searchBtn">검색</button>
								</div>
								<div id="pagingArea" class="col-3 d-flex">
									${pagingHTML }
								</div>
							</div>
						</div> <!-- 페이징 & 검색조건 -->
	              		
	              		<!-- 사내관리자 추가 모달 -->
	              		<div class="modal fade" id="insertAdmin" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel3">사내관리자 추가</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              
                              <form class="d-flex">
	                      			<div class="input-group">
	                         			<span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	                          		<input type="text" id="filter-text-box" oninput="onFilterTextBoxChanged()" class="form-control w-75" placeholder="빠른검색">
	                        	</div>
   								</form>
         							<div id="pblcadbkGrid" class="ag-theme-quartz-auto-dark w-100" style="height:500px;"></div>
                              
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary insertAdminBtn" data-bs-dismiss="modal">추가</button>
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                          </div>
                        </div>
                      </div>
					<!-- /사내관리자 추가 모달 -->
						
						<!-- 사내관리자 삭제 모달 -->
						<div class="modal fade" id="deleteAdmin" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
						    	<div class="modal-content">
						      		<div class="modal-header">
						        		<h5 class="modal-title" id="modalCenterTitle">사내관리자 권한 삭제</h5>
						        		<button  type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
							      	<form id="changePwForm" action='<c:url value="/admin/security/authority"/>' >
						      			<div class="modal-body">
							        		<div class="col mb-3">
								            	김다우님의 관리자 권한을 정말로 삭제하시겠습니까?
								          	</div>
							      		</div>
								      	<div class="modal-footer">
								        	<button type="submit" class="btn btn-primary">삭제</button>
								        	<button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
							      		</div>
							       	</form>
						    	</div>
						  	</div>
						</div>
						<!-- /사내관리자 삭제 모달 -->
						
					</div>	<!-- /inner-body-card -->
				</div>
			</div>
		</div>
	</div>
</div>