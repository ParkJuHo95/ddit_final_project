<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="modal fade" id="certificateModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">사용자님을 위한 자격증 AI 추천</h5>
      </div>
 		<div class="modal-body">
	   		<div class="col mb-3">
	        	<label class="form-label">추천 자격증 1</label>
	      	</div>
	      	<div class="col mb-3">
	        	<label class="form-label">추천 자격증 2</label>
	      	</div>
	      	<div class="col mb-3">
	        	<label class="form-label">추천 자격증 3</label>
	      	</div>
 		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
      </div>
    </div>
  </div>
</div>