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
	       		<c:if test="${not empty deptSystemList }">
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
	            </ul>
	            </c:if>
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
