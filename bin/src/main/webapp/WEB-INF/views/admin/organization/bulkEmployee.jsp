<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div id="inner-card-body" class="card-body py-1" style="height: 82vh">
	<h5>사원 일괄등록</h5>
	<!-- Account -->
	<div class="">
		<div class="d-flex align-items-start align-items-sm-center gap-4">
<!-- 			my-4 = 간격 -->
			<div class="my-4"> 
				<p id="download_form" class="btn_minor_s btn_sample_down">
					<span class="separator">|</span>
					<span class="txt">샘플양식 다운로드</span>
				</p>
				<p class="desc ">
					최초 등록 시, 샘플양식을 다운로드 후<br>형식에 맞게 내용을 수정하여 일괄등록할 수 있습니다.
				</p>
			</div>
			<div class="col row d-flex">
				<div class="col-4">
					<a class="dkanrjsk" href="<c:url value='/admin/organization/download'/>">
						<span class="btn btn-primary btn-lg me-2 mb d-none d-sm-block">엑셀 파일 다운로드</span> 
					 </a>
				</div>
			</div>
		</div>
	</div>
	<hr class="my-0" />
	<br>
	<div class="">
		<div class="align-items-start align-items-sm-center gap-4">
			<div class="my-2">
				<p id="download_form" class="btn_minor_s btn_sample_down">
					<span class="separator">|</span>
					<span class="txt">사원계정 일괄등록</span>
				</p>
				<p class="desc">
					해당 엑셀 파일에 새로운 아이디 추가 시 신규 사원 계정을 생성합니다. <br>비밀번호는 '보안관리 > 초기화
					비밀번호 설정'에 설정된 비밀번호로 일괄 등록됩니다.<br>단, 신규사원의 비밀번호만 등록되며, 이미 등록된
					사원의 비밀번호는 변경되지 않습니다.
				</p>
			</div>
			<form method="POST" onsubmit="bulkEmployee(event);" enctype="multipart/form-data">
				<div class="col row d-flex">
	                <div class="col-6 mb-4">
						<div class="input-group">
	                        <input type="file" class="form-control" name="excelFile" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
	                        <button class="btn btn-outline-primary" type="submit" id="inputGroupFileAddon03">업로드</button>
	                     </div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr class="my-3" />
	<div class="" id="resultArea">
		<div class="align-items-start align-items-sm-center gap-4">
			<div class="my-2">
    			<p id="download_form" class="btn_minor_s btn_sample_down">
					<span class="separator">|</span>
					<span class="txt">사원계정 일괄등록</span>
				</p>
   				<p class="desc">파일을 등록하면, 아래 화면에서 추가한 내용을 확인 및 정정할 수 있습니다.</p>
   				<div class="col-6 mb-4 " id="resultDetail">
   				
   				
				</div>
			</div>
		</div>
	<!-- /Account -->
	</div>
</div>