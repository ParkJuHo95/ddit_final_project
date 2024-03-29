<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="inner-card-body" class="card-body" style="height: 82vh">
  <div class="col-lg-12">
     <h5>인사체계 설정</h5>
     
     <div class="nav-align-top">
      <ul class="nav nav-pills mb-4" role="tablist">
        <li class="nav-item">
          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#job-rank-settings" aria-controls="navs-pills-top-home" aria-selected="true">
            직위설정
          </button>
        </li>
        <li class="nav-item">
          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#job-position-settings" aria-controls="navs-pills-top-profile" aria-selected="false">
            직책설정
          </button>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane fade active show" id="job-rank-settings" role="tabpanel">
          <div class="col">
			<button type="button" class="btn btn-icon btn-outline-primary createBtn prsbtn" data-form-id="psa">
				<span class="tf-icons bx bx-plus"></span>
			</button>
		  </div>
		  <div class="row">
	      <div id="jobrankGrid" class="col-md-5 mb-3 ag-theme-quartz-auto-dark" style="height: 500px;"></div>
		  
		  <div class="col-md-7 mb-3 table-responsive text-nowrap">
			  <form:form modelAttribute="psa">
				  <table class="table">
				  <tr><th>구분</th><th>내용</th></tr>
					<tr><th>코드</th><td><form:input type="text" path="prsCode" required="true" cssClass="form-control" /><form:errors path="prsCode" cssClass="text-danger" /></td></tr>
					<tr><th>명칭</th><td><form:input type="text" path="prsName"  cssClass="form-control"/><form:errors path="prsName" cssClass="text-danger" /></td></tr>
					<tr><th>최종 수정자</th><td><form:input type="text" path="prsEmpChangerid" cssClass="form-control" disabled="true"/></td></tr>
					<tr><th>최종 수정 일시</th><td><form:input type="text" path="prsChangedat" cssClass="form-control" disabled="true"/></td></tr>
					<tr><td id="btnSpaceA" colspan="2" style="text-align: right;"><button type="submit" value="create" class="btn btn-primary btn-personnelsystem" data-form-id="psa">등록</button></td></tr>
				  </table>
			  </form:form>
		  </div>
		  </div>
        </div>
        
        
        <div class="tab-pane fade" id="job-position-settings" role="tabpanel">
          <div class="col">
				<button type="button" class="btn btn-icon btn-outline-primary createBtn prsbtn" data-form-id="psb">
					<span class="tf-icons bx bx-plus"></span>
				</button>
	        </div>
	        <div class="row">
          		<div id="jobpositionGrid" class="col-md-5 mb-3 ag-theme-quartz-auto-dark" style="height: 500px;"></div>
          		<div class="col-md-7 mb-3 table-responsive text-nowrap">
				  <form:form modelAttribute="psb">
					  <table class="table">
					  <tr><th>구분</th><th>내용</th></tr>
						<tr><th>코드</th><td><form:input type="text" path="prsCode" required="true" cssClass="form-control"/><form:errors path="prsCode" cssClass="text-danger" /></td></tr>
						<tr><th>명칭</th><td><form:input type="text" path="prsName"  cssClass="form-control"/><form:errors path="prsName" cssClass="text-danger" /></td></tr>
						<tr><th>최종 수정자</th><td><form:input type="text" path="prsEmpChangerid" cssClass="form-control" disabled="true"/></td></tr>
						<tr><th>최종 수정 일시</th><td><form:input type="text" path="prsChangedat" cssClass="form-control" disabled="true"/></td></tr>
						<tr><td id="btnSpaceB" colspan="2" style="text-align: right;"><button type="submit" value="create" class="btn btn-primary btn-personnelsystem" data-form-id="psb">등록</button></td></tr>
					  </table>
				  </form:form>
			  </div>
	        </div>
        </div>
      </div>
    </div>
   </div>
</div>

