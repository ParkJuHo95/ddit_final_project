<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>일정관리</span>
					</div>
					<button class="btn btn-primary btn-compose" data-btn-location="/user/calendar/input">일정등록</button>
				</div>
				<div id="layout-menu" class="card-body row menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item open">
							<div href='#' class="menu-link">
								<div class="sub-side-div">개인 일정</div>
							</div>
							<ul class="menu-sub ms-4">
								<li class="menu-item ms-3">
									<div class="d-flex">
										<input type="checkbox" id="calendarCheck1" class="form-check-input check-danger calendar-box" data-cal-who="E">
										<label class="form-check-label" for="calendarCheck1">&nbsp내 일정</label>&nbsp
										<div class="fc-daygrid-event-dot mt-2" style="border-color: rgb(255, 204, 153);"></div>
									</div>
								</li>
							</ul>
						</li>
						<li class="menu-item open">
							<div href='#' class="menu-link">
								<div class="sub-side-div">팀 일정</div>
							</div>
							<ul class="menu-sub ms-4">
								<c:forEach items="${dptList}" var="dpt" varStatus="status">
									<li class="menu-item ms-3">
										<div class="d-flex">
											<input type="checkbox" id="calendarCheck${status.count+1}" class="form-check-input calendar-box" data-cal-who="D${status.count }">
											<label class="form-check-label" for="calendarCheck${status.count+1}">&nbsp${dpt}</label>&nbsp
											<div class="fc-daygrid-event-dot mt-2" style="border-color: rgb(153, 255, 153);"></div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</li>
						<li class="menu-item open">
							<div href='#' class="menu-link">
								<div class="sub-side-div">전사 일정</div>
							</div>
							<ul class="menu-sub ms-4">
								<li class="menu-item ms-3">
									<div class="d-flex">
										<input type="checkbox" id="calendarCheck0" class="form-check-input calendar-box" data-cal-who="C">
										<label class="form-check-label" for="calendarCheck0">&nbsp전사 일정</label>&nbsp
										<div class="fc-daygrid-event-dot mt-2" style="border-color: rgb(204, 153, 255);"></div>
									</div>
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
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
						<div style="height: 74vh">
							<div id="calendar" class="h-100"> </div>
						</div>
						
						
						<input type="button" id="insertCalendarFormButton" data-bs-toggle="modal" data-bs-target="#insertCalendarModal" style="display: none"/>
						<input type="button" id="checkCalendarModalButton" data-bs-toggle="modal" data-bs-target="#checkCalendarModal" style="display: none"/>
					 	<div class="modal fade" id="insertCalendarModal" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content border border-primary">
									<div class="modal-header">
									</div>
									<div class="modal-body">
										<form id="insertCalendarForm" method="post" data-form-location="/user/calendar/input">
											<div class="text-nowrap overflow-y-auto" style="height:90%">
												<h4 class="card-header">일정 추가</h4>
												<hr>
												<br>
												<div class="mb-3 row">
													<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
													<div class="col-md-10">
														<input class="form-control" name="scheduleName" type="text" placeholder="제목" id="html5-text-input" />
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-text-input" class="col-md-1 col-form-label">날짜</label>
													<div class="col-md-10">
														<input class="form-control" name="date" type="date" id="html5-text-input"/>
													</div>
												</div>
												<div class="mb-3 d-flex">
													<label for="html5-text-input" class="col-md-1 col-form-label">시간</label>
													<div class="col-xs-2 me-1">
														<input class="form-control" name="scheduleStartTime" type="time" id="html5-date-input" />
													</div>
													<div class="me-2 mt-1">~</div>
													<div class="col-xs-2 me-1">
														<input class="form-control" name="scheduleEndTime" type="time"  id="html5-date-input" />
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label ps-1">일정 유형</label>
													<div class="col-md-3 mb-2 ms-1">
														<div class="form-check form-check-inline mt-3">
															<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio1" value="E">
															<label class="form-check-label" for="inlineRadio1">개인</label>
														</div>
														<c:forEach items="${dptList}" var="list" varStatus="status">
															<div class="form-check form-check-inline mt-3">
																<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio${status.count+1}" value="D${status.count}">
																<label class="form-check-label" for="inlineRadio${status.count+1}">${list }</label>
															</div>
														</c:forEach>
														<security:authorize access="hasRole('ROLE_ADMIN')">
															<div class="form-check form-check-inline mt-3">
																<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio0" value="C">
																<label class="form-check-label" for="inlineRadio0">전사</label>
															</div>
														</security:authorize>
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label"></label>
													<div class="col-md-3 mb-2 ms-1">
														<input type="checkbox" name="scheduleParticipant" class="form-check-input">
														<label class="form-check-label  ">참여자</label>
														<input type="checkbox" name="alarmAlternative" class="form-check-input">
														<label class="form-check-label  ">알람</label>
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
													<div class="col-md-10">
														<textarea class="form-control" name="scheduleContents" style="min-height: 200px"></textarea>
													</div>
												</div>
											</div>
											<div class="container text-center">
												<input id="kkkk" type="submit" class="btn btn-primary" data-bs-dismiss="modal" value="확인"/>
												<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소"/>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						
					 	<div class="modal fade" id="checkCalendarModal" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content border border-primary">
									<div class="modal-header">
									</div>
									<div class="modal-body">
										<form id="updateCalendarForm" method="post" data-form-location="/user/calendar/update">
											<div class="text-nowrap overflow-y-auto" style="height:90%">
												<div class="col d-flex row">
													<div class="col-9">
														<h4 class="card-header">일정</h4>
													</div>
													<div class="col-1 align-self-center"><button type="button" class="btn btn-danger detail-delete-button" data-bs-dismiss="modal" data-detail-delete-location="/user/calendar/delete">삭제</button></div>
												</div>
												<hr>
												<br>
												<input class="form-control" name="scheduleId" type="text" style="display: none"/>
												<div class="mb-3 row">
													<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
													<div class="col-md-10">
														<input class="form-control" name="scheduleName" type="text" placeholder="제목" id="html5-text-input"/>
													</div>
												</div>
												<div class="mb-3 d-flex">
													<label for="html5-text-input" class="col-md-1 col-form-label">시작 시간</label>
													<div class="col-xs-2 me-1 ms-3">
														<input class="form-control" name="scheduleStartDat" type="datetime-local" id="html5-date-input" />
													</div>
												</div>
												<div class="mb-3 d-flex">
													<label for="html5-text-input" class="col-md-1 col-form-label">종료 시간</label>
													<div class="col-xs-2 me-1 ms-3">
														<input class="form-control" name="scheduleEndDat" type="datetime-local"  id="html5-date-input" />
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label ps-1">일정 유형</label>
													<div class="col-md-3 mb-2 ms-1">
														<div class="form-check form-check-inline mt-3">
															<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio1" value="E">
															<label class="form-check-label" for="inlineRadio1">개인</label>
														</div>
														<c:forEach items="${dptList}" var="list" varStatus="status">
															<div class="form-check form-check-inline mt-3">
																<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio${status.count+1}" value="D${status.count}">
																<label class="form-check-label" for="inlineRadio${status.count+1}">${list }</label>
															</div>
														</c:forEach>
														<security:authorize access="hasRole('ROLE_ADMIN')">
															<div class="form-check form-check-inline mt-3">
																<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio0" value="C">
																<label class="form-check-label" for="inlineRadio0">전사</label>
															</div>
														</security:authorize>
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label"></label>
													<div class="col-md-3 mb-2 ms-1">
														<input type="checkbox" name="scheduleParticipant" class="form-check-input">
														<label class="form-check-label  ">참여자</label>
														<input type="checkbox" name="alarmAlternative" class="form-check-input">
														<label class="form-check-label  ">알람</label>
													</div>
												</div>
												<div class="mb-3 row">
													<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
													<div class="col-md-10">
														<textarea class="form-control" name="scheduleContents" style="min-height: 200px"></textarea>
													</div>
												</div>
											</div>
											<div class="container text-center">
												<button id="kkkk" type="submit" class="btn btn-primary" data-bs-dismiss="modal" style="display: none">확인</button>
												<button  type="button" class="btn btn-primary modify-modal-button" data-bs-dismiss="modal">수정</button>
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											</div>
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
</div>