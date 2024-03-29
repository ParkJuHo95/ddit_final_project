<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h4>팀게시글 등록</h4>
	
	<form:form method="post"  modelAttribute="cmdObj">
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<form:input type="text" path="tbName" placeholder="제목 입력"/>
									</dd>
								</dl>
								<hr>
							</div>
							<section class="mg-b-10u">
								<div class="file-uploader disabled">
									<input class="file-uploader-input" type="file"
										name="boFiles" multiple />
								</div>
							</section>
							<hr>
							<div class="cont">
								<form:textarea path="tbContent" placeholder="내용 입력"></form:textarea>
							</div>
						</div>
						<div class="bt_wrap">
							<button id="insertTeam" type="submit" class="btn btn-primary">전송</button>
							<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
						</div>
					</div>
		</form:form>
</div>

