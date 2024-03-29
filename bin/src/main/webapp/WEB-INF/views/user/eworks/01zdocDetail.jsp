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
														<th>결재의견</th>
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
															<!-- ssStatus가 완료 아니거나 ssType이 결재대기 아님 >> 후결이면 보여야 하고, 선결이면 -->
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
<%-- 						<h5> ${sdc}</h5> --%>
					</div>
					<div id="inner-card-body" class="card-body"
						style="height: 82vh; overflow-y: auto;">
						<div class="btn-toolbar demo-inline-spacing justify-content-end"
							role="toolbar" aria-label="Toolbar with button groups">
							<div class="btn-group text-end mb-3" role="group"
								aria-label="First group">
								
								<!-- 결재라인에 있는 경우 결재 버튼이 생김-->
								<c:forEach items="${sdc.snctline.snctdetails}" var="detail">
									<c:if test="${(detail.authorizer.empNo eq realUser.empNo) && ( detail.atrzstatus.ssStatus != 2 )}">
										<button type="button" class="btn btn-outline-warning"
											data-bs-toggle="collapse" data-bs-target="#snctDecision"
											aria-expanded="true" aria-controls="snctDecision">
											결재하기</button>
									</c:if>
								</c:forEach>
								<!-- // 결재 버튼-->
								
								<!-- 문서 작성자인 경우 상신취소 버튼이 생김 -->
								<c:if test="${sdc.docWriter.empNo eq realUser.empNo && sdc.sdcResult != 'Y'}">
									<button type="button" class="btn btn-outline-secondary">상신취소</button>
								</c:if>
								<!-- // 상신취소 버튼 -->
								
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
						
						<!-- 결재 시 작성 내용 -->
						<c:forEach var="detail" items="${sdc.snctline.snctdetails}">
						<c:if test="${detail.authorizer.empNo eq realUser.empNo}">
						<div class="collapse" id="snctDecision" style="">
							<div class="d-flex justify-content-end">
								<div class="p-3 border col-8 order-2 me-2 mb-2 mb-sm-0">
									<form>
							           <div class="input-group mb-3">
				                        <span class="input-group-text">결재의견</span>
				                        <textarea name="ssRemark" class="form-control" aria-label="With textarea" placeholder="결재의견"></textarea>
				                      </div>
				                      <div class="d-flex justify-content-end">
										 <div class="btn-group text-end mb-3" role="group" aria-label="First group checkbox toggle button">
										 	<c:if test="${sdc.snctform.sfUsearbityn eq 'Y'}">
										 	<div class="input-group-text">
											  <input class="form-check-input mt-0" type="checkbox" name="arbit" aria-label="Checkbox for following text input">
											  <label class="form-check-label" for="arbit">&ensp;전결</label>
											</div>
											</c:if> 
											<button type="submit" class="btn btn-outline-success" data-post-location="/user/eworks/atrz/Y/${sdc.sdcId}">승인</button>
											<c:if test="${detail.atrzstatus.ssType != '후결'}">
												<button type="submit" class="btn btn-outline-danger" data-post-location="/user/eworks/atrz/N/${sdc.sdcId}">반려</button>
											</c:if>
										</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
						<!-- // 결재 디테일 -->
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
													<td class="tds"><c:if test="${empty sdc.sdcDocno}">최종승인 시 생성</c:if>
														${sdc.sdcDocno}
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td style="width: 200px;"></td>
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
								</tr>
								<tr>
									<td colspan="3"><br>
										<h4>
											&emsp;제목 : <strong>${sdc.sdcTitle }</strong>
										</h4></td>
								</tr>
							</tbody>
						</table>
						<div class="mb-3">
							<div class="mt-3">${sdc.sdcContent }</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

