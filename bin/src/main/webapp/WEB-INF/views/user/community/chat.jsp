<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>커뮤니티</span>
					</div>
					<button class="btn btn-primary btn-compose">미정</button>
				</div>
				<div id="layout-menu"
					class="card-body row d-grid menu menu-vertical ">
					<ul class="menu-inner">
						<li class="menu-item active"><a href="/WareBridge/user/community/chat" class="menu-link">
								<div class="sub-side-div">채팅</div>
						</a></li>
						<li class="menu-item"><a href="javascript:;"
							class="menu-link">
								<div class="sub-side-div">화상회의</div>
						</a></li>
						<li class="menu-item"><a href="javascript:;"
							class="menu-link">
								<div class="sub-side-div">회의록</div>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card">
					<div id="inner-card-body" class="card-body" style="height: 82vh">
						<div class="inbox_msg" style="height:100%">
							<div class="inbox_people" style="height:100%">
								<div class="nav-align-top mb-4" style="height:100%">
								    <ul class="nav nav-tabs nav-fill" role="tablist">
							        	<li class="nav-item" role="presentation">
							            	<button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true"><i class="tf-icons bx bx-user me-1"></i><span class="d-none d-sm-block">사원</span></button>
								        </li>
								        <li class="nav-item" role="presentation">
								            <button id="chatRoomTab" type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-home me-1"></i><span class="d-none d-sm-block">채팅방</span></button>
								        </li>
								    </ul>
								    <div class="tab-content overflow-auto" style="height:100%">
								    	<div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
								        	<div class="headind_srch">
												<div class="recent_heading">
													<h4>Recent</h4>
												</div>
												<div class="srch_bar">
													<div class="stylish-input-group">
														<input type="text" class="search-bar" placeholder="Search">
													</div>
												</div>
											</div>
											<div style="height:100%">
												<div class="chat_list overflow-auto" style="height:59vh;">
													<c:forEach items="${empList}" var="emp">
														<div class="chat_people chat-user" data-emp-no="${emp.empNo}">
															<div class="chat_img">
																<c:if test="${empty emp.empPicpath }">
																	<img class="profileImg" height="50" width="50" src="<c:url value='/resources/files/default_profile.png'/>">
																</c:if>
																<c:if test="${not empty emp.empPicpath }">
																	<img class="profileImg" height="50" width="50" src="data:image/png;base64,${emp.base64}">
																</c:if>
															</div>
															<div class="chat_ib">
																<span>
																	${emp.empName } ${emp.empJobposition }님
																</span>
															</div>
														</div>
														<hr>
													</c:forEach>
												</div>
											</div>
								        </div>
								        <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
								        	<div class="chat-rooms">
											    <c:forEach items="${chatRoomList}" var="chatRoom">
<!-- 											    	<form name="usersFormPopup"> -->
<!-- 											    	<input type="hidden" id="roomId" name="roomId"/> -->
<!-- 													<input type="hidden" id="username" name="username"/> -->
											        <div class="chat-room d-flex col" data-room-no="${chatRoom.chatRoomNo}">
											        	<div class="col-11">
												        	<h5 class="room-title">
													        	<c:if test="${not empty chatRoom.myTitle }">
														            ${chatRoom.myTitle}
													        	</c:if>
													        	<c:if test="${empty chatRoom.myTitle }">
														            ${chatRoom.title}
													        	</c:if>
												        	</h5>
												        	<i class='bx bxs-user'></i>${chatRoom.cnt }
											        	</div>
											        	<div class="dropdown">
												        	<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown" aria-expanded="false">
													            <i class="bx bx-dots-vertical-rounded"></i>
													        </button>
													        <div class="dropdown-menu">
													            <a class="dropdown-item change-chatRoomTitle" data-room-no="${chatRoom.chatRoomNo}"> 
													                <i class="bx bx-edit-alt me-1"></i> 채팅방 이름 설정
													            </a>
													            <a class="dropdown-item update-chatRoomUser" data-room-no="${chatRoom.chatRoomNo}"> 
													                <i class='bx bx-user-plus me-1'></i> 사용자 초대
													            </a>
													            <a class="dropdown-item out-from-chatRoom" data-room-no="${chatRoom.chatRoomNo}"> 
													                <i class="bx bx-log-out me-1"></i> 나가기
													            </a>
													        </div>
											        	</div>
											        </div>
<!-- 											        </form> -->
											        <hr>
											    </c:forEach>
											</div>
								        </div>
									</div>
							    </div>
							</div>
							<div class="mesgs">
								<div>
									<h4 class="msg-title">Title</h4>
									<input type="hidden" id="forRoomNo">
								</div>
								<hr>
								<div class="msg_history" style="height:60vh">
								</div>
								<div class="type_msg" style="height:100%">
									<div class="input_msg_write">
										<input type="text" class="write_msg" placeholder="Type a message" onkeypress="enterKey(event)"/>
										<button class="msg_send_btn" type="button" data-room-no="false">
											<i class="fa fa-paper-plane" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						 
						<input type="button" id="modifyRoomTitleButton" data-bs-toggle="modal" data-bs-target="#modifyRoomTitle" style="display: none"/>
						<div class="modal fade" id="modifyRoomTitle" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">채팅방 이름 변경</h5>
									</div>
									<form id="modifyRoomTitleForm">
										<div class="modal-body">
											<div class="col mb-3">
												<input type="text" class="form-control" name="crjChatRoomNo" style="display: none">
											</div>
											<div class="col mb-3">
												<input type="text" class="form-control" name="myTitle" style="text-align: center;">
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">변경</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
										</div>
									</form>
								</div>
							</div>
						</div>

						<input type="button" id="updateChatRoomUserButton" data-bs-toggle="modal" data-bs-target="#updateChatRoomUser" style="display: none"/>
						<div class="modal fade" id="updateChatRoomUser" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header col">
										<div class="col-3">
											<h5 class="modal-title">사용자 초대</h5>
										</div>
										<div>
											<input type="hidden" id="hidden4roomNo">
											<button id="updateRoomUserButton" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">초대</button>
										</div>
									</div>
									<hr>
									
									<div id="updateUsersList" class="chat_list overflow-auto" style="height:59vh;">
									</div>
									
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>