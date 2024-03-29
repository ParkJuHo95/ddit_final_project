<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>조직 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href='<c:url value="/admin/organization"/>' class="menu-link">
								<div class="sub-side-div">조직 설계</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/organization/personnelSystem"/>' class="menu-link">
								<div class="sub-side-div">직위체계</div>
							</a>
						</li>
						<li class="menu-item">
							<a href='<c:url value="/admin/organization/employeeList"/>' class="menu-link">
								<div class="sub-side-div">사원통합관리</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">일괄등록</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="<c:url value="/admin/organization/bulkDepartment"/>" class="menu-link">
										<div class="sub-sub-div">부서 일괄 등록</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<c:url value="/admin/organization/bulkPersonnelSystem"/>" class="menu-link">
										<div class="sub-sub-div">직위 일괄 등록</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<c:url value="/admin/organization/bulkEmployee"/>" class="menu-link">
										<div class="sub-sub-div">사원 일괄 등록</div>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card overflow-auto">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
					<h5>조직 설정</h5>
					<p> - 1회 클릭 시 하위 부서 열림/닫힘<br>
					 - 더블클릭 시 세부정보 가져오기
					</p>
					  <div class="col">
						<button type="button" class="btn btn-icon btn-outline-primary createBtn dptbtn" data-form-id="dpt">
							<span class="tf-icons bx bx-plus"></span>
						</button>
					  </div>
<%-- 					  ${deptSystemList } 아예 없어져 버림 어떠카지???--%>
					<!-- 	조직도 fancytree -->
					<div class="row">
						<div class="col-md-5 mb-3">
							<div id="deptTree">
	            <c:if test="${not empty deptSystemList }">
	            <ul id="treeData" style="display: none;">
					<c:forEach items="${deptSystemList }" var="dpt">
						<li id="${dpt.dptId}" class="folder">${dpt.dptName}
							<c:if test="${not empty dpt.childDptList }">
								<ul>
									<c:forEach items="${dpt.childDptList }" var="cDpt">
										<li id="${cDpt.dptId }" class="folder">${cDpt.dptName }
											<c:if test="${not empty cDpt.childDptList }">
												<ul>
													<c:forEach items="${cDpt.childDptList }" var="ccDpt">
														<li id="${ccDpt.dptId }" class="file">${ccDpt.dptName }</li>
													</c:forEach>
												</ul>
											</c:if>
										</li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>
				</ul>
				</c:if>	
				<c:if test="${empty deptSystemList }">
				설정된 부서 내용이 없습니다
				</c:if>	
<!-- 								<ul id="treeData" style="display: none;"> -->
<!-- 									<li id="SUP" class="folder">지원부 -->
<!-- 										<ul> -->
<!-- 											<li id="SUP-D01" class="folder">인사과 -->
<!-- 												<ul> -->
<!-- 													<li id="SUP-D01-01" class="file">교육팀</li> -->
<!-- 													<li id="SUP-D01-02" class="file">인사팀</li> -->
<!-- 												</ul></li> -->
<!-- 										<li id="SUP-D02" class="folder">총무과 -->
<!-- 											<ul> -->
<!-- 												<li id="SUP-D01-01" class="file">회계팀</li> -->
<!-- 												<li id="SUP-D01-02" class="file">시설관리팀</li> -->
<!-- 												<li id="SUP-D01-02" class="file">구매팀</li> -->
<!-- 											</ul></li> -->
<!-- 										<li id="SUP-D03" class="folder">법무과 -->
<!-- 											<ul> -->
<!-- 												<li id="SUP-D01-01" class="file">법무팀</li> -->
<!-- 											</ul></li> -->
<!-- 										</ul> -->
<!-- 									</li> -->
								
<!-- 								<li id="SER" class="folder">서비스부 -->
<!-- 									<ul> -->
<!-- 										<li id="SER-D01" class="folder">제품관리과 -->
<!-- 											<ul> -->
<!-- 												<li id="SER-D01-01" class="file">제품기획팀</li> -->
<!-- 												<li id="SER-D01-02" class="file">제품마케팅팀</li> -->
<!-- 											</ul></li> -->
<!-- 									<li id="SER-D02" class="folder">영업과 -->
<!-- 										<ul> -->
<!-- 											<li id="SER-D01-01" class="file">영업1팀</li> -->
<!-- 											<li id="SER-D01-02" class="file">영업2팀</li> -->
<!-- 										</ul></li> -->
<!-- 									</ul> -->
<!-- 								</li> -->
<!-- 									<li id="TF" class="folder">TF팀 -->
<!-- 										<ul> -->
<!-- 											<li id="ESG" class="file">ESG경영 TF -->
<!-- 											</li> -->
<!-- 											<li id="BI" class="file">비스니스혁신 TF -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</li> -->

							</div>
						</div>
						<!-- //	조직도 fancytree -->
						<div class="col-md-7 mb-3 table-responsive text-nowrap">
						 <form:form modelAttribute="dpt">
						  <table class="table">
						  <tr><th>구분</th><th>내용</th></tr>
							<tr><th>부서ID</th><td><form:input type="text" path="dptId" required="true" cssClass="form-control"/><form:errors path="dptId" cssClass="text-danger" /></td></tr>
							<tr><th>부서명</th><td><form:input type="text" path="dptName"  cssClass="form-control"/><form:errors path="dptName" cssClass="text-danger" /></td></tr>
							<tr><th>상위부서ID</th><td>
							<select class="form-select" name="dptParentdptid" id="dptParentdptid">
								<option value>상위부서</option>
								<c:forEach items="${dptList }" var="dpt">
									<option value="${dpt.dptName }" class="${dpt.dptId }">${dpt.dptName }</option>
								</c:forEach>
							</select>
							<tr><th>부서 전화번호</th><td><form:input type="text" path="dptLocalext"  cssClass="form-control"/><form:errors path="dptLocalext" cssClass="text-danger" /></td></tr>
<%-- 							<tr><th>부서장(사번)</th><td><form:input type="text" path="dptHead"  cssClass="form-control"/><form:errors path="dptHead" cssClass="text-danger" /></td></tr> --%>
							<tr><th>근무장소</th><td><form:input type="text" path="dptOffice"  cssClass="form-control"/><form:errors path="dptOffice" cssClass="text-danger" /></td></tr>
							<tr><td id="btnSpace" colspan="2" style="text-align: right;"><button type="submit" value="create" class="btn btn-primary dptbtn" data-form-id="psb">등록</button></td></tr>
							</table>
				  		 </form:form>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
