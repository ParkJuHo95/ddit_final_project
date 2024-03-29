<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div id="inner-card-body" class="card-body" style="height: 82vh; overflow-y: auto;">
	<h4 class="card-header mb-0">결재문서 작성</h4>
	<form:form modelAttribute="sdc">
		<div id="hiddenInfo">
		<form:hidden path="sdcSfId" />
<%-- 		<form:hidden path="snctline.slId" /> --%>
		</div>
		<div class="btn-toolbar demo-inline-spacing justify-content-end"
			role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group, text-end mb-3" role="group"
				aria-label="First group">
				<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/N">문서상신</button>
				<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/Y">임시저장</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" data-trigger="hover">결재정보</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#selectSnctLineModal">결재선</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#docDatailModal">문서정보 </a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-bs-toggle="modal" data-bs-target="#docReceiverModal">수신</a></li>
				</ul>
			</div>
		</div>
			
		<table class="snctInfoTable">
			<!-- Header -->
			<tbody>
				<tr>
					<td class="snctFormName" colspan="2" >${sdc.snctform.sfName }</td>
				</tr>
				<tr>
					<td class="snctIntro">
						<table class="snctWriter">
							<tbody>
								<tr>
									<td class="ths">기안자</td>
									<td class="tds">${realUser.empName }</td>
								</tr>
								<tr>
									<td class="ths">부서</td>
									<td class="tds">${realUser.department.dptName }</td>
								</tr>
								<tr>
									<td class="ths">기안일</td>
									<td class="tds">상신 시 자동 생성</td>
								</tr>
								<tr>
									<td class="ths">문서번호</td>
									<td class="tds">최종승인 시 자동 생성</td>
								</tr>
								
							</tbody>
						</table>

					</td>
					<td class="snctLine"></td>
				</tr>
				<tr>
					<td colspan="2"> <br>
					<div class="input-group">
                       <div class="input-group-text">
                         <form:checkbox path="sdcEmrgcyyn" class="form-check-input mt-0" label="긴급" value="Y"/>
                       </div>
                       <div class="input-group-text">
                         제목 : 
                       </div>
                       <input type="text" id="sdcTitle" name="sdcTitle" class="form-control" value="${sdc.snctform.sfName }" data-trial-set="전자결재 시연하기">
                     </div>
					
					</td>
				</tr>
			</tbody>
		</table>
			
		<div class="mb-3">
			<div class="mt-3">
				<textarea id="ckeditor-editor" name="sdcContent" data-trial-set="결재문서 내부 내용">
				${sdc.snctform.sfForm }
				</textarea>

			</div>
		</div>
		<div class="mb-3">
			<label for="attachment" class="form-label">첨부 파일</label>
			<input type="file" class="form-control" id="attachment" name="attachment">
		</div>
		<div class="text-end mb-3">
			<button type="button" class="btn btn-primary trial">데이터넣기</button>
			<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/N">문서상신</button>
			<button type="submit" class="btn btn-primary" data-post-location="/user/eworks/saveDoc/Y">임시저장</button>
		</div>
	</form:form>
	
	<!-- 전자결재 결재선 설정 모달 -->
	<div class="modal fade" id="selectSnctLineModal" tabindex="-1" style="display: none;" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="selectSnctLineModalLabel">결재선 설정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	          <div class="col-3">
		       	<div id="lineSelectTree">
		            <ul id="treeData" style="display: none;">
		                <li id="SUP" class="folder">지원부
		                    <ul>
		                        <li id="SUP" data-emp-no="0004" data-emp-name="송은비" data-emp-jobposition="부장" data-dpt-name="지원부" class="employee">송은비 부장
		                        <li id="SUP-D01" class="folder">인사과
								<ul>
			                        <li id="SUP-D01" data-emp-no="0003" data-emp-name="하예종" data-emp-jobposition="과장" data-dpt-name="인사과" class="employee">하예종 과장</li>
			                        <li id="SUP-D01-01" class="folder">교육팀
			                        	<ul>
			                        	<!-- 		교육팀 팀원들 가져오기... -->
											<li id="SUP-D01-01" data-emp-no="0000" data-emp-name="박주호" data-emp-jobposition="팀장" data-dpt-name="교육팀" class="employee">박주호 팀장</li>
			                        	</ul>
			                        </li>
			                        <li id="SUP-D01-02" class="folder">인사팀
			                        	<ul>
			                        	<!-- 		인사팀 팀원들 가져오기... -->
											<li id="SUP-D01-02" data-emp-no="2021-00004" data-emp-name="박진화" data-emp-jobposition="팀장" data-dpt-name="인사팀" class="employee">박진화 팀장</li>
			                        	</ul>
			                        </li>
								</ul></li>
		                        <li id="SUP-D02" class="folder">총무과
								<ul>
			                        <li id="SUP-D02" data-emp-no="0003" data-emp-name="김현우" data-emp-jobposition="과장" data-dpt-name="총무과" class="file">김현우 과장</li>
			                        <li id="SUP-D02-01" class="folder">회계팀
			                        	<ul>
			                        	<!-- 		회계팀 팀원들 가져오기... -->
											<li id="SUP-D02-01" data-emp-no="0002" data-emp-name="김초희" data-emp-jobposition="팀장" data-dpt-name="회계팀" class="file">김초희 팀장</li>
			                        	</ul>
			                        </li>
			                        <li id="SUP-D02-02" class="folder">시설관리팀
			                        	<ul>
			                        	<!-- 		시설관리팀 팀원들 가져오기... -->
											<li id="SUP-D02-02" data-emp-no="2021-00006" data-emp-name="김준택" data-emp-jobposition="팀장" data-dpt-name="시설관리팀" class="file">김준택 팀장</li>
			                        	</ul>
			                        </li>
			                        <li id="SUP-D02-03" class="folder">구매팀
			                        	<ul>
			                        	<!-- 		구매팀 팀원들 가져오기... -->
											<li id="SUP-D02-03" data-emp-no="2021-00007" data-emp-name="이진호" data-emp-jobposition="팀장" data-dpt-name="구매팀" class="file">이진호 팀장</li>
			                        	</ul>
			                        </li>
								</ul>
								</li>
		                        <li id="SUP-D03" class="folder">법무과
								<ul>
									<li id="SUP-D03" data-emp-no="2020-00003" data-emp-name="김유진" data-emp-jobposition="과장" data-dpt-name="법무과" class="file">김유진 과장</li>
									<li id="SUP-D03-01" class="folder">법무팀
										<ul>
			                        	<!-- 		법무팀 팀원들 가져오기... -->
											<li id="SUP-D03-01" data-emp-no="2021-00008" data-emp-name="이준형" data-emp-jobposition="팀장" data-dpt-name="법무팀" class="file">이준형 팀장</li>
			                        	</ul>
									</li>
								</ul></li>
		                    </ul>
		                </li>
		
						<li id="SER" class="folder">서비스부
		                    <ul>
		                        <li id="SER" data-emp-no="2019-00003" data-emp-name="이미소" data-emp-jobposition="부장" data-dpt-name="서비스부" class="file">이미소 부장
		                        <li id="SER-D01" class="folder">제품관리과
								<ul>
									<li id="SER-D01" data-emp-no="2020-00004" data-emp-name="신진유" data-emp-jobposition="과장" data-dpt-name="제품관리과" class="file">신진유 과장</li>
			                        <li id="SER-D01-01" class="folder">제품기획팀
				                        <ul>
			                        	<!-- 		제품기획팀 팀원들 가져오기... -->
											<li id="SER-D01-01" data-emp-no="2020-00006" data-emp-name="황전보" data-emp-jobposition="팀장" data-dpt-name="제품기획팀" class="file">황전보 팀장</li>
			                        	</ul>
			                        </li>
			                        <li id="SER-D01-02" class="folder">제품마케팅팀
			                       		<ul>
			                        	<!-- 		제품마케팅팀 팀원들 가져오기... -->
											<li id="SER-D01-02" data-emp-no="2020-00007" data-emp-name="김은함" data-emp-jobposition="팀장" data-dpt-name="제품마케팅팀" class="file">김은함 팀장</li>
			                        	</ul>
			                        </li>
								</ul></li>
		                        <li id="SER-D02" class="folder">영업과
								<ul>
			                        <li id="SER-D02" data-emp-no="2020-00005" data-emp-name="김군영" data-emp-jobposition="과장" data-dpt-name="법무팀" class="file">영업과 과장</li>
			                        <li id="SER-D02-01" class="folder">영업1팀
			                        	<ul>
			                        	<!-- 		영업1팀 팀원들 가져오기... -->
											<li id="SER-D02-01" data-emp-no="2021-00001" data-emp-name="김소적" data-emp-jobposition="팀장" data-dpt-name="영업1팀" class="file">김소적 팀장</li>
			                        	</ul>
			                        </li>
			                        <li id="SER-D02-02" class="folder">영업2팀
			                        	<ul>
			                        	<!-- 		영업2팀 팀원들 가져오기... -->
											<li id="SER-D02-02" data-emp-no="2021-00002" data-emp-name="김청령" data-emp-jobposition="팀장" data-dpt-name="영업2팀" class="file">김청령 팀장</li>
			                        	</ul>
			                        </li>
								</ul></li>
								
		                    </ul>
		                </li>
