<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    


<div id="inner-card-body" class="card-body" style="height: 82vh;">
	<div class="text-center">
    	<h5 style="color: #696CFF; font-weight: bold;" class="card-header">초기 비밀번호 설정하기</h5>
      		<form id="initPwForm">
		    	<div class="card-body text-center">
			      	<p class="form-text">
			        	※ 사원계정 신규 등록시 본 비밀번호로 초기 설정되며, 입력칸 클릭시 수정이 가능합니다.
			      	</p>
			       <div class="row mb-3 justify-content-center" >
			         <div class="col-sm-2">
			           <input type="text" autofocus class="form-control" name="cmpInitPass" value="${company.cmpInitPass}"  id="basic-default-name" placeholder="John Doe">
			         </div>
			       </div>
		       		<button class="btn btn-primary me-1 initPwSubmit" type="submit">저장</button>
		   			<button class="btn btn-primary me-1 " type="reset" >취소</button>
		    	</div>
  		</form>
	</div>
</div>