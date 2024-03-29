<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- #FF6F61 -->

<div id="inner-card-body" class="card-body" style="height: 82vh;">
	<div class="text-center">
    	<h5 style="color: #696CFF; font-weight: bold;" class="card-header">최초사내관리자</h5>
    	
    	<div class="mt-2">
			<button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#adminChangePw">비밀번호 변경</button>
		</div>
	</div>
	
	<!-- 최초사내관리자  비밀번호 변경 모달 -->
	<div class="modal fade" id="adminChangePw" tabindex="-1" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 style="color: #696CFF; font-weight: bold;" class="modal-title" id="modalCenterTitle">최초사내관리자 비밀번호 변경</h5>
	        <button  type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      	<form id="changePwForm" >
	      		<div class="modal-body">
	        		<div class="col mb-3">
		            	<label for="nameWithTitle" class="form-label">현재 비밀번호</label>
		            	<input type="text" name="currentPw"  id="nameWithTitle" class="form-control" placeholder="현재 비밀번호를 입력해주세요." />
		          	</div>
		          	<div class="col mb-3">
		            	<label for="nameWithTitle" class="form-label">새 비밀번호</label>
		            	<input type="text"  id="nameWithTitle" class="form-control" placeholder="새 비밀번호를 입력해주세요." />
		          	</div>
		          	<div class="col mb-3">
		            	<label for="nameWithTitle" class="form-label">새 비밀번호 확인</label>
		            	<input type="text"  id="nameWithTitle" class="form-control" placeholder="새 비밀번호를 다시 입력해주세요." />
		          	</div>
	      		</div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">변경</button>
	        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	       	</form>
	    </div>
	  </div>
	</div>
	
</div>
