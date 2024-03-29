<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body overflow-auto"
	style="height: 82vh">
	<h5>장비 수졍</h5>
	<hr>
<form:form id="eModiForm" method="post" enctype="multipart/form-data" modelAttribute="equip"> 
	<div class="mt-2 mb-3">
		<label for="equipCode">장비 코드</label> 
		<input id="equipCode" class="form-control form-control-lg" type="text" value="${equipCode}" disabled="disabled"/>
	</div>
	<div class="mt-2 mb-3">
		<label for="equipName">장비 이름</label> 
		<input id="equipName" class="form-control form-control-lg" value="${equipName}"  type="text" />
	</div>
	<div class="mt-2 mb-3">
		<label for="equipDetail">세부 사항</label> 
		<input id="equipDetail" class="form-control form-control-lg" value="${equipDetail}"  type="text" />
	</div>

	<div class="mt-2 mb-3">
		<label for="equipAble">장비 이용 여부</label> 
		<select id="equipAble" class="form-select form-select-lg">
			<option value="이용 가능" ${equipAble eq '가능' ? 'selected' : ''}>이용 가능</option>
            <option value="이용 정지" ${equipAble eq '정지' ? 'selected' : ''}>이용 정지</option>
		</select>
	</div>
	<div class="mt-2 mb-3">
		<button type="submit" class="btn rounded-pill btn-outline-primary">수정하기</button>
		<button type="button" class="btn rounded-pill btn-outline-dark" onClick="history.back();">취소</button>
	</div>	
</form:form>	
</div>

