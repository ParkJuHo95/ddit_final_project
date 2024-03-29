<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="col align-self-center" style="height: 81vh;justify-content: center; align-items:center; display:flex">
		<div>
			<h4>좌측 버튼이 바뀔 때까지 길게 눌러주세요</h4>
			<video id="video" width="640" height="480" autoplay></video>
			<br>
			<br>
			<div style="justify-content: center;align-items: center;display:flex">
				<input type='button' class="btn btn-primary longClickSample me-2" value="길게 눌러주세요" style="width: 151px; height: 39px;"/>
				<input type='button' class="btn btn-primary" value="업로드" onclick="captureImgSend('${realUser.empNo }')" style="width: 151px; height: 39px;"/>
			</div>
		</div>
	</div>
</div>
