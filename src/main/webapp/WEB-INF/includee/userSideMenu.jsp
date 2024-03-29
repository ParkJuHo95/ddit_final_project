<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="<%=request.getContextPath()%>/user/home" class="app-brand-link">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="app-brand-logo demo">
      	<img class="logoImg" src="<%=request.getContextPath()%>/resources/WareBridge_coral.png">
<%--       	<img src="<%=request.getContextPath()%>/resources/WareBridge_purple.png"> --%>
      </span>
    </a>

    <a href="javascript:;" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item active">
      <a href='<c:url value="/user/home/body"/>' class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">홈</div>
      </a>
    </li>
	 <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/calendar" class="menu-link">
        <i class="menu-icon tf-icons bx bx-calendar"></i>
        <div data-i18n="Layouts">일정관리</div>
      </a>
    </li>
    <li class="menu-item" style="position: relative;">
      <a href="<%=request.getContextPath()%>/user/mail/inMail" class="menu-link" id="mailBadgeParent">
        <i class="menu-icon tf-icons bx bx-mail-send"></i>
        <div data-i18n="Account Settings">메일</div>
        <span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="mailBadge"></span>
<%--         <c:if test="${mailCnt > 0 }"><span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="mailBadge">${mailCnt }</span></c:if> --%>
      </a>
    </li>
    <!-- Components -->
    <!-- Cards -->
    <li class="menu-item" style="position: relative;">
      <a href="<%=request.getContextPath()%>/user/eworks" class="menu-link" id="sdcBadgeParent">
        <i class="menu-icon tf-icons bx bx-paste"></i>
        <span data-i18n="Account Settings">전자결재</span> 
        <span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="sdcBadge"></span>
<%--         <c:if test="${sdcNum > 0 }"><span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="sdcBadge">${sdcNum }</span></c:if>  --%>
      </a>
    </li>

    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/repository?who=E" class="menu-link">
        <i class="menu-icon tf-icons bx bx-folder"></i>
        <div data-i18n="Account Settings">드라이브</div>
      </a>
    </li>
	
    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/board/company" class="menu-link">
        <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
        <div data-i18n="Layouts">커뮤니티</div>
      </a>
    </li>
    
      <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/community/chat" class="menu-link">
        <i class="menu-icon tf-icons bx bx-chat"></i>
        <div data-i18n="Layouts">커뮤니케이션</div> <span class="badge badge-center rounded-pill bg-primary" style="position: absolute; right: 15px;" id="newTextBadge"></span>
      </a>
    </li>
    
    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/book/bookSub" class="menu-link">
        <i class="menu-icon tf-icons bx bx-time"></i>
        <div data-i18n="Layouts">예약</div>
      </a>
    </li>


    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/user/address" class="menu-link">
        <i class="menu-icon tf-icons bx bx-receipt"></i>
        <div data-i18n="Layouts">주소록</div>
      </a>
    </li>
   
	</ul>
</aside>
