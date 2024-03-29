<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div id="inner-card-body" class="card-body" style="height: 82vh; overflow-y: auto;">
	<h4 class="card-header mb-0">결재문서 작성</h4>
	<form:form modelAttribute="sdc">
		<div id="hiddenInfo">
		<form:hidden path="sdcSfId" />
<%-- 		<form:hidden path="snctline.slId" /> --%>
		</div>
		<div class="btn-toolbar demo-inline-spacing justify-content-end"
			role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group, text-end mb-3" role="group"
				aria-label="First group">
				<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/N">문서상신</button>
				<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/Y">임시저장</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" data-trigger="hover">결재정보</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#selectSnctLineModal">결재선</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#docDatailModal">문서정보 </a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#docReceiverModal">수신</a></li>
				</ul>
			</div>
		</div>
			
		<table class="snctInfoTable">
			<!-- Header -->
			<tbody>
				<tr>
					<td class="snctFormName" colspan="2" >${sdc.snctform.sfName }</td>
				</tr>
				<tr>
					<td class="snctIntro">
						<table class="snctWriter">
							<tbody>
								<tr>
									<td class="ths">기안자</td>
									<td class="tds">${realUser.empName }</td>
								</tr>
								<tr>
									<td class="ths">부서</td>
									<td class="tds">${realUser.department.dptName }</td>
								</tr>
								<tr>
									<td class="ths">기안일</td>
									<td class="tds">상신 시 자동 생성</td>
								</tr>
								<tr>
									<td class="ths">문서번호</td>
									<td class="tds">최종승인 시 자동 생성</td>
								</tr>
							</tbody>
						</table>

					</td>
					<td class="snctLine"></td>
				</tr>
				<tr>
					<td colspan="2"> <br>
					<div class="input-group">
                       <div class="input-group-text">
                         <form:checkbox path="sdcEmrgcyyn" class="form-check-input mt-0" label="긴급" value="Y"/>
                       </div>
                       <div class="input-group-text">
                         제목 : 
                       </div>
                       <input type="text" id="sdcTitle" name="sdcTitle" class="form-control" value="${sdc.snctform.sfName }" data-trial-set="전자결재 시연하기">
                     </div>
					
					</td>
				</tr>
			</tbody>
		</table>
			
		<div class="mb-3">
			<div class="mt-3">
				<textarea id="ckeditor-editor" name="sdcContent" data-trial-set="결재문서 내부 내용">
				${sdc.snctform.sfForm }
				</textarea>

			</div>
		</div>
		<div class="mb-3">
			<label for="attachment" class="form-label">첨부 파일</label>
			<input type="file" class="form-control" id="attachment" name="attachment">
		</div>
		<div class="text-end mb-3">
			<button type="button" class="btn btn-outline-primary trial1">기안서</button>
			<button type="button" class="btn btn-outline-primary trial2">휴가신청서</button>
			<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/N">문서상신</button>
			<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/Y">임시저장</button>
		</div>
	</form:form>
	
	<!-- 전자결재 결재선 설정 모달 -->
	<div class="modal fade" id="selectSnctLineModal" tabindex="-1" style="display: none;" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="selectSnctLineModalLabel">결재선 설정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	          <div class="col-3">
		       	<div id="lineSelectTree">
		            <ul id="treeData" style="display: none;">
		                <c:forEach items="${snctLineDpt }" var="slDpt">
							<li id="${slDpt.dptId}" class="folder">${slDpt.dptName}
								<ul>
								<li id="${slDpt.dptId }" data-emp-no="${slDpt.emp.empNo }" data-emp-name="${slDpt.emp.empName }" data-emp-jobposition="${slDpt.emp.empJobposition }" data-dpt-name="${slDpt.dptName }" class="file employee">${slDpt.emp.empName } ${slDpt.emp.empJobposition }</li>
									<c:if test="${not empty slDpt.childDptList }">
										<c:forEach items="${slDpt.childDptList }" var="cDpt">
											<li id="${cDpt.dptId }" class="folder">${cDpt.dptName }
												<ul>
													<li id="${cDpt.dptId }" data-emp-no="${cDpt.emp.empNo }" data-emp-name="${cDpt.emp.empName }" data-emp-jobposition="${cDpt.emp.empJobposition }" data-dpt-name="${cDpt.dptName }" class="file employee">${cDpt.emp.empName } ${cDpt.emp.empJobposition }</li>
													<c:if test="${not empty cDpt.childDptList }">
														<c:forEach items="${cDpt.childDptList }" var="ccDpt">
															<li id="${ccDpt.dptId }" class="folder">${ccDpt.dptName }
															<ul>
															<li id="${ccDpt.dptId }" data-emp-no="${ccDpt.emp.empNo }" data-emp-name="${ccDpt.emp.empName }" data-emp-jobposition="${ccDpt.emp.empJobposition }" data-dpt-name="${ccDpt.dptName }" class="file employee">${ccDpt.emp.empName } ${ccDpt.emp.empJobposition }</li>
															</ul>
															</li>
														</c:forEach>
													</c:if>
												</ul>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</li>
						</c:forEach>
		            </ul>
		        </div>
			</div>
			<!-- hiddenForm >> 저장하고.. table로 보여주기-->
			<div class="col">
				<div class="row">
					<div class="btn-toolbar demo-inline-spacing justify-content-end"
						role="toolbar" aria-label="Toolbar with button groups">
						<div class="btn-group, text-start mb-3" role="group"
							aria-label="First group">
<!-- 							<button type="button" class="btn rounded-pill btn-outline-secondary">결재선1 <i class="fas fa-times"></i></button> -->
<!-- 							<button type="button" class="btn rounded-pill btn-outline-secondary">결재선2 <i class="fas fa-times"></i></button> -->
								<button type="button" class="btn rounded-pill btn-outline-primary clearSnctline">결재선 초기화</button>
						</div>
					</div>
					
				</div>
				
				<div class="row">
					<div class="table-responsive text-nowrap">
			          <table class="table">
			            <thead>
			              <tr>
			                <th>부서</th>
			                <th>직책</th>
			                <th>이름</th>
			                <th>결재순번</th>
			              </tr>
			            </thead>
			            <tbody id="snctlineTableBody">
			            </tbody>
			          </table>
					</div>
				</div>
			</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
	          Close
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
		
</div>
