<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<div class="row">
	<div class="col-lg-2 mb-0 order-0">
		<div class="card" style="height: 82vh">
			<div class="d-flex row">
				<div class="card-header d-grid">
					<div class="header-main mb-3"> 
						<span>게시판</span>
					</div>
					<button class="btn btn-primary btn-compose">게시글 등록</button>
				</div>
				<div id="layout-menu" class="card-body row d-grid menu menu-vertical ">
<!-- 					<aside id="layout-menu" class="row d-grid menu menu-vertical"> -->
					<ul class="menu-inner">
						<li class="menu-item active">
							<a href="javascript:;" class="menu-link">
								<div class="sub-side-div">전사 게시판</div>
							</a>
						</li>
						<li class="menu-item">
							<a href="javascript:;" class="menu-link  menu-toggle">
								<div class="sub-side-div">팀 게시판</div>
							</a>
							<ul class="menu-sub">
								<li class="menu-item">
									<a href="javascript:;" class="menu-link  menu-toggle">
										<div class="sub-sub-div">팀1</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link  menu-toggle">
										<div class="sub-sub-div">팀2</div>
									</a>
								</li>
								<li class="menu-item">
									<a href="javascript:;" class="menu-link  menu-toggle">
										<div class="sub-sub-div">팀3</div>
									</a>
								</li>
							</ul>
						</li>
						
					</ul>
<!-- 					</aside> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-10 col-md-0" >
		<div class="row">
			<div class="col col-md-12 col-6" >
				<div class="card">
					<div class="card-body" style="height: 82vh">
					  <h5>전사 게시판</h5>
				      <div class="mb-3">
				         <button type="button" class="btn btn-light"
				            onclick="location.href='/newPost'">새글쓰기</button>
				         <button type="button" class="btn btn-light" onclick="deletePosts()">삭제</button>
				         <button type="button" class="btn btn-light"
				            onclick="registerNotice()">공지로 등록</button>
				         <button type="button" class="btn btn-light"
				            onclick="downloadAttachments()">첨부파일 다운로드</button>
				      </div>
				      <div class="table-responsive text-nowrap">
				         <table class="table table-bordered">
				            <thead style="background-color: #797979;">
				               <tr>
				                  <th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onclick="selectAll(this)"></th>
				                  <th style="width: 2%; color: white;">번호</th>
				                  <th style="width: 40%; color: white;">제목</th>
				                  <th style=" color: white;">작성자</th>
				                  <th style=" color: white;">작성일</th>
				                  <th style=" color: white;">조회</th>
				                  <th style=" color: white;">좋아요</th>
				               </tr>
				            </thead>
				            <tbody>
                              <tr style="background-color: #f2f2f2;">
							    <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							    <td><i class="fab fa-angular fa-lg text-danger me-3"></i></td>
							    <td>진짜싫다 (공지)</td>
							    <td>
							        <!-- 작성자 정보 -->
							    </td>
							    <td><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></td>
							    <td>
							        <!-- 조회 수 -->
							    </td>
							    <td>
							        <!-- 좋아요 수 -->
							    </td>
							   </tr>
				               <tr>
				                  <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				                  <td><strong>1</strong></td>
				                  <td>하기싫다</td>
				                  <td>
				                     <!-- 작성자 정보 -->
				                  </td>
				                  <td><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></td>
				                  <td>
				                     <!-- 조회 수 -->
				                  </td>
				                  <td>
				                     <!-- 좋아요 수 -->
				                  </td>
				               </tr>
				               <tr>
				                  <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				                  <td><strong>2</strong></td>
				                  <td>진짜 하기싫다</td>
				                  <td>
				                     <!-- 작성자 정보 -->
				                  </td>
				                  <td><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></td>
				                  <td>
				                     <!-- 조회 수 -->
				                  </td>
				                  <td>
				                     <!-- 좋아요 수 -->
				                  </td>
				               </tr>
				               <tr>
				                  <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				                  <td><strong>3</strong></td>
				                  <td>못해먹겠다</td>
				                  <td>
				                     <!-- 작성자 정보 -->
				                  </td>
				                  <td><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></td>
				                  <td>
				                     <!-- 조회 수 -->
				                  </td>
				                  <td>
				                     <!-- 좋아요 수 -->
				                  </td>
				               </tr>
				               <tr>
				                  <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				                  <td>
				                     <strong>4</strong></td>
				                  <td>어떻게하는지알려줄사람</td>
				                  <td>
				                     <!-- 작성자 정보 -->
				                  </td>
				                  <td><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></td>
				                  <td>
				                     <!-- 조회 수 -->
				                  </td>
				                  <td>
				                     <!-- 좋아요 수 -->
				                  </td>
				               </tr>
				
				               <!-- ... -->
				            </tbody>
				         </table>
				         <br>
				         <br>
				         <br>
				         <br>
				
				      </div>
				      <div class="table_search table_new_search d-flex justify-content-center ">
				         <select id="duration">
				            <option value="all">전체기간</option>
				            <option value="-1">1개월</option>
				            <option value="-6">6개월</option>
				            <option value="-12">1년</option>
				         </select>
				
				         <div id="durationPeriod" class="search_option" style="display: none">
				            <input id="fromDate" class="txt_mini wfix_small" type="text">
				            ~ <input id="toDate" class="txt_mini wfix_small" type="text">
				         </div>
				
				         <select style="display: inline" id="searchTypes">
				            <option value="titleAndContent">제목+내용</option>
				            <option value="titleOnly">제목</option>
				            <option value="userName">작성자</option>
				         </select>
				         <div class="search2">
				            <div class="search_wrap d-flex">
				               <div class="col-auto">
				                  <input type="text" name="buyerName"
				                     value="${condition.buyerName }" placeholder="검색" />
				               </div>
				               <div class="col-auto">
				                  <button data-pg-role="searchBtn">검색</button>
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

<script>
   function selectAll(selectAll)  {
        const checkboxes 
           = document.querySelectorAll('input[type="checkbox"]');
        
        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked
        });
      }
</script>