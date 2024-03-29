<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="row">
		<div class="col-3">
			<div id="deptTree">
				<ul id="treeData" style="display: none;">
					<li id="SUP" class="folder">지원부
						<ul>
							<li id="SUP-D01" class="folder">인사과
								<ul>
									<li id="SUP-D01-01" class="file">교육팀</li>
									<li id="SUP-D01-02" class="file">인사팀</li>
								</ul></li>
						<li id="SUP-D02" class="folder">총무과
							<ul>
								<li id="SUP-D01-01" class="file">회계팀</li>
								<li id="SUP-D01-02" class="file">시설관리팀</li>
								<li id="SUP-D01-02" class="file">구매팀</li>
							</ul></li>
						<li id="SUP-D03" class="folder">법무과
							<ul>
								<li id="SUP-D01-01" class="file">법무팀</li>
							</ul></li>
						</ul>
					</li>
				
				<li id="SER" class="folder">서비스부
					<ul>
						<li id="SER-D01" class="folder">제품관리과
							<ul>
								<li id="SER-D01-01" class="file">제품기획팀</li>
								<li id="SER-D01-02" class="file">제품마케팅팀</li>
							</ul></li>
					<li id="SER-D02" class="folder">영업과
						<ul>
							<li id="SER-D01-01" class="file">영업1팀</li>
							<li id="SER-D01-02" class="file">영업2팀</li>
						</ul></li>
					</ul>
				</li>
					<li id="TF" class="folder">TF팀
						<ul>
							<li id="ESG" class="file">ESG경영 TF
							</li>
							<li id="BI" class="file">비스니스혁신 TF
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="col">
			<div class="table-responsive text-nowrap">
			<table class="table">
			<thead>
			<tr>
			<th>부서</th>
			<th>이름</th>
			<th>직책</th>
			<th>근무장소</th>
			<th>담당업무</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>교육팀</td>
			<td>
			<div class="dropdown">
			<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			김상후
			</button>
			<div class="dropdown-menu">
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-mail-send me-1"></i> 메일보내기</a>
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-chat me-1"></i> 채팅하기</a>
			</div>
			</div>
			</td>
			<td>팀장</td>
			<td>403호</td>
			<td>교육팀 업무 총괄</td>
			</tr>
			<tr>
			<td>교육팀</td>
			<td>
			<div class="dropdown">
			<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			김명희
			</button>
			<div class="dropdown-menu">
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-mail-send me-1"></i> 메일보내기</a>
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-chat me-1"></i> 채팅하기</a>
			</div>
			</div>
			</td>
			<td>대리</td>
			<td>403호</td>
			<td>사원 교육과정 기획</td>
			</tr>
			<tr>
			<td>교육팀</td>
			<td>
			<div class="dropdown">
			<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			이소리
			</button>
			<div class="dropdown-menu">
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-mail-send me-1"></i> 메일보내기</a>
			<a class="dropdown-item" href="javascript:void(0);">
			<i class="bx bx-chat me-1"></i> 채팅하기</a>
			</div>
			</div>
			</td>
			<td>사원</td>
			<td>403호</td>
			<td>사원 교육과정 기획</td>
			</tr>
			</table>
			</div>
		</div>
	</div>
</div>