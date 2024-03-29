<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="col d-flex">
		<div class="col-2">
			<h4 class="card-header">방문 문의</h4>
		</div>
		<div class="col-9"></div>
		<div class="col-1 align-self-center">
			<button class="btn btn-danger my-delete-button" data-target-location="/admin/inquiry/visit/delete" data-target-number="${visitVO.visitId }">삭제</button>
		</div>
	</div>
	<hr>
	<div class=" overflow-auto" style="height:60vh">
		<div class="mb-3 row">
			<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
			<div class="col-md-10">
				<span class="form-control">${visitVO.visitSubject }</span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="html5-search-input" class="col-md-1 col-form-label">요청시간</label>
			<div class="col-md-10">
				<input class="form-control" name="visitDat" value="${visitVO.visitDat}" type="datetime-local" step="1800" />
			</div>
		</div>
		<div class="mb-3 row">
			<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
			<div class="col-md-10">
				<span class="form-control" style="min-height: 45vh">${visitVO.visitContents}</span>
			</div>
		</div>
	</div>
	<div>
		<div class="container text-center">
			<button class="btn btn-primary my-update-button" data-target-location="/admin/inquiry/visit/update" data-target-number="${visitVO.visitId }">수정</button>
			<input type="button" class="btn btn-secondary my-cancle" data-back-location="/admin/inquiry/visit" value="취소"/>
		</div>
	</div>
</div>
