<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="orgModal" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orgModalLabel">조직도</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-3">
	       	<div id="deptTree">
	            <ul id="treeData" style="display: none;">
	            
					<c:forEach items="${deptSystemList }" var="dpt">
						<li id="${dpt.dptId}" class="folder">${dpt.dptName}
							<c:if test="${not empty dpt.childDptList }">
								<ul>
									<c:forEach items="${dpt.childDptList }" var="cDpt">
										<li id="${cDpt.dptId }" class="folder">${cDpt.dptName }
											<c:if test="${not empty cDpt.childDptList }">
												<ul>
													<c:forEach items="${cDpt.childDptList }" var="ccDpt">
														<li id="${ccDpt.dptId }" class="file">${ccDpt.dptName }</li>
													</c:forEach>
												</ul>
											</c:if>
										</li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>



<!-- 	                <li id="SUP" class="folder">지원부 -->
<!-- 	                    <ul> -->
<!-- 	                        <li id="SUP-D01" class="folder">인사과 -->
<!-- 							<ul> -->
<!-- 		                        <li id="SUP-D01-01" class="file">교육팀</li> -->
<!-- 		                        <li id="SUP-D01-02" class="file">인사팀</li> -->
<!-- 							</ul></li> -->
<!-- 	                        <li id="SUP-D02" class="folder">총무과 -->
<!-- 							<ul> -->
<!-- 		                        <li id="SUP-D02-01" class="file">회계팀</li> -->
<!-- 		                        <li id="SUP-D02-02" class="file">시설관리팀</li> -->
<!-- 		                        <li id="SUP-D02-03" class="file">구매팀</li> -->
<!-- 							</ul></li> -->
							
<!-- 	                        <li id="SUP-D03" class="folder">법무과 -->
<!-- 							<ul> -->
<!-- 								<li id="SUP-D03-01" class="file">법무팀</li> -->
<!-- 							</ul></li> -->
<!-- 	                    </ul> -->
<!-- 	                </li> -->
	
<!-- 					<li id="SER" class="folder">서비스부 -->
<!-- 	                    <ul> -->
<!-- 	                        <li id="SER-D01" class="folder">제품관리과 -->
<!-- 							<ul> -->
<!-- 		                        <li id="SER-D01-01" class="file">제품기획팀</li> -->
<!-- 		                        <li id="SER-D01-02" class="file">제품마케팅팀</li> -->
<!-- 							</ul></li> -->
<!-- 	                        <li id="SER-D02" class="folder">영업과 -->
<!-- 							<ul> -->
<!-- 		                        <li id="SER-D02-01" class="file">영업1팀</li> -->
<!-- 		                        <li id="SER-D02-02" class="file">영업2팀</li> -->
<!-- 							</ul></li> -->
							
<!-- 	                    </ul> -->
<!-- 	                </li> -->
	
<!-- 					<li id="TF" class="folder">TF팀 -->
<!-- 	                    <ul> -->
<!-- 	                        <li id="ESG" class="file">ESG경영 TF -->
<!-- 							</li> -->
<!-- 	                        <li id="BI" class="file">비스니스혁신 TF -->
<!-- 							</li> -->
<!-- 	                    </ul> -->
<!-- 	                </li> -->
	                
	            </ul>
	        </div>
		</div>
		<div class="col">
			<div class="table-responsive text-nowrap">
	          <table class="table">
	            <thead>
	              <tr>
	                <th>부서</th>
	                <th>이름</th>
	                <th>직책</th>
	                <th>근무장소</th>
	                <th>담당업무</th>
	              </tr>
	            </thead>
	            <tbody id = "orgchartBody">
		        </tbody>
	          </table>
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
