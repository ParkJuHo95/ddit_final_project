<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card bg-menu-theme sub-side-menu" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3">
						<span>드라이브</span>
					</div>
					<button class="btn btn-primary btn-compose" data-bs-toggle="modal" data-bs-target="#exLargeModal" >업로드</button>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical inner-sub-menu">
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="/WareBridge/user/repository?who=E" class="menu-link">
								<div class="sub-side-div">개인 자료실</div>
							</a>
						</li>
						<li class="menu-item">
							<a class="menu-link menu-toggle">
								<div class="sub-side-div">팀 자료실</div>
							</a>
							<ul class="menu-sub">
								<c:forEach items="${dptList}" var="dpt" varStatus="status">
									<li class="menu-item">
										<a href="/WareBridge/user/repository?who=D${status.count}" class="menu-link">
											<div class="sub-sub-div">${dpt}</div>
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
						<li class="menu-item">
							<a href="/WareBridge/user/repository?who=C" class="menu-link">
								<div class="sub-side-div">전사 자료실</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
<!-- 					<div id="inner-card-body" class="card-body overflow-auto"  style="height: 82vh"> -->
					<div id="inner-card-body" class="card-body"  style="height: 82vh">
						<div class="board_title">
							<div class="col d-flex">
								<div class="col-2">
									<h4>
										<c:if test="${sessionScope.who eq 'E'}">
											개인 
										</c:if>
										<c:if test="${sessionScope.who eq 'D1'}">
											${dptList[0] }
										</c:if>
										<c:if test="${sessionScope.who eq 'D2'}">
											${dptList[1] }
										</c:if>
										<c:if test="${sessionScope.who eq 'C'}">
											전사
										</c:if>
										자료실
