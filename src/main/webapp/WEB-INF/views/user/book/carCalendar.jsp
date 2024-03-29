<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
	<div  class="table-responsive text-nowrap">
		<table class="table">
			<tbody class="table-border-bottom-0">
				<tr class="table-primary">
					<td><strong>${car.carName}</strong></td>
					<td><strong>${car.carDetail}</strong></td>
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
					<h5 class="modal-title" id="exampleModalLabel2">${room.roomName} 예약</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form:form id="bookInsert" modelAttribute="book">
					<div class="modal-body">
						<div class="col mb-0">
								<label>예약자 성함</label>
								  <form:input  class="form-control" type="text" path="empNo" value="${name}" readonly="true" />
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
						<form:input type="hidden" name="bookRental" path="bookRental" value="${car.carCode}"/>
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