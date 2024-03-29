<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.light-style {
	color: #ff0000;
}
</style>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div style="height: 82vh">
			<div class="card profileCard mb-3" style="height: 40%">
				<div class="align-self-center mt-4 mb-3">
					<c:if test="${empty realUser.empPicpath}">
						<img height="120" width="120" src="<c:url value='/resources/files/default_profile.png'/>" class="uploadedAvatar profileImg" id="uploadedAvatar">
					</c:if>
					<c:if test="${not empty realUser.empPicpath}">
						<img height="120" width="120" src="data:image/png;base64,${realUser.base64}" class="uploadedAvatar profileImg" id="uploadedAvatar">
					</c:if>
				</div>
				<div class="align-self-center mt-4">
					<h5 style="color:white; font-style : inherit;"> ${realUser.empName} 
						<c:if test="${not empty realUser.empJobposition }">
							${realUser.empJobposition }
						</c:if> 
						<c:if test="${empty realUser.empJobposition }">
							사원
						</c:if>
					</h5>
				</div>
				<div class="align-self-center">
					<span>${realUser.empCmpId }</span>
				</div>
			</div>
			<div>
				<div class="card bg-menu-theme sub-side-menu mb-2">
	<%-- 				뭘 넣을까요? <br> 추천 좀 해주세요 ${realUser.empDptId1} --%>
	<%-- 				<button onclick="Alram('${realUser.empDptId1}')">알람체크버튼</button> --%>
					<button class="btn btn-outline-primary btn-home-button" data-btn-home-location="/WareBridge/user/calendar">일정등록</button>
				</div>
				<div class="card bg-menu-theme sub-side-menu mb-2">
					<button class="btn btn-outline-primary btn-home-button" data-btn-location="/user/mail/sendMail">메일 쓰기</button>
				</div>
				<div class="card bg-menu-theme sub-side-menu mb-2">
					<button class="btn btn-outline-primary btn-home-button" data-btn-home-location="/WareBridge/user/eworks">결재문서 작성</button>
				</div>
				<div class="card bg-menu-theme sub-side-menu mb-2">
					<button class="btn btn-outline-primary btn-home-button" data-btn-home-location="/WareBridge/user/board/company">게시글 등록</button>
				</div>
				<div class="card bg-menu-theme sub-side-menu mb-2">
					<button class="btn btn-outline-primary btn-home-button" data-btn-home-location="/WareBridge/user/address">주소록 등록</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
						<!-- 입찰정보 추천 -->
		<div class="row overflow-auto d-flex" style="height:82vh;">
			<div class="col-md-8">
				<div class="card mb-3 col">
				<!-- 메일 출현~ -->
					<div class="card-body">
						<h5 class="card-title  home-card-title" data-title-location="/WareBridge/user/mail/inMail"><a href="#">받은 메일함</a></h5> 
						<hr class="myIndexHr">
						<div class="table-responsive text-nowrap">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>읽음</th>
										<th>보낸 사람</th>
										<th>메일 제목</th>
										<th>받은 시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mail}" var="mail" begin="0" end="2">
									    <tr class="mail-inside" data-mailcode="${mail.mailCode}">
									        <c:choose>
									            <c:when test="${mail.mailRead eq 'X'}">
									                <td>
									                    <i class="light-style cursor-pointer tf-icons bx bx-envelope bx-sm"></i>
									                </td>
									                <td><strong>${mail.mailSender}</strong></td>
									                <td><strong>${mail.mailTitle}</strong></td>
									                <td><strong>${mail.mailDate}</strong></td>
									            </c:when>
									            <c:otherwise>
									                <td>
									                    <i class="cursor-pointer tf-icons bx bx-envelope-open bx-sm"></i>
									                </td>
									                <td>${mail.mailSender}</td>
									                <td>${mail.mailTitle}</td>
									                <td>${mail.mailDate}</td>
									            </c:otherwise>
									        </c:choose>
									    </tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				
				<div class="card mb-3 col">
					<div class="card-body">
					<h5 class="card-title home-card-title" data-title-location="/WareBridge/user/board/company"><a href="#">전사 공지사항</a></h5>
					<hr class="myIndexHr">
						<div class="table-responsive text-nowrap">
							 <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>"/>
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width:180px;">작성자</th>
										<th style="width:400px;">제목</th>
										<th>작성일자</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeList}" var="noticeList">
										<c:set var="boardDate" value="${fn:substring(noticeList.cbDat, 0, 10)}" />
									    <tr class="notice-inside" data-notice-code="${noticeList.cbNo}">
							                <td>${noticeList.empName}</td>
							                <td>${noticeList.cbName}</td>
							                 <c:choose>
											        <c:when test="${boardDate eq currentDate}">
											            <td>${fn:substring(noticeList.cbDat, 11, 19)}</td>
											        </c:when>
											        <c:otherwise>
										                <td>${boardDate}</td>
											        </c:otherwise>
											    </c:choose>
							                
							                <td>${noticeList.cbViews}</td>
									    </tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
				<div class="card mb-3 col">
					<div class="card-body">
						<div class="col-md-12">
							<h5 class="card-title">입찰정보 추천</h5>
							<hr class="myIndexHr">
							<div class="table-responsive text-nowrap overflow-hidden">
								<table class="table">
									<thead>
										<tr>
											<th>공고명</th>
											<th>공고기관</th>
											<th>게시일</th>
											<th>사업금액</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty bidrcmdList }">
												<c:forEach items="${bidrcmdList }" var="bid">
													<tr>
														<td><a href="#" class="bid-link"
															data-url="${bid.bidinfo.biUrl}"
															data-bidno="${bid.bidinfo.biBidno}">${bid.bidinfo.biBidname}</a></td>
														<td>${bid.bidinfo.biAdagncs }</td>
														<td>${bid.bidinfo.biBiddt }</td>
														<td>${bid.bidinfo.biBidamout }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">입찰 추천정보 없음</td>
												</tr>
											</c:otherwise>
										</c:choose>
										<caption class="ms-4">
											<a href='/user/bid/others' class="btn btn-outline-primary bid-others">다른 공고 보기</a>
										</caption>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<div class="col-md-4">
			
			
				<div class="card mb-3 col">
					<div class="card-body">
						<div class="col-md-12">
							<h5 class="card-title home-card-title" data-title-location="/WareBridge/user/calendar"><a href="#">오늘의 일정</a></h5>
							<hr class="myIndexHr">
							<div class="table-responsive text-nowrap overflow-hidden">
								<table class="table">
								
									<thead>
										<tr>
											<th colspan="2">내 일정</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty myList}">
											<c:forEach items="${myList}" var="MyToday">
												<tr>
													<td style="width: 300px;">${MyToday.scheduleName }</td>
													<td>${fn:substring(MyToday.scheduleStartDat, 11, 17)} ~ ${fn:substring(MyToday.scheduleEndDat, 11, 17)}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty myList}">
											<tr>
												<td colspan="2">일정이 존재하지 않습니다.</td>
											</tr>
										</c:if>
									</tbody>
								
								
									<thead>
										<tr>
											<th colspan="2">${dptList[0]} 일정</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty dpt1List}">
											<c:forEach items="${dpt1List}" var="MyToday">
												<tr>
													<td style="width: 300px;">${MyToday.scheduleName }</td>
													<td>${fn:substring(MyToday.scheduleStartDat, 11, 17)} ~ ${fn:substring(MyToday.scheduleEndDat, 11, 17)}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty dpt1List}">
											<tr>
												<td colspan="2">일정이 존재하지 않습니다.</td>
											</tr>
										</c:if>
									</tbody>
								
									<c:if test="${not empty dptList[1]}">
										<thead>
											<tr>
												<th colspan="2">${dptList[1]} 일정</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty dpt2List}">
												<c:forEach items="${dpt2List}" var="MyToday">
													<tr>
														<td style="width: 300px;">${MyToday.scheduleName }</td>
														<td>${fn:substring(MyToday.scheduleStartDat, 11, 17)} ~ ${fn:substring(MyToday.scheduleEndDat, 11, 17)}</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty myList}">
												<tr>
													<td colspan="2">일정이 존재하지 않습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</c:if>
								
									<thead>
										<tr>
											<th colspan="2">전사 일정</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty companyList}">
											<c:forEach items="${companyList}" var="MyToday">
												<tr>
													<td style="width: 300px;">${MyToday.scheduleName }</td>
													<td>${fn:substring(MyToday.scheduleStartDat, 11, 17)} ~ ${fn:substring(MyToday.scheduleEndDat, 11, 17)}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty companyList}">
											<tr>
												<td colspan="2">일정이 존재하지 않습니다.</td>
											</tr>
										</c:if>
									</tbody>
									
								</table>
							</div>
						</div>
					</div>
				</div>




				<div class="card mb-3 col">
					<div class="card-body">
						<div class="col-md-12">
							<h5 class="card-title home-card-title" data-title-location="/WareBridge/user/eworks"><a href="#">결재 대기 문서</a></h5>
							<hr class="myIndexHr">
							<div class="table-responsive text-nowrap overflow-hidden">
								<table class="table">
								
									<thead>
										<tr>
											<th style="width: 100px;">기안자</th>
											<th>대기 문서명</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty sdcList}">
											<c:forEach items="${sdcList}" var="sdc">
												<tr>
													<td style="width: 100px;">${sdc.docWriter.empName }</td>
													<td>${sdc.sdcTitle}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty sdcList}">
											<tr>
												<td colspan="2">결재 대기 문서가 존재하지 않습니다.</td>
											</tr>
										</c:if>
									</tbody>
									
								</table>
							</div>
						</div>
					</div>
				</div>




				<div class="card mb-3 col">
					<div class="card-body">
						<div class="col-md-12">
							<h5 class="card-title home-card-title" data-title-location="/WareBridge/user/community/chat"><a href="#">채팅방</a></h5>
							<hr class="myIndexHr">
							<div class="table-responsive text-nowrap overflow-hidden">
								<table class="table">
									<tbody>
										<c:forEach items="${chatRoomList}" var="room">
											<tr>
												<td>
													<i class='bx bxs-user'></i>${room.cnt }
													${room.myTitle }
													&nbsp&nbsp&nbsp
										        	<c:choose>
										        		<c:when test="${room.notReadMsgCnt eq '0'}">
										        			<span class="badge badge-center rounded-pill bg-primary for-chat-pill" id="${room.chatRoomNo}"></span>
										        		</c:when>
										        		<c:when test="${room.notReadMsgCnt > '99'}">
										        			<span class="badge badge-center rounded-pill bg-primary for-chat-pill" id="${room.chatRoomNo}">99+</span>
										        		</c:when>
										        		<c:otherwise>
										        			<span class="badge badge-center rounded-pill bg-primary for-chat-pill" id="${room.chatRoomNo}">${room.notReadMsgCnt }</span>
										        		</c:otherwise>
										        	</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
			</div>
			
			
		</div>
	</div>
	<div class="form-floating mt-2">
		<div id="floatingInputHelp" class="form-text">
			<div class="table-responsive text-nowrap">
				<table class="table table-lg">
					<tbody class="table-border-bottom-0 table table-dark">
						<tr>
						    <td><strong>${news.newsCom}</strong></td>
						    <td><strong>${news.newsField}</strong></td>
						    <td>
						        <a href="${news.newsLink}" target="_blank" style="text-decoration: none; color: inherit;">
						            <strong>${news.newsTitle}</strong>
						        </a>
						    </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>