<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 전자결재 양식 선택 모달 -->
<div class="modal fade" id="docSelectModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">양식 선택</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<form class="d-flex">
						<div class="input-group">
							<span class="input-group-text"><i
								class="tf-icons bx bx-search"></i></span> <input type="text"
								class="form-control" placeholder="양식 이름">
						</div>
					</form>
				</div>
				<div class="row">
					<div id="docClsfcTree">
						<ul id="treeData" style="display: none;">
							<li id="dreaminfosystem01PRS" class="folder">인사
								<ul>
									<li id="dreaminfosystem01PRS001" class="file">휴가신청서</li>
									<li id="dreaminfosystem01PRS002" class="file">증명서신청서</li>
								</ul>
							</li>
							<li id="dreaminfosystem02ACN" class="folder">회계
								<ul>
									<li id="dreaminfosystem02ACN001" class="file">구매품의서</li>
									<li id="dreaminfosystem02ACN002" class="file">지출결의서</li>
								</ul>
							</li>
							<li id="dreaminfosystem03GNR" class="folder">일반
								<ul>
									<li id="dreaminfosystem03GNR001" class="file">업무기안</li>
									<li id="dreaminfosystem03GNR002" class="file">업무협조</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary newDoc"
				data-bs-dismiss="modal">새 문서 작성</button>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>전자결재</span>
					</div>
					<button class="btn btn-primary btn-compose" 
					data-bs-toggle="modal" data-bs-target="#docSelectModal">
					결재문서 작성</button>
					<!-- 					<button class="btn btn-primary btn-compose" data-btn-location="/calendar/input">결재문서 작성</button> -->
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">상신 문서함</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/user/eworks/sendedList" class="menu-link">
										<div class="sub-sub-div">상신 결재 문서</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/user/eworks/savedList" class="menu-link">
										<div class="sub-sub-div">임시 저장 문서</div>
									</a>
								</li>
							</ul>
						</li>
						<li class="menu-item"><a href="javascript:;"
							class="menu-link menu-toggle">
								<div class="sub-side-div">수신 문서함</div>
						</a>
							<ul class="menu-sub">
								<li class="menu-item"><a
									href="<%=request.getContextPath()%>/user/eworks/waitingList"
									class="menu-link">
										<div class="sub-sub-div">결재 대기 문서</div>
								</a></li>
<!-- 								<li class="menu-item"><a -->
<%-- 									href="<%=request.getContextPath()%>/user/eworks/receivedList" --%>
<!-- 									class="menu-link"> -->
<!-- 										<div class="sub-sub-div">수신/참조 문서</div> -->
<!-- 								</a></li> -->
								<li class="menu-item"><a
									href="<%=request.getContextPath()%>/user/eworks/pendingList"
									class="menu-link">
										<div class="sub-sub-div">결재 예정 문서</div>
								</a></li>
								<li class="menu-item"><a
									href="<%=request.getContextPath()%>/user/eworks/completedList"
									class="menu-link">
										<div class="sub-sub-div">결재 완료 문서</div>
								</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
					<div class="container mt-5 mb-5">
						<div class="row justify-content-center">
						    <div class="col mb-3 mx-2">
						        <div class="card text-center text-dark bg-warning mb-5 h-200">
						            <div class="card-body">
						                <h3 class="card-title text-dark"><strong>결재 대기 문서</strong></h3>
						                <p class="card-text text-dark">* 나의 결재 순서가 도래한 문서</p>
						                <h5 class="card-text text-dark">${waitingNum } 건</h5><hr>
						                <p class="card-text"><a href="#" class="btn btn-outline bg-white" data-btn-location="/user/eworks/waitingList">문서함 이동</a></p>
						            </div>
						        </div>
						    </div>
						    <div class="col mb-3 mx-2">
						        <div class="card text-center bg-info mb-5 h-200 text-dark">
						            <div class="card-body">
						                <h3 class="card-title text-dark"><strong>결재 예정 문서</strong></h3>
						                <p class="card-text text-dark">* 이후 결재 예정인 문서</p>
						                <h5 class="card-text text-dark">${pendingNum } 건</h5><hr>
						                <p class="card-text"><a href="#" class="btn btn-outline bg-white" data-btn-location="/user/eworks/pendingList">문서함 이동</a></p>
						            </div>
						        </div>
						    </div>
						    <div class="col mb-3 mx-2">
						        <div class="card text-center bg-success mb-5 h-200 border-bottom">
						            <div class="card-body">
						                <h3 class="card-title text-dark"><strong>승인 대기 문서</strong></h3>
						                <p class="card-text text-dark">* 상신 후 대기중인 문서</p>
						                <h5 class="card-text text-dark">${sendedNum } 건</h5><hr>
						                <p class="card-text"><a href="#" class="btn btn-outline bg-white" data-btn-location="/user/eworks/sendedList">문서함 이동</a></p>
						            </div>
						        </div>
						    </div>
						</div>

					
					    <div class="row justify-content-center">
					        <div class="card col-md-12">
					        	<h5 class="card-header"><strong>결재 대기 문서</strong></h5>
					          	<div class="table-responsive">
							    <table class="table card-table">
							      <thead>
							        <tr>
							          	<th>기안일</th>
										<th>결재양식</th>
										<th>긴급</th>
										<th>제목</th>
										<th>기안자</th>
										<th>상태</th>
							        </tr>
							      </thead>
							      <tbody>
							        <tr>
							          <c:choose>
											<c:when test="${not empty waitingSdcList }">
												<c:forEach items="${waitingSdcList }" var="waiting">
													<tr>
														<td>${waiting.sdcReportdat }</td>
														<td>${waiting.snctform.sfName }</td>
														<td>
														<c:if test="${waiting.sdcEmrgcyyn == 'Y'}"><i class="fas fa-bolt" style="color: red;"></i></c:if>
														</td>
														<td><a href="/user/eworks/docDetail/${waiting.sdcId}" class="href-link"><strong>${waiting.sdcTitle }</strong></a>
														</td>
														<td>${waiting.docWriter.empName }</td>
														<td><c:choose>
														<%-- 0 임시저장, 1 결재대기, 2 반려, 3 승인, 4 취소--%>
														    <c:when test="${waiting.sdcResult eq '0'}">
														        <span class="badge bg-label-info me-1">임시저장</span>
														    </c:when>
														    <c:when test="${waiting.sdcResult eq '1'}">
														        <span class="badge bg-label-info me-1">결재대기</span>
														    </c:when>
														    <c:when test="${waiting.sdcResult eq 'N'}">
														        <span class="badge bg-label-warning me-1">반려</span>
														    </c:when>
														    <c:otherwise>
														       <span class="badge bg-label-success me-1">승인</span>
														    </c:otherwise>
														</c:choose>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6">조회할 문서 없음</td>
												</tr>
											</c:otherwise>
										</c:choose>
							        </tr>
							      </tbody>
							    </table>
							  </div>
					        </div>
					    </div>
					    </div>
					    
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