<!-- 						<li id="TF" class="folder">TF팀 -->
<!-- 		                    <ul> -->
<!-- 		                        <li id="ESG" class="file">ESG경영 TF -->
<!-- 								</li> -->
<!-- 		                        <li id="BI" class="file">비스니스혁신 TF -->
<!-- 								</li> -->
<!-- 		                    </ul> -->
<!-- 		                </li> -->
		                
		            </ul>
		        </div>
			</div>
			<!-- hiddenForm >> 저장하고.. table로 보여주기-->
			<div class="col">
				<div class="row">
					<div class="btn-toolbar demo-inline-spacing justify-content-start"
						role="toolbar" aria-label="Toolbar with button groups">
						<div class="btn-group, text-start mb-3" role="group"
							aria-label="First group">
							<button type="button" class="btn rounded-pill btn-outline-secondary">결재선1 <i class="fas fa-times"></i></button>
							<button type="button" class="btn rounded-pill btn-outline-secondary">결재선2 <i class="fas fa-times"></i></button>
						</div>
					</div>
					
				</div>
				
				<div class="row">
					<div class="table-responsive text-nowrap">
			          <table class="table">
			            <thead>
			              <tr>
			                <th>부서</th>
			                <th>직책</th>
			                <th>이름</th>
			                <th>결재순번</th>
			                <th></th>
			              </tr>
			            </thead>
			            <tbody id="snctlineTableBody">
			            </tbody>
			          </table>
					</div>
				</div>
			</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
	          Close
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
		
</div>
