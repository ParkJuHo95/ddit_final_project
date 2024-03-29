<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>게시판</span>
					</div>
					<button class="btn btn-primary btn-compose"
						data-btn-location="/user/board/company/insert">게시글 등록</button>
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active"><a href="/WareBridge/user/board/company" class="menu-link">
								<div class="sub-side-div">전사 게시판</div>
						</a></li>
						<li class="menu-item"><a
							class="menu-link  menu-toggle">
								<div class="sub-side-div">팀 게시판</div>
						</a>
							<ul class="menu-sub">
								<c:forEach items="${dptList}" var="dpt" varStatus="status">
									<li class="menu-item">
										<a href="/WareBridge/user/board/team?who=D${status.count}" class="menu-link">
											<div class="sub-sub-div">${dpt}</div>
										</a>
									</li>
								</c:forEach>
							</ul>
					<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div class="card-body overflow-auto" id="inner-card-body" style="height: 82vh">
						<div class="board_title">
							<strong>전사게시판</strong> <br>
							<div class="mb-3">
								<button type="button" class="btn btn-light"
									data-btn-location="/user/board/company/insert">새글쓰기</button>
								<button type="button" class="btn btn-light"
									data-btn-delete="/user/board/company">삭제</button>
								<security:authorize access="isAuthenticated()">
								    <c:set var="principal" value="${pageContext.request.userPrincipal}" />
								    <c:set var="isAdmin" value="false" />
								    <c:forEach items="${principal.authorities}" var="authority">
								        <c:if test="${authority.authority eq 'ROLE_ADMIN'}">
								            <c:set var="isAdmin" value="true" />
								        </c:if>
								    </c:forEach>
								    
								    <c:if test="${isAdmin}">
								        <!-- ROLE_ADMIN 권한을 가진 사용자에게만 공지로 등록 버튼 표시 -->
								        <button type="button" class="btn btn-light" data-btn-notice="/user/board/company">공지로 등록</button>
								        <!-- ROLE_ADMIN 권한을 가진 사용자에게만 공지내리기 버튼 표시 -->
								        <button type="button" class="btn btn-light" data-btn-unnotice="/user/board/company">공지내리기</button>
								    </c:if>
								</security:authorize>
							</div> 
						</div>
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="checkbox-col">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault" onclick="selectAll(this)">
									</div>
									<div class="num">번호</div>
									<div class="title">제목</div>
									<div class="writer">글쓴이</div>
									<div class="date">작성일자</div>
									<div class="count">조회수</div>
								</div>
								<c:if test="${not empty boardList}">
								    <c:forEach items="${boardList}" var="companyboard">
								        <div style="${companyboard.cbNotice eq 'Y' ? 'background-color: #ccc; border-bottom: 1px solid #ddd; font-size: 0;' : ''}">
								            <div class="checkbox-col">
								                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-check-delete="${companyboard.cbNo}">
								            </div>
								            <div class="num">
								                <c:choose>
								                    <c:when test="${companyboard.cbNotice eq 'Y'}">
								                        <span class="icon bx bx-pin"></span>
								                    </c:when>
								                    <c:otherwise>
								                        ${companyboard.cbNo}
								                    </c:otherwise>
								                </c:choose>
								            </div>
								            <div class="title">
								                <c:choose>
								                    <c:when test="${companyboard.cbNotice eq 'Y'}">
								                        <a class="boardB" href='#' data-boardno="${companyboard.cbNo}">
								                        	${companyboard.cbName}
								                        	<c:if test="${companyboard.recnt >0}" >
								                        	<span style="color:red;">(${companyboard.recnt})</span>
								                        	</c:if>
								                        		<c:if test="${not empty companyboard.attatchList}">
												                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
																	  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
																	</svg>
												                </c:if>
								                        </a>
								                    </c:when>
								                    <c:otherwise>
								                        <a class="boardA" href='#' data-boardno="${companyboard.cbNo}">
								                        	${companyboard.cbName}
								                        	<c:if test="${companyboard.recnt >0}" >
								                        	<span style="color:red;">(${companyboard.recnt})</span>
								                        	</c:if>
								                        		<c:if test="${not empty companyboard.attatchList}">
												                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
																	  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
																	</svg>
												                </c:if>
								                        </a>
								                    </c:otherwise>
								                </c:choose>
								            </div>
								            <div class="writer">${companyboard.empName} ${companyboard.empJobposition }</div>
								            <div class="date">
											    <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>"/>
											    <c:set var="boardDate" value="${fn:substring(companyboard.cbDat, 0, 10)}" />
											    <c:choose>
											        <c:when test="${boardDate eq currentDate}">
											            <!-- 작성일과 현재 날짜가 같은 경우 -->
											            ${fn:substring(companyboard.cbDat, 11, 19)} <!-- 시:분:초 형식으로 출력 -->
											        </c:when>
											        <c:otherwise>
											            <!-- 작성일과 현재 날짜가 다른 경우 -->
											            ${boardDate} <!-- 년-월-일 형식으로 출력 -->
											        </c:otherwise>
											    </c:choose>
											</div>
								            <div class="count">${companyboard.cbViews}</div>
								        </div>
								    </c:forEach>
								</c:if>
								<c:if test="${empty boardList }">
									<tr>
										<td colspan="5">글 없음.</td>
									</tr>
								</c:if>
							
						</div>
					</div>
					<hr>
					<div>
					 	<c:url var="actionUrl" value='/user/board/company'/>
						<form:form id="submitForm" action="${actionUrl}" modelAttribute="paging" method="get">
							<input type='hidden' name="page" />
							<form:input type='hidden' path="simpleCondition.searchType"/>
							<form:input type='hidden' path="simpleCondition.searchWord"/>
						</form:form> 
						<div class="col d-flex" data-pg-role="searchUI" data-pg-target="#submitForm">
							<div class="col-1" >
								<form:select class="form-select" path="paging.simpleCondition.searchType">
									<form:option value="" label="전체" />
									<form:option value="sub" label="제목" />
									<form:option value="con" label="내용" />
								</form:select>
							</div>
							<div class="col-3 d-flex align-items-start">
								<form:input type="search" class="form-control" path="paging.simpleCondition.searchWord" aria-label="Search"/>
								<input type="button"  class="btn btn-outline-primary" data-pg-role="searchBtn" value="검색"/>
							</div>
							<div class="col-3">
								${pagingHTML }
							</div>
							<div class="col-4">
							</div>
							<div class="col-1">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>


