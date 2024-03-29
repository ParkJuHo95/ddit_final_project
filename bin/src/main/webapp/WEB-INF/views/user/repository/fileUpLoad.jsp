<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="modal fade" id="exLargeModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel4">파일 업로드</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col mb-3">
						<label for="nameExLarge" class="form-label">대상폴더선택</label> 
						<select class="w_large" id="selectFolderListAll">
							<option class="user" type="user" real-path="/" auth="W">개인 자료실</option>
							<option class="public" type="public" real-path="/" auth="W" selected="selected">전사 자료실</option>
							<option class="public" type="public" real-path="WEBFOLDERROOT.121212" auth="W">-121212</option>
						</select>
					</div>
				</div>
				<div class="row mb-3">
                    <div class="col">
                        <label for="fileUpload" class="form-label">파일 첨부</label>
                        <input type="file" class="form-control" id="fileUpload">
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">업로드</button>
			</div>
		</div>
	</div>
</div>