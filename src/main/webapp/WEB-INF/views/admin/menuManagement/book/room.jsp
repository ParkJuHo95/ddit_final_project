<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>메뉴 관리</span>
					</div>
<!-- 					<button class="btn btn-primary btn-compose">미정</button> -->
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active open">
							<a href="javascript:;" class="menu-link menu-toggle">
								<div class="sub-side-div">예약 관리</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item active">
									<a href="<%=request.getContextPath()%>/admin/book/room" class="menu-link">
										<div class="sub-sub-div">시설 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/car" class="menu-link">
										<div class="sub-sub-div">차량 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/equip" class="menu-link">
										<div class="sub-sub-div">장비 관리</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="<%=request.getContextPath()%>/admin/book/bookList" class="menu-link">
										<div class="sub-sub-div">예약 조회</div>
									</a>
								</li>
							</ul>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link">
								<div class="sub-side-div">전자결재 관리</div>
							</a>
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
					<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
						<h5>시설 관리</h5>
						<hr>
						<div class="table-responsive text-nowrap">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>시설 코드</th>
										<th>시설 이름</th>
										<th>시설 위치</th>
										<th>세부 사항</th>
										<th>사용 가능 여부</th>
										<th>수정</th>
									</tr>
								</thead>
								<tbody id = "roombody">
									<c:forEach items="${roomList}" var="room">
								    <tr style = >
								        <td><span class="fw-medium">${room.roomCode}</span></td>
								        <td>${room.roomName}</td>
								        <td>${room.roomSite}</td>
								        <td>${room.roomDetail}</td>
								        <td>
								            <span class="badge ${room.roomAble eq '이용 가능' ? 'bg-label-primary' : 'bg-label-danger'} me-1">
								                ${room.roomAble}
								            </span>
								        </td>
								        <td style="position: relative; overflow: visible;">
										    <div class="dropdown">
										        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
										            <i class="bx bx-dots-vertical-rounded"></i>
										        </button>
										        <div class="dropdown-menu" style="position: absolute; top: 100%; left: 0; z-index: 9999;">
										            <a class="dropdown-item modification" href="<%=request.getContextPath()%>/admin/book/room/change" data-code="${room.roomCode}"> 
										                <i class="bx bx-edit-alt me-1"></i> 수정
										            </a> 
										            <a class="dropdown-item remove" data-code="${room.roomCode}" data-type="room" data-book-location="/WareBridge/admin/book/deleteRoom"> 
										                <i class="bx bx-trash me-1"></i> 삭제
										            </a>
										        </div>
										    </div>
										</td>
								    </tr>
								</c:forEach>
								</tbody>
							</table>
						</div>	
						<p class="demo-inline-spacing">
							<button class="btn btn-primary me-1" type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse" >시설 추가</button>
						</p>
						<div class="row">
							<div class="collapse multi-collapse" id="roomc">
							 <form:form id="createForm" method="post" enctype="multipart/form-data" modelAttribute="room"> 
								<div class="d-grid d-sm-flex p-3 border">
									<div class="col-md-5">
										<div class="form-floating" style="margin: 15px 25px 15px 0px;">
											<form:input type="text" path='roomCode' class="form-control" value="Room0001" /> 
											<label for="floatingInput1">시설 코드</label>
										</div>
										<div class="form-floating" style="margin: 15px 25px 15px 0px;">
											<form:input type="text" path='roomName' class="form-control" value="소회의실" /> 
											<label for="floatingInput2">시설 이름</label>
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-floating" style="margin: 15px 25px 15px 0px;">
											<form:input type="text"  path='roomSite' class="form-control" value="3층 305호" /> 
											<label for="floatingInput3">시설 위치</label>
										</div>
										<div class="form-floating" style="margin: 15px 25px 15px 0px;">
											<form:input type="text" path='roomDetail' class="form-control" id="floatingInput4" /> 
											<label for="floatingInput4">세부 사항</label>
										</div>
									</div>
									<button type="submit" class="btn btn-primary me-1 makeRoom">추가</button>
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