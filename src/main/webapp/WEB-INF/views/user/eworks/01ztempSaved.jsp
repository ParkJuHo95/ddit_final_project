<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="col-lg-10 col-md-0">
	<div class="row">
		<div class="col col-md-12 col-6">
			<div class="card">
				<div class="card-body overflow-auto" id="inner-card-body"
					style="height: 82vh">
					<h4 class="card-header mb-0">결재문서 작성</h4>
					<form:form modelAttribute="sdc">
					<div id="hiddenInfo">
					<form:hidden path="sdcId" />
					<form:hidden path="sdcSfId" />
					</div>
					
					<!-- 	btn Group -->
					<div class="btn-toolbar demo-inline-spacing justify-content-end" role="toolbar" aria-label="Toolbar with button groups">
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
					<!-- //btn Group -->
					
					<!-- 결재선 확인 모달 -->
					<div class="modal fade" id="snctLineModal" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="snctLineModal">결재선</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="table-responsive text-nowrap">
											<table class="table">
												<thead>
													<tr>
														<th>구분</th>
														<th>이름</th>
														<th>부서</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>기안</td>
														<td>${sdc.docWriter.empName }</td>
														<td>${sdc.docWriter.department.dptName }</td>
														<td>상신</td>
													</tr>
													<c:forEach items="${sdc.snctline.snctdetails}" var="detail">
														<tr>
															<td>결재</td>
															<td>${detail.authorizer.empName }</td>
															<td>${detail.authorizer.department.dptName }</td>
															<td>
															<c:if test="${detail.atrzstatus.ssStatus != 2||detail.atrzstatus.ssType != '결재대기'}">
															${detail.atrzstatus.ssType }
															</c:if>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-label-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 문서정보 확인 모달 -->
					<div class="modal fade" id="docDatailModal" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">문서정보</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row table-responsive text-nowrap">
										<table class="table">
											<tbody>
												<tr>
													<th>문서번호</th>
													<td></td>
												</tr>
												<tr>
													<th>공개여부</th>
													<td>비공개</td>
												</tr>
												<tr>
													<th>참조자</th>
													<td></td>
												</tr>
												<tr>
													<th>열람자</th>
													<td></td>
												</tr>
												<tr>
													<th>긴급문서</th>
													<td><c:if test="${sdc.sdcEmrgcyyn == 'Y'}">
															<i class="fas fa-bolt" style="color: red;"></i>긴급</c:if></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-label-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 수신 확인 모달 -->
					<div class="modal fade" id="docReceiverModal" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">수신</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<ul>
										<li class="inactive last" style="margin-left: 10px">수신처의
											진행상태는 결재 완료된 이후 확인할 수 있습니다.</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-label-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>

					<div
						class="card-header d-flex align-items-center justify-content-between">
						<h3 class="mb-0">결재문서 상세</h3>
					</div>
					<div id="inner-card-body" class="card-body"
						style="height: 82vh; overflow-y: auto;">
						<div class="btn-toolbar demo-inline-spacing justify-content-end"
							role="toolbar" aria-label="Toolbar with button groups">
							<div class="btn-group text-end mb-3" role="group"
								aria-label="First group">
								<c:if test="${sdc.docWriter.empNo eq realUser.empNo && sdc.sdcResult != 'Y'}">
									<button type="button" class="btn btn-outline-secondary">삭제</button>
								</c:if>
								<button type="button" class="btn btn-outline-secondary">메일발송</button>
								<button type="button"
									class="btn btn-outline-secondary dropdown-toggle"
									data-bs-toggle="dropdown" data-trigger="hover">결재정보</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="javascript:void(0);"
										data-bs-toggle="modal" data-bs-target="#snctLineModal">결재선</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);"
										data-bs-toggle="modal" data-bs-target="#docDatailModal">문서정보</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);"
										data-bs-toggle="modal" data-bs-target="#docReceiverModal">수신</a></li>
								</ul>
							</div>
						</div>
						<table class="snctInfoTable">
							<!-- Header -->
							<tbody>
								<tr>
									<td class="snctFormName" colspan="3">${sdc.snctform.sfName }</td>
								</tr>
								<tr>
									<td class="snctIntro">
										<table class="snctWriter">
											<tbody>
												<tr>
													<td class="ths">기안자</td>
													<td class="tds">${sdc.docWriter.empName }</td>
												</tr>
												<tr>
													<td class="ths">부서</td>
													<td class="tds">${sdc.docWriter.department.dptName }</td>
												</tr>
												<tr>
													<td class="ths">기안일</td>
													<td class="tds">${sdc.sdcReportdat }</td>
												</tr>
												<tr>
													<td class="ths">문서번호</td>
													<td class="tds">최종승인 시 자동 생성</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td style="width: 200px;"></td>
									<!-- 결재선 설정 테이블 안으로 옮기기 -->
									<td style="float: right; padding-right: 25px;"><c:if
											test="${not empty sdc.snctline.snctdetails}">
											<table class="snctLine">
												<!-- snctdetails 리스트가 비어있지 않으면 결재선 박스 생성-->
												<tbody>
													<tr>
														<td class="snctRow" rowspan="3">승<br>인
														</td>
														<c:forEach items="${sdc.snctline.snctdetails}"
															var="detail">
															<td class="snctLineHeader">${detail.authorizer.empJobposition }</td>
														</c:forEach>
													</tr>
													<tr>
														<c:forEach items="${sdc.snctline.snctdetails}" var="detail">
															<td class="snctLineBody">
															<c:if test="${(detail.atrzstatus.ssType == '승인' || 
															            detail.atrzstatus.ssType == '전결' || 
															            detail.atrzstatus.ssType == '선결') ||
															            ( detail.atrzstatus.ssType == '후결' &&
															            detail.atrzstatus.ssSnctdat != null)}">
															<img src="<c:url value='/resources/icons/stamp_approved.png' />" alt="Approved Stamp"> 
															<br>
															</c:if>
															${detail.authorizer.empName }
															</td>
														</c:forEach>
													</tr>
													<tr>
														<c:forEach items="${sdc.snctline.snctdetails}" var="detail">
															<td class="snctLineFooter">
															<c:if test="${detail.atrzstatus.ssType == '후결'}">
															${detail.atrzstatus.ssType}
															</c:if>
															${detail.atrzstatus.ssSnctdat }</td>
														</c:forEach>
													</tr>
												</tbody>
											</table>
										</c:if></td>
										<!-- //	결재선 설정 테이블 안으로 옮기기 -->
								</tr>
								<tr>
									<td colspan="3"><br>
									<div class="input-group">
				                       <div class="input-group-text">
				                         <form:checkbox path="sdcEmrgcyyn" class="form-check-input mt-0" label="긴급" value="Y"/>
				                       </div>
				                       <div class="input-group-text">
				                         제목 : 
				                       </div>
				                       <form:input type="text" path="sdcTitle" class="form-control" />
				                     </div>
								</tr>
							</tbody>
						</table>
						<div class="mb-3">
							<div class="mt-3">${sdc.sdcContent }</div>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

