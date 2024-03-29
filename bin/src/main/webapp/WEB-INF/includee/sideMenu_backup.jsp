<%@ page contentType="text/html; charset=UTF-8" %>

<!-- <script type="text/javascript"> -->
<!-- // 	$(".menu-item").on('click',function(){ -->
<!-- // 		$(".menu-item").removeClass('active'); -->
<!-- // 		this.addClass('active'); -->
<!-- // 	}) -->
<!-- </script> -->
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="<%=request.getContextPath()%>/index/main" class="app-brand-link">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="app-brand-logo demo">
      	<img src="<%=request.getContextPath()%>/resources/WareBridge_coral.png">
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
      <a href="javascript:;" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">홈</div>
      </a>
    </li>

    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">메일</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Account">받은메일함</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Notifications">보낸메일함</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Connections">메일쓰기</div>
          </a>
        </li>
      </ul>
    </li>
    <!-- Components -->
    <!-- Cards -->
    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">자료실</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Account">전사자료실</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Notifications">팀자료실</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Connections">개인자료실</div>
          </a>
        </li>
      </ul>
    </li>

    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">전자결재</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link menu-toggle">
            <div data-i18n="Account">결재 상신함</div>
          </a>
          <ul class="menu-sub">
            <li>
	          <a href="javascript:;" class="menu-link">
	            <div data-i18n="Account">세부 상신함1</div>
	          </a>
	        </li>
            <li>
	          <a href="javascript:;" class="menu-link">
	            <div data-i18n="Account">세부 상신함2</div>
	          </a>
	        </li>
            <li>
	          <a href="javascript:;" class="menu-link">
	            <div data-i18n="Account">세부 상신함3</div>
	          </a>
	        </li>
    	 </ul>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Account">결재 수신함</div>
          </a>
        </li>
      </ul>
    </li>
    
      <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">커뮤니티</div>
      </a>

      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">채팅</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Container">화상회의</div>
          </a>
        </li>
      </ul>
    </li>
    
    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">예약</div>
      </a>

      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">비어있음</div>
          </a>
        </li>
      </ul>
    </li>


    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">주소록</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">공용 주소록</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">개인 주소록</div>
          </a>
        </li>
      </ul>
    </li>
    
    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">게시판</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">비어있음</div>
          </a>
        </li>
      </ul>
    </li>
    
    
    <li class="menu-item">
      <a href="javascript:;" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">캘린더</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div data-i18n="Without menu">비어있음</div>
          </a>
        </li>
      </ul>
    </li>
    
    
    <li class="menu-item">
      <a href="javascript:;" class="menu-link">
        <i class="menu-icon tf-icons bx bx-layout"></i>
        <div data-i18n="Layouts">조직도</div>
      </a>
    </li>
    </ul>
</aside>