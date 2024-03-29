\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h5>예약 조회</h5>
	<div class="table-responsive text-nowrap" style="height: 650px;">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>예약 코드</th>
					<th>대여물 이름</th>
					<th>예약자</th>
					<th>예약시작일시</th>
					<th>예약끝일시</th>
					<th>대여물 비고</th>
					<th>취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookList}" var="book">
			    <tr>
			        <td><span>${book.bookCode}</span></td>
			        <td>
			            <c:choose>
			                <c:when test="${not empty book.carName}">
			                    ${book.carName}
			                </c:when>
			                <c:when test="${not empty book.roomName}">
			                    ${book.roomName}
			                </c:when>
			                <c:when test="${not empty book.equipName}">
			                    ${book.equipName}
			                </c:when>
			                <c:otherwise>
			                    <!-- 이 부분은 null일 경우 대체할 값 -->
			                    No rental information available
			                </c:otherwise>
			            </c:choose>
			        </td>
	       			<td>${book.empNo }</td>
					<td>${book.strBookStart}</td>
           			<td>${book.strBookEnd}</td>
						<td>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#smallModal" > 비고 작성</button>
						<div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">비고 작성</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form:form method="post" modelAttribute="book" id="bookDetailForm" data-book-code="${book.bookCode}">
									    <div class="modal-body">
									        <div class="row">
									            <div class="col mb-3">
									                <label class="form-label">특이사항 </label>
									                <form:input type="text" class="form-control-lg form-control" path="bookDetail" />
									            </div>
									        </div>
									    </div>
									    <div class="modal-footer">
									        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
									        <button type="submit" class="btn btn-primary" data-book-code="${book.bookCode}">저장</button>
									    </div>
									</form:form>
									</div>
								</div>
							</div>
						</td>
						<td>
							<button class="btn rounded-pill btn-outline-primary userCancelBtn" data-book-code="${book.bookCode}">예약 취소</button>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class = "mt-3">
		${pagingHTML }
		</div>
	</div>
</div>