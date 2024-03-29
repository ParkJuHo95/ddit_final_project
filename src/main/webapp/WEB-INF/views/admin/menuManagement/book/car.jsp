<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
<h5>차량 관리</h5>
<hr>
<div class="table-responsive text-nowrap">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>차량 코드</th>
				<th>차량 이름</th>
				<th>세부 사항</th>
				<th>사용 가능 여부</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody id="carbody">
		 <c:forEach items="${carList}" var="car">
			<tr>
				<td><span class="fw-medium">${car.carCode}</span></td>
				<td>${car.carName}</td>
				<td>${car.carDetail}</td>
				<td>
			            <span class="badge ${car.carAble eq '이용 가능' ? 'bg-label-primary' : 'bg-label-danger'} me-1">
			                ${car.carAble}
			            </span>
			        </td>
			        <td style="position: relative; overflow: visible;">
			            <div class="dropdown">
			                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			                    <i class="bx bx-dots-vertical-rounded"></i>
			                </button>
			                <div class="dropdown-menu">
			                    <a class="dropdown-item modification" href="<%=request.getContextPath()%>/admin/book/car/change" data-code="${car.carCode}"> 
			                        <i class="bx bx-edit-alt me-1"></i> 수정
			                    </a> 
			                    <a class="dropdown-item remove" data-code="${car.carCode}" data-type="car" data-book-location="/WareBridge/admin/book/deleteCar"> 
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
		<button class="btn btn-primary me-1" type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse" >차량 추가</button>
	</p>
	<div class="row">
		<div class="collapse multi-collapse" id=carc>
			 <form:form id="createCarForm" method="post" modelAttribute="car"> 
			<div class="d-grid d-sm-flex p-3 border">
				<div class="col-md-5">
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='carCode' class="form-control" value="Car00001"/> 
						<label for="floatingInput1">차량 코드</label>
					</div>
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='carName' class="form-control" value="코나" /> 
						<label for="floatingInput2">차량 이름</label>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='carDetail' class="form-control" value="45허2934" /> 
						<label for="floatingInput4">세부 사항</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary me-1 makeCar">추가</button>
			</div>
 		</form:form>
		</div>
	</div>
</div>
