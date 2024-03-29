<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- style="color: #FF6F61;" -->


<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div id="calendar"></div>


	<!-- 메뉴 추가 모달 -->
	<div class="modal fade " id="insertDiet" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered " role="document">
	   		<div class="modal-content border border-primary">
				<div class="modal-header">
		  			<button  type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
		    	<form id="insertMenuForm" method="POST"  >
    				<div class="modal-body text-center">
						<div class="mb-3 row justify-content-center align-items-center">
							<label for="html5-text-input"  class="col-md-3 col-form-label">오늘 먹은 음식</label>
							<div class="col-md-6 ">
								<select id="mId" name="menuList" class="form-control">
						               <option  value="">메뉴명</option>
					               <c:forEach items="${menuList}" var="menu">
						               <option  value="${menu.getMId()}">${menu.getMName()}</option>
					               </c:forEach>
				             	</select>
							</div>
						</div>
					</div>
			     <div class="modal-footer">
			       <button type="button" data-bs-dismiss="modal" onclick="addDietList(event);" class="btn btn-primary">저장</button>
			       <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
			     </div>
			 		</form>
			</div>
		</div>
	</div>
	
	<!-- 추천결과 모달 -->
	<div class="modal fade" id="recomMenu" tabindex="-1" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content border border-primary">
	      <div class="modal-header">
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form:form id="insertMenuForm" action='<c:url value="/user/mypage/menu"/>'>
	        <div class="modal-body text-center">
	          <div class="mb-3 row justify-content-center align-items-center">
	            <h6 style="color: #FF6F61; font-weight: bold;" class="col-md-6">오늘의 추천 메뉴 ♬♪</h6>
	          </div>
	          <div class="mb-3 row justify-content-center align-items-center">
	            <div class="col-md-6">${recomMenu.getMName()}</div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
	        </div>
	      </form:form>
	    </div>
	  </div>
	</div>
</div>
