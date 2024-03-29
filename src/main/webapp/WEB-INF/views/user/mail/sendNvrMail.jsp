<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="inner-card-body" class="card-body" style="height: 82vh; overflow: scroll;">
	<h4 class="card-header m-0 p-0">메일 쓰기</h4>
	<div class="btn-toolbar demo-inline-spacing justify-content-end m-0 p-0" role="toolbar" aria-label="Toolbar with button groups">
		<div class="btn-group, text-end m-0 p-0" role="group"
			aria-label="First group">
			 <button type="button" class="transSend btn rounded-pill btn-outline-danger mx-1">한영번역</button>
             <button type="button" class="transESend btn rounded-pill btn-outline-danger mx-1">영한번역</button>
		</div>
	</div>
	<form:form id="nvrMailForm" method="post" enctype="multipart/form-data" modelAttribute="nvr"> 
		<div class="m-0 p-0">
			<label for="보내는 사람" class="form-label">보내는 분</label> 
			<form:input type="email" class="form-control"  placeholder="이메일 주소" value="dpwhdwkd@naver.com" path="nvrMail"/> 
		</div>
		<div class="m-0 p-0">
			<label for="받는 사람" class="form-label">받는 분</label> 
			<form:input type="email" class="form-control"  placeholder="이메일 주소" value='yejongha@gmail.com' path="nvrGetter" /> 
		</div>
		<div class="m-0 p-0">
			<label for="메일 제목" class="form-label">제목</label>
			 <form:input type="text" class="form-control"  placeholder="제목을 입력하세요" path='nvrTitle' value='Anniversary event Invitation'/>
		</div>
		<div class="m-0 p-0">
			<label for="내용" class="form-label m-0 p-0 ">내용</label>
			<div class="m-0 p-0">
			     <form:textarea  path="nvrText" class="SendMailTrans form-control" rows="8"/>
			</div>
		</div>
		<div class="m-0 p-0">
			 <form:input type="password" class="form-control" value="Tls!tlf159" style="display: none;" path="nvrPass"/>
		</div>
		<div class="text-end mt-3">
			<button type="button" class="btn btn-primary" onClick="confirmCancel()">작성 취소</button>
			<button type="submit" class="btn btn-primary">메일 보내기</button>
		</div>
	</form:form>
</div>
