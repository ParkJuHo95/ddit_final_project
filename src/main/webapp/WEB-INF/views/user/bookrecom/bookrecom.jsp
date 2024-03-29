<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<head class="card-header">
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>책 추천 시스템</title>
	    <br>
	    <br>
	</head>
	<body class="bg-light">
	    <div class="container mt-5">
	        <h1 class="text-center mb-4">책 추천 시스템</h1>
			<div class="col d-flex">
			<br>
		        <div class="col-10">
			        <p>${user.empName}님의 부서와 관심사를 고려하여 가장 적합한 책을 추천해 드립니다.</p>
		        </div>
		        <div class="class="col-2">
					<input type="button" class="btn btn-primary" data-bs-toggle="modal" value="최근에 읽은 책 입력" />
				</div>
			</div>
			<br>
	        <table class="table">
	            <thead class="thead-dark">
	                <tr>
	                    <th scope="col">순위</th>
	                    <th scope="col">책명</th>
	                    <th scope="col">저자</th>
	                    <th scope="col">출판년도</th>
	                </tr>
	            </thead>
	            <tbody>
				   <!-- 추천된 책 정보는 여기에 추가됩니다. -->
				   <c:forEach var="book" items="${bookrecom}">
				      <tr>
				         <td>${book.BR_RANK}</td>
				         <td>${book.BD_NAME}</td>
				         <td>${book.BD_AUTHOR}</td>
				         <td>${book.BD_YEAR}</td>
				      </tr>
				   </c:forEach>
				</tbody>
	        </table>
	    </div>
	
	</body>
</div>