<%-- 										<c:forEach items="${map.path }" var="path" varStatus="status"> --%>
<%-- 											<c:when test="${status}"> --%>
<%-- 												<c:if test="${status.index eq '0' || status.index eq '1' || status.index eq '2'}"> --%>
<%-- 												</c:if> --%>
<%-- 												<c:otherwise> --%>
<!-- 													&nbsp>&nbsp${map.path} -->
<%-- 												</c:otherwise> --%>
<%-- 											</c:when> --%>
<%-- 										</c:forEach> --%>
									</h4> 
								</div>
							</div>
							
							<hr>
							<div class="mb-3">
						        <input type="button" class="btn btn-outline-info btn-sm"  data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample" value="업로드"/>
						        <input type="button" class="btn btn-outline-info btn-sm downLoadBtn" value="다운로드"/>
							        <c:if test="${sessionScope.who eq 'E'}">
								        <input type="button" class="btn btn-outline-danger btn-sm" id="FTPFileDeleteBTN" value="삭제"/>
									</c:if>

							        <c:if test="${sessionScope.who eq 'D1'}">
							        	<security:authorize access="hasRole('ROLE_ADMIN')">
								        	<input type="button" class="btn btn-outline-danger btn-sm" id="FTPFileDeleteBTN" value="삭제"/>
								        </security:authorize>
									</c:if>

							        <c:if test="${sessionScope.who eq 'D2'}">
										<security:authorize access="hasRole('ROLE_ADMIN')">
								        	<input type="button" class="btn btn-outline-danger btn-sm" id="FTPFileDeleteBTN" value="삭제"/>
								        </security:authorize>
									</c:if>

							        <c:if test="${sessionScope.who eq 'C'}">
							        	<security:authorize access="hasRole('ROLE_ADMIN')">
								        	<input type="button" class="btn btn-outline-danger btn-sm" id="FTPFileDeleteBTN" value="삭제"/>
								        </security:authorize>
									</c:if>
						    </div>
					        <div class="collapse collapse-horizontal" id="collapseWidthExample">
					        	<input type="button" class="btn btn-outline-primary btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#folderModal" value="폴더"/>
					        	<input type="button" class="btn btn-outline-success btn-sm" onclick="selectFile()" value="파일"/>
					        </div>
						</div>
						
						
						<div style="height: 60vh" class="overflow-auto">
						
						
						<div class="board_list_wrap">
							<table class="table">
								<thead>
									<tr>
										<th style="width: 110px">
											<input type="checkbox" class="mt-1" id="selectAllCheckbox" onchange="selectAll(this)">
										</th>
										<th style="width: 500px" class="text-left">이름</th>
										<th style="width: 130px" class="text-left">요약</th>
										<th style="width: 130px" class="text-left">크기</th>
										<th style="width: 130px" class="text-left">확장자</th>
										<th style="width: 150px" class="text-left">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(map.path) eq '3'}">
										</c:when>
										
										<c:otherwise>
											<tr>
												<td></td>
												<td><a class="intoFile" href="#" data-file-location="back">..</a></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:otherwise>
									</c:choose>
									<c:forEach items="${list}" var="file" varStatus="status">
										<tr>
											<td><input type="checkbox" class="mt-1" id="filecheckbox${status.count}" data-real-file-name="${file.name}.${file.extension}"></td>
											<td class="Arrange4I">
											    <c:choose>
											    
											        <c:when test="${file.extension eq '폴더' }">
											            <i class='bx bxs-folder'></i>
											        </c:when>
											        
											        <c:when test="${file.extension eq 'hwp'}">
											            <i class='bx bx-file'></i>
											        </c:when>
	
											        <c:when test="${file.extension eq 'txt'}">
											            <i class='bx bx-text' ></i>
											        </c:when>
	
											        <c:when test="${file.extension eq 'zip' || file.extension eq '7z'}">
											            <i class='bx bxs-file-archive'></i>
											        </c:when>
											        
											        <c:when test="${file.extension eq 'pdf'}">
											            <i class='bx bxs-file-pdf' ></i>
											        </c:when>
											        
											        <c:when test="${file.extension eq 'jpg' || file.extension eq 'jfif' || file.extension eq 'webp' || file.extension eq 'png' || file.extension eq 'jpeg'}">
														<i class='bx bx-image-alt'></i>
											        </c:when>
											        
											        <c:otherwise>
											            <i class='bx bx-file-blank'></i>
											        </c:otherwise>
											        
											    </c:choose>
											    <c:choose>
											    	<c:when test="${file.extension eq '폴더' }">
														&nbsp;<a class="intoFile" href="#" data-file-location="${file.name}">${file.name}</a>
											    	</c:when>

											    	<c:otherwise>
											            &nbsp;<a class="fileCheck" href="#" data-file-location="${file.name}">${file.name}</a>
											        </c:otherwise>
											    </c:choose>
										    </td>
										    <td class="exceptTD">
										    	 <c:if test="${ ( file.extension eq 'txt' || file.extension eq 'pdf' || file.extension eq 'hwp') && file.fileSize <= 2000000 }">
										            <a class="summaryIcon dropdown-toggle" href="#" data-file-name="${file.name}" data-file-extension="${file.extension}"
										            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										                <i class='bx bx-info-circle'></i>
										            </a>
										            <div class="dropdown-menu col-4" style="" data-popper-placement="bottom-start">
														<div class="px-3 py-2 text-muted" id="${file.name}SumDiv">
														  <h6 class="dropdown-header text-uppercase">문서 요약 내용</h6>
															<p> 
															<span class="spinner-border spinner-border-sm text-secondary" role="status">
								                          		<span class="visually-hidden">Loading...</span>
								                        	</span>문서 내용을 요약중입니다. 잠시만 기다려 주세요. 
								                        	</p>
														</div>
													 </div>
										    	 </c:if>
										    </td>
											
											<td class="text-left">
											<c:choose>
												<c:when test="${file.extension eq '폴더'}">
													&nbsp&nbsp-
												</c:when>
												<c:otherwise>
													${file.viewSize}
												</c:otherwise>
											</c:choose>
											</td>
											<td class="text-left" style="text-transform: uppercase;">${file.extension }</td>
											<td class="text-left">${file.time}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							
							<div class="modal fade" id="folderModal" tabindex="-1" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title">폴더 명</h5>
							      </div>
   					      		  <form id="modalFolder" method="post">
								 	  <div class="modal-body">
									      	<div class="col mb-3">
									        	<input type="text" name="name" class="form-control" placeholder="파일명을 적어주세요" />	
									      	</div>
								 	  </div>
								      <div class="modal-footer align-items-center">
								        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">추가</button>
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
								      </div>
					      		</form>
							    </div>
							  </div>
							</div>
							
							<form id="modalFile" method="post" enctype="multipart/form-data" style="display: none;">
								<input type="file" multiple name="files" id="hiddenFileSelect"/>
							</form>
						</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
