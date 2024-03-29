<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">

	<div class="col-lg-10 col-md-0">
		<div class="row">
			<div class="col col-md-12 col-6">
				<div class="card">
					<!-- Bordered Table -->
					<div class="card-body" id="inner-card-body" style="height: 82vh">
						<h5 class="card-header">개인 주소록</h5>
						  <form class="d-flex">
	                        <div class="input-group">
	                          <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	                          <input type="text" id="filter-text-box" oninput="onFilterTextBoxChanged()" class="form-control w-75" placeholder="빠른검색">
	                        </div>
	                      </form>
							<div id="prsnladbkGrid" class="ag-theme-quartz-auto-dark w-100" style="height: 500px"></div>
					</div>
					<!-- Bootstrap Table with Caption -->
				</div>
			</div>
		</div>
	</div>
</div>

