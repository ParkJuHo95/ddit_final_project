<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<div class="card-body overflow-auto" id="inner-card-body" style="height: 82vh">
						<div class="board_title">
						<c:forEach items="${dptList}" var="dpt" varStatus="status">
						
							<strong>${dpt} 게시판</strong> <br>
							<div class="mb-3">
								<button type="button" class="btn btn-light"
									data-btn-location="/user/board/team/insert">새글쓰기</button>
								<button type="button" class="btn btn-light"
									data-btn-delete="/user/board/team">삭제</button>
								<button type="button" class="btn btn-light"
									data-btn-teamnotice="/user/board/team">공지로 등록</button>
								<button type="button" class="btn btn-light"
									data-btn-teamunnotice="/user/board/team">공지내리기</button>
							</div> 
						</c:forEach>
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
									<div class="date">작성일</div>
									<div class="count">조회수</div>
								</div>
								<c:if test="${not empty boardList}">
								    <c:forEach items="${boardList}" var="teamboard">
								        <div style="${teamboard.tbNotice eq 'Y' ? 'background-color: #ccc; border-bottom: 1px solid #ddd; font-size: 0;' : ''}">
								            <div class="checkbox-col">
								                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-check-delete="${teamboard.tbNo}">
								            </div>
								            <div class="num">
								                <c:choose>
								                    <c:when test="${teamboard.tbNotice eq 'Y'}">
								                        <span class="icon bx bx-pin"></span>
								                    </c:when>
								                    <c:otherwise>
								                        ${teamboard.tbNo}
								                    </c:otherwise>
								                </c:choose>
								            </div>
								            <div class="title">
								                <c:choose>
								                    <c:when test="${teamboard.tbNotice eq 'Y'}">
								                        <a class="boardTeam" href='#' data-boardno="${teamboard.tbNo}">
								                        	${teamboard.tbName}
								                        	<c:if test="${teamboard.recnt >0}" >
								                        	<span style="color:red;">(${teamboard.recnt})</span>
								                        	</c:if>
								                        		<c:if test="${not empty teamboard.attatchList}">
												                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
																	  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
																	</svg>
												                </c:if>
								                        </a>
								                    </c:when>
								                    <c:otherwise>
								                        <a class="boardATeam" href='#' data-boardno="${teamboard.tbNo}">
								                        	${teamboard.tbName}
								                        	<c:if test="${teamboard.recnt >0}" >
								                        	<span style="color:red;">(${teamboard.recnt})</span>
								                        	</c:if>
								                        		<c:if test="${not empty teamboard.attatchList}">
												                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
																	  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
																	</svg>
												                </c:if>
								                        </a>
								                    </c:otherwise>
								                </c:choose>
								            </div>
								            <div class="writer">${teamboard.empName} ${teamboard.empJobposition }</div>
								            <div class="date">
											    <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>"/>
											    <c:set var="boardDate" value="${fn:substring(teamboard.tbDat, 0, 10)}" />
											    <c:choose>
											        <c:when test="${boardDate eq currentDate}">
											            <!-- 작성일과 현재 날짜가 같은 경우 -->
											            ${fn:substring(teamboard.tbDat, 11, 19)} <!-- 시:분:초 형식으로 출력 -->
											        </c:when>
											        <c:otherwise>
											            <!-- 작성일과 현재 날짜가 다른 경우 -->
											            ${boardDate} <!-- 년-월-일 형식으로 출력 -->
											        </c:otherwise>
											    </c:choose>
											</div>
								            <div class="count">${teamboard.tbViews}</div>
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
					 	<c:url var="actionUrl" value='/user/board/team'/>
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


