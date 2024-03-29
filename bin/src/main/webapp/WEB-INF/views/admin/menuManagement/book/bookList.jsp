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
				<c:forEach items="${bookList }" var="bookList">
					<tr>
						<td><span>${bookList.bookCode }</span></td>
						<td>${bookList.bookRental }</td>
						<td>${bookList.empNo }</td>
						<td>${bookList.bookStart }</td>
						<td>${bookList.bookEnd }</td>
						<td><span class="badge bg-label-danger me-1">${bookList.bookDetail }</span></td>
						<td>
							<button class="btn rounded-pill btn-outline-primary cancelBtn" data-book-code="${bookList.bookCode}">예약 취소</button>	
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

<!-- 		<nav aria-label="Page navigation" class="mt-3"> -->
<!-- 			<ul class="pagination justify-content-center"> -->
<!-- 				<li class="page-item prev"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">  -->
<!-- 						<i class="tf-icon bx bx-chevrons-left"></i> -->
<!-- 					</a> -->
<!-- 				</li> -->
<!-- 				<li class="page-item active"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">1</a> -->
<!-- 				</li> -->
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">2</a> -->
<!-- 				</li> -->
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">3</a> -->
<!-- 				</li> -->
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">4</a> -->
<!-- 				</li> -->
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">5</a> -->
<!-- 				</li> -->

<!-- 				<li class="page-item next"> -->
<!-- 					<a class="page-link" href="javascript:void(0);">  -->
<!-- 						<i class="tf-icon bx bx-chevrons-right"></i> -->
<!-- 					</a> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->