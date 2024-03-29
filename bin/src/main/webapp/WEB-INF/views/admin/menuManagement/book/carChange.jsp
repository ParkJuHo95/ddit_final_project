<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body overflow-auto"
	style="height: 82vh">
	<h5>차량 수졍</h5>
	<hr>
<form:form id="carModiForm" method="post" enctype="multipart/form-data" modelAttribute="car">     
	<div class="mt-2 mb-3">
		<label for="carCode">차량 코드</label> 
		<input id="carCode" class="form-control form-control-lg" type="text" value="${carCode}" disabled="disabled"/>
	</div>
	<div class="mt-2 mb-3">
		<label for="carName">차량 이름</label> 
		<input id="carName" class="form-control form-control-lg" value="${carName}" type="text" />
	</div>
	<div class="mt-2 mb-3">
		<label for="carDetail">세부 사항</label> 
		<input id="carDetail" class="form-control form-control-lg" value="${carDetail}" type="text" />
	</div>

	<div class="mt-2 mb-3">
		<label for="carAble">차량 이용 여부</label> 
		<select id="carAble" class="form-select form-select-lg">
			<option value="이용 가능" ${roomAble eq '가능' ? 'selected' : ''}>이용 가능</option>
            <option value="이용 정지" ${roomAble eq '정지' ? 'selected' : ''}>이용 정지</option>
		</select>
	</div>
	<div class="mt-2 mb-3">
		<button type="submit" class="btn rounded-pill btn-outline-primary">수정하기</button>
		<button type="button" class="btn rounded-pill btn-outline-dark" onClick="history.back();">취소</button>
	</div>
</form:form>		
</div>
