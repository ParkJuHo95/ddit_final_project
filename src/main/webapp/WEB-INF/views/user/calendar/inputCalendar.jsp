<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.warebridge.calendar.controller.CalendarInsertController"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div id="inner-card-body" class="card-body " style="height: 82vh">
	<form:form method="POST" action="/WareBridge/user/calendar/input" id="inputCalendarForm" modelAttribute="schedule" style="height:75vh">
<%-- 	<form:form method="POST" modelAttribute="${CalendarInsertController.schedule}"> --%>
		<div class="text-nowrap overflow-y-auto" style="height:90%">
			<h4 class="card-header">일정 추가</h4>
			<hr>
			<br>
			<div class="mb-3 row">
				<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
				<div class="col-md-10">
					<form:input cssClass="form-control" path="scheduleName" type="text" placeholder="제목" id="html5-text-input" />
				</div>
			</div>
			<div class="mb-3 d-flex">
				<label for="html5-text-input" class="col-md-1 col-form-label">시간</label>
				<div class="col-xs-2 me-1">
					<form:input class="form-control" path="scheduleStartDat" type="datetime-local" id="html5-date-input" />
				</div>
<!-- 				<div class="col-xs-2 me-2"> -->
<!-- 					<input class="form-control" type="time" step="1800" id="html5-time-input" /> -->
<!-- 				</div> -->
				<div class="me-2 mt-1">~</div>
				<div class="col-xs-2 me-1">
					<form:input class="form-control" path="scheduleEndDat" type="datetime-local"  id="html5-date-input" />
				</div>
<!-- 				<div class="col-xs-2"> -->
<!-- 					<input class="form-control" type="time" min="09:00" max="19:00" step="900"  /> -->
<!-- 				</div> -->
				&nbsp
				<div class="mt-3">
					<input type="checkbox" class="form-check-input" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
					<label class="form-check-label">&nbsp반복</label>
				</div>
			</div>
			<div class="collapse collapse-horizontal mb-3" id="collapseWidthExample">
				<div class="d-flex mb-3">
					<label for="html5-text-input" class="col-md-1 col-form-label">반복기간</label>
					<div class="col-xs-2">
						<select name="repetitionTerm" class="form-select form-select-sm">
							<option value="">반복 기간 선택</option>
							<option value="1">1일</option>
							<option value="3">3일</option>
							<option value="7">7일</option>
						</select>
					</div>
	        	</div>
				<div class="d-flex">
					<label for="html5-text-input" class="col-md-1 col-form-label">반복종료</label>
					<div class="col-xs-2">
						<input class="form-control form-control-sm" name="repetitionEndDate" type="date"  id="html5-date-input" />
					</div>
	        	</div>
	        </div>
			<div class="mb-3 row">
				<label for="html5-search-input" class="col-md-1 col-form-label">일정 유형</label>
				<div class="col-md-3 mb-2">
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
					<div class="form-check form-check-inline mt-3">
						<input class="form-check-input" type="radio" name="scheduleType" id="inlineRadio0" value="C">
						<label class="form-check-label" for="inlineRadio0">전사</label>
					</div>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-search-input" class="col-md-1 col-form-label"></label>
				<div class="col-md-3 mb-2">
					<c:choose>
						<c:when test="${not empty schedule.scheduleParticipant }">
							<input type="checkbox" name="scheduleParticipant" class="form-check-input" checked="on">
						</c:when>
						<c:when test="${empty schedule.scheduleParticipant }">
							<input type="checkbox" name="scheduleParticipant" class="form-check-input">
						</c:when>
					</c:choose>
						<label class="form-check-label  ">참여자</label>
						&nbsp
					<c:choose>
						<c:when test="${not empty schedule.alarmAlternative }">
							<input type="checkbox" name="alarmAlternative" class="form-check-input" checked="on">
						</c:when>
						<c:when test="${empty schedule.alarmAlternative }">
							<input type="checkbox" name="alarmAlternative" class="form-check-input">
						</c:when>
					</c:choose>
					<label class="form-check-label  ">알람</label>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
				<div class="col-md-10">
					<form:textarea class="form-control" path="scheduleContents" style="min-height: 200px"></form:textarea>
				</div>
			</div>
		</div>
		<div class="container text-center">
			<input id="kkkk" type="submit" class="btn btn-primary" value="확인"/>
			<input type="button" class="btn btn-secondary cancleToback" data-back-location="/WareBridge/user/calendar" value="취소"/>
		</div>
	</form:form>
</div>
