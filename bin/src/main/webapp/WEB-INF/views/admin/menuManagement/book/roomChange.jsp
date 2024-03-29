<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body overflow-auto" style="height: 82vh">
    <h5>시설 수정</h5>
    <hr>
<form:form id="mdifyForm" method="post" enctype="multipart/form-data" modelAttribute="room">     
    <div class="mt-2 mb-3">
        <label for="roomCode">시설 코드</label> 
        <input id="roomCode" class="form-control form-control-lg" type="text" value="${roomCode}" disabled="disabled"/>
    </div>
    <div class="mt-2 mb-3">
        <label for="roomName">시설 이름</label> 
        <input id="roomName" class="form-control form-control-lg" type="text" value="${roomName}" />
    </div>
    <div class="mt-2 mb-3">
        <label for="roomSite">시설 위치</label> 
        <input id="roomSite" class="form-control form-control-lg" type="text" value="${roomSite}" />
    </div>
    <div class="mt-2 mb-3">
        <label for="roomDetail">세부 사항</label> 
        <input id="roomDetail" class="form-control form-control-lg" type="text" value="${roomDetail}" />
    </div>
    <div class="mt-2 mb-3">
        <label for="roomAble">시설 이용 여부</label> 
        <select id="roomAble" class="form-select form-select-lg">
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
