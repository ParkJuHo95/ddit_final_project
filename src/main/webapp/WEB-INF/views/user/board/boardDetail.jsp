<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<h4>게시글 상세페이지</h4>
	<div class="board_view_wrap">
		<div class="board_view">
			<div class="title">${board.cbName}</div>
			<div class="info">
				<dl>
					<dt>번호</dt>
					<dd>${board.cbNo}</dd>
				</dl>
				<dl>
					<dt>글쓴이</dt>
					<dd>${board.empName}</dd>
				</dl>
				<dl>
					<dt>작성일</dt>
					<dd>${board.cbDat}</dd>
				</dl>
				<dl>
					<dt>조회수</dt>
					<dd>${board.cbViews}</dd>
				</dl>
			</div>
			<div>
			    <dl style="margin-top: 10px;">
			        <dt style="font-weight: bold;">파일</dt>
			        <dd>
			            <ul style="list-style-type: none; padding: 0;">
			                <c:forEach items="${board.attatchList}" var="atch">
			                    <li style="margin-bottom: 5px;">
			                        <a class="dkanrjsk" href="<c:url value='/user/board/company/download/${atch.atchNo}'/>">
			                            <span style="font-weight: bold; margin-right: 5px;">${atch.atchName}</span>
			                            <span style="color: #888;">(${atch.atchFancysize})</span>
			                        </a>
			                    </li>
			                </c:forEach>
			            </ul>
			        </dd>
			    </dl>
			</div>
			<div class="cont">
				 ${board.cbContent}
			</div>
		</div>
		<div class="comment_section">
			<c:forEach items="${comment}" var="comment">
			<li>
			    <div class="d-flex">
			        <p>${comment.empName} / ${comment.cmtDat}</p>
			    </div>
			    <div class="d-flex">
			        <p>${comment.cmtContent}</p>
			    </div>
			    <hr>
			</li>
			</c:forEach>
		    <form method="post">
		        <textarea class="form-control" rows="3" placeholder="댓글을 입력하세요..." name="cmtContent"></textarea>
		        <input type="hidden" name="cmtCbNo" value="${board.cbNo}" >
		        <button id="insertCC" type="submit" class="btn btn-success mt-2">댓글 작성</button>
		    </form>
		</div>
		<div class="bt_wrap">
			<a class="on" href='#'>목록</a> <a href="#" class="on1" data-board-no="${board.cbNo}">수정</a>
		</div>
	</div>
	<hr />
</div>
