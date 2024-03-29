<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="col d-flex">
		<div class="col-2">
			<h4 class="card-header">문의</h4>
		</div>
		<div class="col-9"></div>
		<div class="col-1 align-self-center">
			<button class="btn btn-danger my-delete-button" data-target-location="/admin/inquiry/delete" data-target-number="${inquiryVO.inqryId }">삭제</button>
		</div>
	</div>
	<hr>
	<div  style="height:60vh">
		<div class="row">
			<label for="html5-search-input" class="col-md-1 col-form-label">문의 유형</label>
			<div class="col-md-3 mb-2">
				<c:choose>
					<c:when test="${empty inquiryVO.errorAt }">
						<input type="checkbox" class="form-check-input" checked="on" disabled>
						<label class="form-check-label  ">일반</label>
						&nbsp
						<input type="checkbox" class="form-check-input" disabled>
						<label class="form-check-label  ">오류</label>
					</c:when>
					<c:when test="${not empty inquiryVO.errorAt }">
						<input type="checkbox" class="form-check-input" disabled>
						<label class="form-check-label  ">일반</label>
						&nbsp
						<input type="checkbox" class="form-check-input" checked="on" disabled>
						<label class="form-check-label  ">오류</label>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
			<div class="col-md-10">
				<span class="form-control">${inquiryVO.inqrySubject }</span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
			<div class="col-md-10">
				<span class="form-control" style="min-height: 45vh">${inquiryVO.inqryContents }</span>
			</div>
		</div>
	</div>
	<div>
		<div class="container text-center">
			<button class="btn btn-primary my-update-button" data-target-location="/admin/inquiry/update" data-target-number="${inquiryVO.inqryId }">수정</button>
			<input type="button" class="btn btn-secondary my-cancle" data-back-location="/admin/inquiry" value="취소"/>
			
		</div>
	</div>
</div>
