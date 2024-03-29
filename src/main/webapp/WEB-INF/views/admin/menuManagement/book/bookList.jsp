<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			        <td><span class="badge bg-label-danger me-1">${book.bookDetail}</span></td>
			        <td>
			            <button class="btn rounded-pill btn-outline-primary cancelBtn" data-book-code="${book.bookCode}">예약 취소</button>    
			        </td>
			    </tr>
			    </c:forEach>
			</tbody>
		</table>
		<div class = "mt-3">
		${pagingHTML }
		</div>
		<div class="input-group" style="max-width: 400px;">
			<select class="form-select">
				<option value="option1">예약자</option>
				<option value="option2">대여물이름</option>
			</select> <input type="text" class="form-control" placeholder="Search...">
			<span class="input-group-text">
				<i class="tf-icons bx bx-search cursor-pointer"></i>
			</span>
		</div>
	</div>
</div>
