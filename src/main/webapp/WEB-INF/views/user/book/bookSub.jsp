<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>예약</span>
					</div>
				</div>
				<div id="layout-menu"
					class="card-body rowmenu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active">
						<a href="javascript:;" class="menu-link menu-toggle">
							<span class="sub-side-div">시설</span>
						</a>
							<ul class="menu-sub ">
								<c:forEach items="${room}" var="room">
								    <c:if test="${room.roomAble ne '이용 정지'}">
								        <li class="menu-item mb-3">
								            <a href="<%=request.getContextPath()%>/user/book/roomCalendar/${room.roomCode}" class="menu-link">
								                <span class="sub-sub-div">${room.roomName}</span>
								            </a>
								        </li>
								    </c:if>
								</c:forEach>
							</ul>
						</li>
						<li class="menu-item">
						<a href="javascript:;" class="menu-link menu-toggle">
							<span class="sub-side-div">차량</span>
						</a>
							<ul class="menu-sub  mb-3">
							<c:forEach items="${car}" var="car">
								 <c:if test="${car.carAble ne '이용 정지'}">
								<li class="menu-item  mb-3">
									<a href="<%=request.getContextPath()%>/user/book/carCalendar/${car.carCode}" class="menu-link">
										<span class="sub-sub-div">${car.carName}</span>
									</a>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link menu-toggle">
								<span class="sub-side-div">장비</span>
							</a>
							<ul class="menu-sub  mb-3">
							<c:forEach items="${equip}" var="equip">
							<c:if test="${equip.equipAble ne '이용 정지'}">
								<li class="menu-item  mb-3">
									<a href="<%=request.getContextPath()%>/user/book/equipCalendar/${equip.equipCode}" class="menu-link">
										<span class="sub-sub-div">${equip.equipName}</span>
									</a>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</li>
						<li class="menu-item">
							<a href="<%=request.getContextPath()%>/user/book/userBookList" class="menu-link">
								<span class="sub-side-div">예약 현황</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
						<div  class="table-responsive text-nowrap">
							<table class="table">
								<tbody class="table-border-bottom-0">
									<tr class="table-primary">
										<td><strong>${room[0].roomName}</strong></td>
										<td><strong>${room[0].roomSite}</strong></td>
										<td><strong>${room[0].roomDetail}</strong></td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						<div style="height: 100vh">
							<div id="calendar" class="h-68"></div>
						</div>
						<input type="button" id="smallModalButton" data-bs-toggle="modal" data-bs-target="#smallModal" style="display: none"/>
						<div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel2">${room[0].roomName} 예약</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form:form id="bookInsert" modelAttribute="book" >
										<div class="modal-body">
											<div class="col mb-0">
											<label>예약자 성함</label>
								  			<form:input class="form-control" type="text" path="empNo" value="${name}" readonly="true" />
												</div>
											<div class="row g-2">
												<div class="col mb-0">
													<label>예약 시작시간</label>
													 <form:input   class="form-control"  type="datetime-local" path="bookStart" />
												</div>
												<div class="col mb-0">
													<label>예약 종료시간</label>
													<form:input class="form-control"  type="datetime-local" path="bookEnd"/>
												</div>
											</div>
											<form:input type="hidden" name="bookRental" path="bookRental" value="${room[0].roomCode}"/>
										</div>
										<div class="modal-footer">
										<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">예약</button>
									</div>
									</form:form>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>