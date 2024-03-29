<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h4 class="card-header">방문 요청</h4>
	<hr>
	<form id="insertForm">
		<div style="height:60vh;">
			<div class="mb-3 row">
				<label for="html5-text-input" class="col-md-1 col-form-label">제목</label>
				<div class="col-md-10">
					<input class="form-control" name="visitSubject" value="${visitVO.visitSubject }" type="text" placeholder="제목" id="html5-text-input" />
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-text-input" class="col-md-1 col-form-label">시간</label>
				<div class="col-md-10">
					<input class="form-control" name="visitDat" value="${visitVO.visitDat}" type="datetime-local" step="1800" />
				</div>
			</div>
			<div class="mb-3 row">
				<label for="html5-search-input" class="col-md-1 col-form-label">내용</label>
				<div class="col-md-10">
					<textArea class="form-control" name="visitContents" style="min-height: 45vh">${visitVO.visitContents }</textArea>
				</div>
			</div>
		</div>	
		<div>
			<div class="container text-center">
					<input type="submit" class="btn btn-primary my-summit" value="등록"/>
					<input type="button" class="btn btn-secondary my-cancle" data-back-location="/admin/inquiry/visit" value="취소"/>
			</div>
		</div>
	</form>
</div>
