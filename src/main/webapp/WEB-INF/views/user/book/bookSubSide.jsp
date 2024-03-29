<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>