<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="card"  id="inner-card-body">
	<h5 class="mb-3">주소록 추가</h5>
	<button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertCard">명함 인식</button>
	<div class="col-8">
		<div class="card-body cardResult" id="cardResult" style="height: 75vh;">
			<div class="table-responsive text-nowrap">
				<form:form modelAttribute="prsnladbkVO" enctype="multipart/form-data">
					<table class="table">
						<thead>
							<tr>
								<th>항목</th>
								<th>내용입력</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>이름</th>
								<td>
									<form:input type="text" path="pabName" cssClass="form-control" />
									<form:errors path="pabName" cssClass="text-danger" />
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 					            <th>프로필 사진</th> -->
<!-- 					            <td> -->
<%-- 					                <form:input type="file" path="pabPicpath" cssClass="form-control" /> --%>
<%-- 					                <form:errors path="pabPicpath" cssClass="text-danger" /> --%>
<!-- 					            </td> -->
<!-- 					        </tr> -->
							<tr>
								<th>이메일</th>
								<td>
									<form:input type="text" path="pabMail" cssClass="form-control" /> 
									<form:errors path="pabMail" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>
									<form:input type="text" path="pabMobile" cssClass="form-control" /> 
									<form:errors path="pabMobile" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>그룹 설정</th>
								<td>
									<form:input type="text" path="pabGroup" cssClass="form-control" /> 
									<form:errors path="pabGroup" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>회사명</th>
								<td>
									<form:input type="text" path="pabCompany" cssClass="form-control" /> 
									<form:errors path="pabCompany" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>소속 부서</th>
								<td>
									<form:input type="text" path="pabDptmnt" cssClass="form-control" /> 
									<form:errors path="pabDptmnt" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>직책</th>
								<td>
									<form:input type="text" path="pabPosition" cssClass="form-control" /> 
									<form:errors path="pabPosition" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>담당 업무</th>
								<td>
									<form:input type="text" path="pabTask" cssClass="form-control" /> 
									<form:errors path="pabTask" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>회사 전화</th>
								<td>
									<form:input type="text" path="pabCmptel" cssClass="form-control" /> 
									<form:errors path="pabCmptel" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>회사 팩스</th>
								<td>
									<form:input type="text" path="pabCmpfax" cssClass="form-control" /> 
									<form:errors path="pabCmpfax" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>회사 주소</th>
								<td>
									<form:input type="text" path="pabCmpaddr" cssClass="form-control" /> 
									<form:errors path="pabCmpaddr" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>
									<form:input type="date" path="pabBirthday" cssClass="form-control" /> 
									<form:errors path="pabBirthday" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>집 전화</th>
								<td>
									<form:input type="text" path="pabHometel" cssClass="form-control" /> 
									<form:errors path="pabHometel" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<th>메모</th>
								<td>
									<form:input type="text" path="pabRemark" cssClass="form-control" /> 
									<form:errors path="pabRemark" cssClass="text-danger" />
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-end mt-3 ">
									<button type="submit" class="cardInsert btn btn-primary btn-compose">완료</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form:form>
			</div>
		</div>
	</div>
	<!-- 명함 업로드 모달 -->
	<div class="modal fade" id="insertCard" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
	  			<div class="modal-header">
	        		<h5 class="modal-title" id="modalCenterTitle">명함 업로드</h5>
	        		<button  type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
				<form method="POST" onsubmit="cardForm(event);" enctype="multipart/form-data">
					<div class="modal-body">
						<input class="form-control" name="cardFile"  type="file" id="cardFile">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">업로드</button>
						<button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
					</div>
	   			</form>
	 		</div>
	  	</div>
	</div><!-- 모달 종료 -->
</div><!-- inner-card-body 종료  -->




