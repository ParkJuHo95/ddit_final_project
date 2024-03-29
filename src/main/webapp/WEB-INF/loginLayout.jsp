<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%response.setDateHeader("Expires", 0);  %>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath }/resources/assets/"
  data-template="vertical-menu-template-free"
>
<head>
<meta charset="utf-8" />
<meta
name="viewport"
content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
/>
<meta name="description" content="" />
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
</style>
</head>
<body data-context-path="${pageContext.request.contextPath }">
	<!-- Layout wrapper -->
<!-- 	<div class="layout-wrapper layout-content-navbar" style="position: fixed;"> -->
<!-- 		<div class="layout-container"> -->
<!-- 		<div class="layout-page"> -->
<!-- 			<div class="content-wrapper"> -->
				<tiles:insertAttribute name="contentPage"/>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<tiles:insertAttribute name="postScript"/>
</body>
</html>














