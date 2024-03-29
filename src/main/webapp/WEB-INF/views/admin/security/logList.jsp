<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   


<div id="inner-card-body" class="card-body" style="height: 82vh">
	<div class="table-responsive text-nowrap" style="height: 90%;">
		<h5 class="card-header">사원 접속 로그</h5>
		<div class="table-responsive ">
			<table class="table border-top" style="text-align: center;">
          		<thead>
		            <tr>
		              <th class="text-truncate">접속브라우저</th>
		              <th class="text-truncate">접속기기</th>
		              <th class="text-truncate">사원명</th>
		              <th class="text-truncate">접속위치</th>
		              <th class="text-truncate">접속IP</th>
		              <th class="text-truncate">접속일시</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-windows text-info me-3"></i> <span class="fw-medium">크롬 on Windows</span></td>
		              <td class="text-truncate">HP Spectre 360</td>
		              <td class="text-truncate">김몽길</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 20:07</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bx-mobile-alt text-danger me-3"></i> <span class="fw-medium">크롬 on iPhone</span></td>
		              <td class="text-truncate">iPhone 12x</td>
		              <td class="text-truncate">dreaminfosystem</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 10:10</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bx-mobile-alt text-danger me-3"></i> <span class="fw-medium">크롬 on iPhone</span></td>
		              <td class="text-truncate">iPhone 12x</td>
		              <td class="text-truncate">박주호</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 10:10</td>
		            </tr>
		            
					<tr>
		              <td class="text-truncate"><i class="bx bxl-windows text-info me-3"></i> <span class="fw-medium">크롬 on Windows</span></td>
		              <td class="text-truncate">HP Spectre 360</td>
		              <td class="text-truncate">김소적</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 20:07</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-android text-success me-3"></i> <span class="fw-medium">크롬 on Android</span></td>
		              <td class="text-truncate">Oneplus 9 Pro</td>
		              <td class="text-truncate">신흥석</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 15:15</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-android text-success me-3"></i> <span class="fw-medium">크롬 on Android</span></td>
		              <td class="text-truncate">Oneplus 9 Pro</td>
		              <td class="text-truncate">차택우</td>
		              <td class="text-truncate">대전 중구 오류동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 15:15</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-apple me-3"></i> <span class="fw-medium">크롬 on MacOS</span></td>
		              <td class="text-truncate">Apple iMac</td>
		              <td class="text-truncate">김연석</td>
		              <td class="text-truncate">대전 서구 만년동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 16:17</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-windows text-info me-3"></i> <span class="fw-medium">크롬 on Windows</span></td>
		              <td class="text-truncate">HP Spectre 360</td>
		              <td class="text-truncate">이진호</td>
		              <td class="text-truncate">서울 중랑구 면목동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 21:01</td>
		            </tr>
		            <tr>
		              <td class="text-truncate"><i class="bx bxl-windows text-info me-3"></i> <span class="fw-medium">크롬 on Windows</span></td>
		              <td class="text-truncate">HP Spectre 360</td>
		              <td class="text-truncate">박진화</td>
		              <td class="text-truncate">서울 중랑구 면목동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 21:01</td>
		            </tr>
		            <tr class="border-transparent">
		              <td class="text-truncate"><i class="bx bxl-android text-success me-3"></i> <span class="fw-medium">크롬 on Android</span></td>
		              <td class="text-truncate">Oneplus 9 Pro</td>
		              <td class="text-truncate">이미연</td>
		              <td class="text-truncate">서울 중랑구 면목동</td>
		              <td class="text-truncate">192.0.0.5</td>
		              <td class="text-truncate">2024-03-22 12:22</td>
		            </tr>
		          </tbody>
				</table>
			</div>
		</div>
      <hr>
	<div>
		<div class="col d-flex" >
			<div class="col-1" >
				<form>
					<select class="form-select">
						<option value="" label="전체" />
						<option value="sub" label="사원명" />
						<option value="con" label="접속위치" />
					</select>
				</form>
			</div>
			<div class="col-3 d-flex align-items-start">
				<input type="search" class="form-control" aria-label="Search"/>
				<input type="button"  class="btn btn-outline-primary" value="검색"/>
			</div>
			<div class="col-3">
				<nav aria-label="Page navigation">
		            <ul class="pagination justify-content-center">
		              <li class="page-item prev">
		                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
		              </li>
		              <li class="page-item active">
		                <a class="page-link" href="javascript:void(0);">1</a>
		              </li>
		              <li class="page-item">
		                <a class="page-link" href="javascript:void(0);">2</a>
		              </li>
		              <li class="page-item ">
		                <a class="page-link" href="javascript:void(0);">3</a>
		              </li>
		              <li class="page-item">
		                <a class="page-link" href="javascript:void(0);">4</a>
		              </li>
		              <li class="page-item">
		                <a class="page-link" href="javascript:void(0);">5</a>
		              </li>
		              <li class="page-item next">
		                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
		              </li>
		            </ul>
		          </nav>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
</div>

