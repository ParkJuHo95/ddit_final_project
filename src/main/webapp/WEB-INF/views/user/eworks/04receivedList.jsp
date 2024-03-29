<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* 추가한 CSS */
th:nth-child(4), td:nth-child(4) {
	width: 30%; /* 원하는 너비로 조정 */
}
</style>
<div class="row">

	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<!-- Bordered Table -->
					<div class="card-body" id="inner-card-body" style="height: 82vh">
						<h5 class="card-header">수신 문서</h5>
						<div class="table-responsive text-nowrap">
							<table class="table">
								<caption class="ms-4">아래쪽 내용</caption>
								<thead>
									<tr>
										<th>기안일</th>
										<th>결재양식</th>
										<th>긴급</th>
										<th>제목</th>
										<th>기안자</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2011-02-11</td>
										<td>양식이름</td>
										<td>긴급아이콘</td>
										<td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>문서제목~~</strong>
										</td>
										<!--                    <td>  점세개 드롭다운메뉴     <div class="dropdown"> -->
										<!--                             <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"> -->
										<!--                               <i class="bx bx-dots-vertical-rounded"></i> -->
										<!--                             </button> -->
										<!--                             <div class="dropdown-menu"> -->
										<!--                               <a class="dropdown-item" href="javascript:void(0);" -->
										<!--                                 ><i class="bx bx-edit-alt me-1"></i> Edit</a -->
										<!--                               > -->
										<!--                               <a class="dropdown-item" href="javascript:void(0);" -->
										<!--                                 ><i class="bx bx-trash me-1"></i> Delete</a -->
										<!--                               > -->
										<!--                             </div> -->
										<!--                           </div> </td>-->
										<td>기안자이름</td>
										<td><span class="badge bg-label-info me-1">결재대기</span></td>
									</tr>
									<tr>
										<td>2011-02-11</td>
										<td>양식이름</td>
										<td>긴급아님</td>
										<td><i class="fab fa-vuejs fa-lg text-success me-3"></i>
											<strong>문서제목2번</strong></td>
										<td>사원이름</td>
										<td><span class="badge bg-label-info me-1">결재대기</span></td>
									</tr>
									<tr>
										<td>2011-02-11</td>
										<td>양식이름</td>
										<td>긴급아님</td>
										<td><i class="fab fa-vuejs fa-lg text-success me-3"></i>
											<strong>문서제목3번</strong></td>
										<td>사원이름</td>
										<td><span class="badge bg-label-info me-1">결재대기</span></td>
									</tr>
									<tr>
										<td>2011-02-11</td>
										<td>양식이름</td>
										<td>긴급아님</td>
										<td><i class="fab fa-vuejs fa-lg text-success me-3"></i>
											<strong>문서제목3번</strong></td>
										<td>사원이름</td>
										<td><span class="badge bg-label-info me-1">결재대기</span></td>

									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Bootstrap Table with Caption -->
				</div>
			</div>
		</div>
	</div>
</div>
