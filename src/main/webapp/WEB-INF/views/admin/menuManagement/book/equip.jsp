<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
<h5>장비 관리</h5>
<hr>
<div class="table-responsive text-nowrap">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>장비 코드</th>
				<th>장비 이름</th>
				<th>세부 사항</th>
				<th>사용 가능 여부</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody id="equipbody">
		<c:forEach items="${equipList}" var="equip">
			<tr>
				<td><span class="fw-medium">${equip.equipCode}</span></td>
				<td>${equip.equipName}</td>
				<td>${equip.equipDetail}</td>
				<td>
			            <span class="badge ${equip.equipAble eq '이용 가능' ? 'bg-label-primary' : 'bg-label-danger'} me-1">
			                ${equip.equipAble}
			            </span>
			        </td>
			         <td style="position: relative; overflow: visible;">
					    <div class="dropdown">
					        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
					            <i class="bx bx-dots-vertical-rounded"></i>
					        </button>
					        <div class="dropdown-menu" style="position: absolute; top: 100%; left: 0; z-index: 9999;">
					            <a class="dropdown-item modification" href="<%=request.getContextPath()%>/admin/book/equip/change" data-code="${equip.equipCode}"> 
					                <i class="bx bx-edit-alt me-1"></i> 수정
					            </a> 
					            <a class="dropdown-item remove" data-code="${equip.equipCode}" data-type="equip" data-book-location="/WareBridge/admin/book/deleteEquip"> 
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
		<button class="btn btn-primary me-1" type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse" >장비 추가</button>
	</p>
	<div class="row">
		<div class="collapse multi-collapse" id = equipc>
			 <form:form id="createEForm" method="post" enctype="multipart/form-data" modelAttribute="equip"> 
			<div class="d-grid d-sm-flex p-3 border">
				<div class="col-md-5">
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='equipCode' class="form-control" id="floatingInput1" /> 
						<label for="floatingInput1">장비 코드</label>
					</div>
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='equipName' class="form-control" id="floatingInput2" /> 
						<label for="floatingInput2">장비 이름</label>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-floating" style="margin: 15px 25px 15px 0px;">
						<form:input type="text" path='equipDetail' class="form-control" id="floatingInput4" /> 
						<label for="floatingInput4">세부 사항</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary me-1 makeCar">추가</button>
			</div>
 		</form:form>
		</div>
	</div>
</div>
