<%@ page contentType="text/html; charset=UTF-8" %>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="<%=request.getContextPath()%>/admin/home" class="app-brand-link">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="app-brand-logo demo">
      	<img class="logoImg" src="<%=request.getContextPath()%>/resources/WareBridge_purple.png">
      </span>
    </a>

    <a href="javascript:;" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">

    <li class="menu-item active">
      <a href="<%=request.getContextPath()%>/admin/company" class="menu-link">
        <i class="menu-icon tf-icons bx bx-mail-send"></i>
        <div data-i18n="Account Settings">회사정보 관리</div>
      </a>
    </li>

    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/admin/organization" class="menu-link">
        <i class="menu-icon tf-icons bx bx-paste"></i>
        <div data-i18n="Account Settings">조직 관리</div>
      </a>
    </li>

    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/admin/security" class="menu-link">
        <i class="menu-icon tf-icons bx bx-folder"></i>
        <div data-i18n="Account Settings">보안 관리</div>
      </a>
    </li>
    
    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/admin/book/room" class="menu-link">
        <i class="menu-icon tf-icons bx bx-chat"></i>
        <div data-i18n="Layouts">메뉴 관리</div>
      </a>
    </li>
    
    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/admin/subscribe" class="menu-link">
        <i class="menu-icon tf-icons bx bx-time"></i>
        <div data-i18n="Layouts">구독 관리</div>
      </a>
    </li>


    <li class="menu-item">
      <a href="<%=request.getContextPath()%>/admin/inquiry" class="menu-link">
        <i class="menu-icon tf-icons bx bx-receipt"></i>
        <div data-i18n="Layouts">문의</div>
      </a>
    </li>
    
  </ul>
</aside>

