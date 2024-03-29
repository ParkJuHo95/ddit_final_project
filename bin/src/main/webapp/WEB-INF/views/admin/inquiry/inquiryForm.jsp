<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h4 class="card-header">문의 작성</h4>
	<hr>
	<form id="insertForm">
		<div style="height:60vh;">
			<div class=" row">
				<label for="html5-search-input" class="col-md-1 col-form-label">문의 유형</label>
				<div class="col-md-3 mb-2">
					<c:choose>
						<c:when test="${empty inquiryVO.errorAt }">
							<input type="checkbox"  class="form-check-input check-on-off" checked="on">
							<label class="form-check-label">일반</label>
							&nbsp
							<input type="checkbox" name="errorAt" value="1" class="form-check-input check-on-off">
							<label class="form-check-label  ">오류</label>
						</c:when>
						<c:when test="${not empty inquiryVO.errorAt }">
							<input type="checkbox" class="form-check-input check-on-off">
							<label class="form-check-label  ">일반</label>
							&nbsp
							<input type="checkbox" name="errorAt" value="1" class="form-check-input check-on-off" checked="on">
							<label class="form-check-label  ">오류</label>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
				<div class="col-md-10">
					<input class="form-control" name="inqrySubject" value="${inquiryVO.inqrySubject }" type="text" placeholder="제목" id="html5-text-input" />
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
				<div class="col-md-10">
					<textArea class="form-control" name="inqryContents" style="min-height: 45vh">${inquiryVO.inqryContents }</textArea>
				</div>
			</div>
		</div>	
		<div>
			<div class="container text-center">
					<input type="submit" class="btn btn-primary my-summit" value="등록"/>
					<input type="button" class="btn btn-secondary my-cancle" data-back-location="/admin/inquiry" value="취소"/>
			</div>
		</div>
	</form>
</div>
