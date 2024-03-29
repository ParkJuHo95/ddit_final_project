<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%response.setDateHeader("Expires", 0);  %>
<!DOCTYPE html>
<html
  lang="ko"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath }/resources/assets/"
  data-template="vertical-menu-template-free"
>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="description" content="gridstack.js Build interactive dashboards in minutes." />
<meta name="keywords" content="gridstack, typescript, jquery, grid, layout, drag-n-drop, widgets, js, javascript, gridstack.js, dashboard" />

<title><tiles:getAsString name="title"/></title>
<tiles:insertAttribute name="preScript"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR:wght@100;500&family=Sunflower:wght@500&display=swap" rel="stylesheet">


<style type="text/css">
	.sub-side-div {
		color: rgb(120, 120, 120);
		font-style: inherit;
		font-weight: 600;
		font-size: 14px;
	}
	.sub-sub-div {
		color: rgb(140, 140, 140);
		font-style: inherit;
		font-weight: 600;
		font-size: 12px;
		overflow: visible;
	}
	.header-tag {
		color: rgb(60, 60, 60);
		font-size: 35px;
		font-style: inherit;
		font-weight: 400;
	}
	.header-main {
		color: rgb(80,80,80);
		font-weight: 600;
		font-size: 23px;
		font-family: 'Nanum Gothic', sans-serif;
		text-align: center;
	}
	
	.fc-day-sun a {
    color: red;
	}
	
	.fc-day-sat a {
	    color: blue;
	}
		
	.grid-container {
	padding: 15px;
	max-width: 100%;
	max-height: 100%;
	}
	
	.center {
		margin-left: auto;
		margin-right: auto;
	}
	
	.grid-stack-item {
		background: none;
		max-width: 100%;
   		max-height: 100%;
	}
	.grid-stack {
		max-width: 100%;
   		max-height: 100%;
	}
	
	.grid-stack-item-content {
		background-color: white;
		text-align: center;
		border: solid 1px black; 
		max-width: 100%;
   		max-height: 100%;
	}
	
	h1 {
		text-align: center;
		font-size: 3rem;
		margin-top: 2rem;
		margin-bottom: 1.5rem;
	}

	section {
		padding: 0 15px 0 15px;
	}
	
	.grid-stack-item-removing {
		opacity: 0.8;
		filter: blur(5px);
	}
	
	@media all and (max-width: 575px) {
		#hero {
			margin-top: 32px;
		}
	}
	
	.logo {
		display: inline;
		margin-right: 15px;
	}
	
	#trash {
		background-color: #cc6857;
	}
		
	.newWidget>.grid-stack-item-content {
		background-color: #6cad84;
	}
	
	.profileImg {
		border-radius: 70%;
	}
	
	.profileCard {
		background-color: #FFA096;
		border-color: rgb(255, 120, 97);
	}
	
	#inner-card-body {
/* 	 overflow-x:hidden; */
	 overflow-y:auto; 
	}
	
	::-webkit-scrollbar { 
		width: 4px; 
	}
	
	::-webkit-scrollbar-track { 
		background-color: #f0f0f0; 
/* 		background-color: #f0f0f0;  */
		width: 4px; 
	}

	::-webkit-scrollbar-thumb { 
	    background: #cccccc;
/* 	    background: linear-gradient(to bottom, #1697bf, #62b7ac);  */
	    width: 4px; 
	}

	::-webkit-scrollbar-button { display: none; }
	
	td:not(.exceptTD) {
		text-overflow : ellipsis;
		overflow:hidden;
		white-space:nowrap;
		max-width: 500px;
	}
	
	td > a {
		text-overflow : ellipsis;
		overflow:hidden;
		white-space:nowrap;
		max-width: 500px;
	}

	th {
		text-overflow : ellipsis;
		white-space:nowrap;
		overflow:hidden;
		max-width: 500px;
	}

	.Arrange4I > i {
		margin-bottom: 1px;
	}
	
	.alramNoticeDIV {
		text-align: center;
	}

 	.lineUp { 
 	  margin-top: 3px;
 	  animation: 3s anim-lineUp ease-out 1; 
 	} 
 	@keyframes anim-lineUp { 
 	  0% { 
 	    opacity: 0; 
 	    transform: translateY(80%); 
 	  } 
 	  20% { 
 	    opacity: 0; 
 	  } 
 	  50% { 
 	    opacity: 1; 
 	    transform: translateY(0%); 
 	  } 
 	  100% { 
 	    opacity: 1; 
 	    transform: translateY(0%); 
 	  } 
/*  	  delay  */
 	} 
 	
 	.room-title {
 		padding-bottom: -2px;
 	}

/* 	orgchartModal dropdown 설정 */
	.myDropdown {
		position: absolute;
		margin-top: -10px;
		margin-left: -10px;
	}
	
	.toast-top-right {
		top:10%;
	}	
	
	hr.myIndexHr {
		height: 2px;
		color: #FF6F61;
	}

	hr.myScheduleDivider {
		height: 1px;
		color: #FF6F61;
	}

	
	
</style>


</head>
<body class="overflow-hidden" data-context-path="${pageContext.request.contextPath }"  data-cmp-id="${realUser.empCmpId }" data-emp-no="${realUser.empNo }" data-user-name="${employeeVO.empName}" data-user-role="${realUser.empRole}">
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<tiles:insertAttribute name="sideMenu"/>
		<div class="layout-page">
			<tiles:insertAttribute name="headerMenu"/>
			<div class="content-wrapper">
				<div id="div-body" class="container-fluid flex-grow-1 container-p-y">
							<tiles:insertAttribute name="contentPage"/>	
				</div>
				<tiles:insertAttribute name="footer"/>
			</div>
		</div>
		</div>
	</div>
<tiles:insertAttribute name="postScript"/>
<tiles:insertAttribute name="chooseScript"/>

<!-- <script type="text/javascript" id="commonScript">
	const msgUrl = 'ws://' + window.location.host + '${pageContext.request.contextPath}/messageServerEndpoint';
	const userName = `${realUser.empNo}`;
</script>
웹소켓 스크립트 -->
<script src="<c:url value="/resources/js/websocketMessage.js" />" id="websocketScript" defer="defer"></script>



</body>
</html>

