<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="card">
<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="card-title d-flex align-items-start justify-content-between">
        <h5 class="card-title">전체 입찰정보</h5>
    </div>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
                <tr>
                    <th>용역구분</th>
                    <th>공고번호</th>
                    <th>공고명</th>
                    <th>게시일시</th>
                    <th>공고기관</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty bidinfoList }">
                        <c:forEach items="${bidinfoList }" var="bid">
                            <tr>
                                <td>${bid.biSrvcclsfc }</td>
                                <td>${bid.biBidno }</td>
                                <td><a href="#" class="bid-link" data-url="${bid.biUrl}" data-bidno="${bid.biBidno}">${bid.biBidname}</a></td>
                                <td>${bid.biBiddt }</td>
                                <td>${bid.biAdagncs }</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">입찰정보 없음</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>
</div>
